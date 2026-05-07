#!/bin/bash
set -e


# Check Ubuntu/Debian
if ! command -v apt >/dev/null 2>&1; then
    echo "This installer is for Ubuntu/Debian systems only."
    exit 1
fi

# Install dependencies
sudo apt update
sudo apt install -y python3 python3-pip

# Install Python packages
pip3 install --upgrade requests --break-system-packages 2>/dev/null || pip3 install --upgrade requests

# Ask for API key
APIKEY=''

if [ -z "$APIKEY" ]; then
    echo "ERROR: API key cannot be empty."
    exit 1
fi

# Save API key permanently
if ! grep -q "GROQ_API_KEY" ~/.bashrc; then
    echo "export GROQ_API_KEY=\"$APIKEY\"" >> ~/.bashrc
else
    sed -i "/GROQ_API_KEY/c\export GROQ_API_KEY=\"$APIKEY\"" ~/.bashrc
fi
export GROQ_API_KEY="$APIKEY"

# Create grok command
sudo tee /usr/local/bin/grok > /dev/null << 'EOF'
#!/usr/bin/env python3

import requests
import os
import sys
import textwrap
import re

API_KEY = os.getenv("GROQ_API_KEY")
URL = "https://api.groq.com/openai/v1/chat/completions"
MODEL = "llama-3.3-70b-versatile"
TIMEOUT = 60
WIDTH = os.get_terminal_size().columns if sys.stdout.isatty() else 100

if not API_KEY:
    print("ERROR: GROQ_API_KEY not set")
    sys.exit(1)

HEADERS = {
    "Authorization": f"Bearer {API_KEY}",
    "Content-Type": "application/json"
}

SYSTEM_PROMPT = {
    "role": "system",
    "content": """You are a helpful, smart, and direct AI assistant.
- Answer any question on any topic: coding, Linux, math, writing, logic, general knowledge, etc.
- Be concise but complete. Don't pad responses.
- For code, always use proper formatting with the language name.
- If you don't know something, say so directly. Don't make things up.
- For step-by-step tasks, number your steps clearly.
- Match your response length to the complexity of the question.
"""
}


def get_ai_response(messages: list) -> str:
    payload = {
        "model": MODEL,
        "messages": messages,
        "max_tokens": 4096,
        "temperature": 0.7,
    }
    try:
        response = requests.post(URL, headers=HEADERS, json=payload, timeout=TIMEOUT)
        response.raise_for_status()
        return response.json()["choices"][0]["message"]["content"]
    except requests.exceptions.Timeout:
        return "ERROR: Request timed out."
    except requests.exceptions.HTTPError as e:
        return f"ERROR: API returned {e.response.status_code} - {e.response.text}"
    except requests.exceptions.RequestException as e:
        return f"ERROR: Network issue - {e}"
    except (KeyError, IndexError):
        return "ERROR: Unexpected API response format."


def print_response(reply: str) -> None:
    print()
    for line in reply.splitlines():
        line = line.replace("**", "")
        line = line.replace("__", "")
        if line.startswith("#"):
            line = "# " + line.lstrip("#").strip()
        if "`" in line:
            parts = re.split(r"`([^`]+)`", line)
            for i, part in enumerate(parts):
                if i % 2 == 1:
                    print(f"  {part}")
                else:
                    if part.strip():
                        print(textwrap.fill(part.strip(), width=WIDTH))
        else:
            if line.strip():
                print(textwrap.fill(line, width=WIDTH))
            else:
                print()
    print()


def one_shot_mode(user_input: str) -> None:
    messages = [SYSTEM_PROMPT, {"role": "user", "content": user_input}]
    reply = get_ai_response(messages)
    print_response(reply)


def interactive_mode() -> None:
    print(f"AI assistant ({MODEL}) | type 'exit' to quit, 'clear' to reset\n")
    messages = [SYSTEM_PROMPT]

    while True:
        try:
            user_input = input("You: ").strip()
        except (KeyboardInterrupt, EOFError):
            print("\nBye.")
            break

        if not user_input:
            continue

        if user_input.lower() in ("exit", "quit"):
            print("Bye.")
            break

        if user_input.lower() == "clear":
            messages = [SYSTEM_PROMPT]
            os.system("clear")
            print(f"AI assistant ({MODEL}) | type 'exit' to quit, 'clear' to reset\n")
            continue

        messages.append({"role": "user", "content": user_input})
        print("Thinking...", end="\r")

        reply = get_ai_response(messages)
        print_response(reply)

        if reply.startswith("ERROR:"):
            messages.pop()
            continue

        messages.append({"role": "assistant", "content": reply})


if __name__ == "__main__":
    if len(sys.argv) > 1:
        one_shot_mode(" ".join(sys.argv[1:]))
    else:
        interactive_mode()
EOF

sudo chmod +x /usr/local/bin/grok

echo ""
echo "==========================================="
echo " Installation complete"
echo "==========================================="
echo ""
echo "IMPORTANT: Run this to activate the API key in your current session:"
echo ""
echo "  source ~/.bashrc"
echo ""
echo "Then run:"
echo ""
echo "  grok"
echo ""
echo "or"
echo ""
echo "  grok \"how to check disk usage in linux\""
echo ""
