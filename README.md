Here's every Git command you'll actually use, grouped by category.

---

## Setup
```bash
git config --global user.name "Your Name"
# Sets your name for all commits on this machine

git config --global user.email "you@example.com"
# Sets your email for all commits

git config --list
# Shows all your current git configuration
```

---

## Starting a Repo
```bash
git init
# Creates a new empty git repo in current folder

git clone https://github.com/user/repo.git
# Downloads an existing GitHub repo to your machine

git remote add origin <url>
# Links your local repo to a remote GitHub repo

git remote -v
# Shows which remote URLs are connected to your repo

git remote remove origin
# Removes the remote connection
```

---

## Staging & Committing
```bash
git status
# Shows which files are modified, staged, or untracked

git add .
# Stages all changed files

git add filename.txt
# Stages one specific file

git add folder/
# Stages everything inside a specific folder

git commit -m "your message"
# Saves staged files as a snapshot with a message

git commit --amend -m "new message"
# Edits the last commit message (only if not pushed yet)

git diff
# Shows exactly what changed in unstaged files line by line

git diff --staged
# Shows what changed in staged files before committing
```

---

## Push & Pull
```bash
git push origin main
# Uploads local commits to GitHub on main branch

git push origin feature/login
# Pushes a specific branch to GitHub

git push -u origin main
# Pushes and sets default upstream so future pushes just need git push

git push --force
# Force pushes — overwrites remote history. Dangerous in teams

git pull origin main
# Fetches + merges latest changes from GitHub into your local branch

git fetch origin
# Downloads changes from GitHub but does NOT merge them yet

git fetch --all
# Fetches from all remotes
```

---

## Branching
```bash
git branch
# Lists all local branches

git branch -a
# Lists all branches including remote ones

git branch feature/login
# Creates a new branch but stays on current one

git checkout -b feature/login
# Creates AND switches to new branch in one command

git checkout main
# Switches to main branch

git switch feature/login
# Modern way to switch branches (same as checkout)

git switch -c feature/login
# Modern way to create and switch (same as checkout -b)

git branch -d feature/login
# Deletes a branch locally (safe — only if merged)

git branch -D feature/login
# Force deletes a branch locally even if not merged

git push origin --delete feature/login
# Deletes the branch from GitHub
```

---

## Merging
```bash
git merge feature/login
# Merges specified branch into your current branch

git merge --abort
# Cancels a merge in progress if there are conflicts

git merge --no-ff feature/login
# Merges but always creates a merge commit even if fast-forward is possible
```

---

## Stashing
```bash
git stash
# Temporarily saves uncommitted changes and cleans your working directory

git stash pop
# Brings back your stashed changes and removes the stash

git stash list
# Shows all saved stashes

git stash apply stash@{0}
# Applies a specific stash without removing it from list

git stash drop stash@{0}
# Deletes a specific stash

git stash clear
# Deletes all stashes
```

---

## Viewing History
```bash
git log
# Full commit history with author, date, message

git log --oneline
# Compact history — one line per commit with short hash

git log --oneline --graph
# Visual branch and merge history in terminal

git log --oneline -5
# Shows only last 5 commits

git show abc1234
# Shows full details of a specific commit
```

---

## Rollback & Undoing
```bash
git reset --soft HEAD~1
# Undoes last commit, keeps changes staged

git reset --mixed HEAD~1
# Undoes last commit, keeps changes but unstages them (default)

git reset --hard HEAD~1
# Undoes last commit and deletes changes permanently

git revert HEAD
# Creates a new commit that undoes the last commit — safe after pushing

git revert abc1234
# Reverts a specific commit by hash

git restore filename.txt
# Discards changes in a file back to last commit state

git restore --staged filename.txt
# Unstages a file without losing changes

git clean -fd
# Deletes all untracked files and folders permanently
```

---

## Tagging
```bash
git tag v1.0
# Creates a lightweight tag on current commit

git tag -a v1.0 -m "version 1.0"
# Creates an annotated tag with a message

git push origin v1.0
# Pushes a specific tag to GitHub

git push origin --tags
# Pushes all tags to GitHub

git tag
# Lists all tags
```

---

## Rebasing
```bash
git rebase main
# Moves your branch commits on top of main — cleaner history than merge

git rebase --abort
# Cancels a rebase in progress

git rebase --continue
# Continues rebase after resolving conflicts

git rebase -i HEAD~3
# Interactive rebase — lets you edit, squash, or reorder last 3 commits
```

---

## Useful Extras
```bash
git shortlog -sn
# Shows commit count per author

git blame filename.txt
# Shows who wrote each line of a file and when

git bisect start
# Starts binary search to find which commit introduced a bug

git cherry-pick abc1234
# Copies a specific commit from another branch into current branch
```

---

## Quick Reference Cheat Sheet

| Category | Key Commands |
|---|---|
| Setup | config, init, clone |
| Tracking | add, commit, status, diff |
| Remote | push, pull, fetch, remote |
| Branches | checkout -b, merge, branch -d |
| Undo | reset, revert, restore |
| Stash | stash, stash pop |
| History | log, show, blame |
| Advanced | rebase, cherry-pick, bisect |

---

That's the full toolkit. Master the first four categories first — that's 90% of daily Git work. Rebase and cherry-pick come later when you're comfortable.
