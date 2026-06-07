# Git Commands Cheat Sheet (Windows CMD)

## 1. Initial Setup

### Check Git Version
```cmd
git --version
```

### Set Username
```cmd
git config --global user.name "Your Name"
```

### Set Email
```cmd
git config --global user.email "your@email.com"
```

### View Configuration
```cmd
git config --list
```

---

# 2. Create Repository

### Initialize Git
```cmd
git init
```

### Clone Repository
```cmd
git clone <repository-url>
```

Example:
```cmd
git clone https://github.com/user/repo.git
```

---

# 3. Check Status

### Repository Status
```cmd
git status
```

### Commit History
```cmd
git log
```

### Compact Log
```cmd
git log --oneline
```

### Graph View
```cmd
git log --oneline --graph --all
```

---

# 4. Add Files

### Add Specific File
```cmd
git add filename.txt
```

### Add Multiple Files
```cmd
git add file1.txt file2.txt
```

### Add All Files
```cmd
git add .
```

---

# 5. Commit Changes

### Commit
```cmd
git commit -m "Commit message"
```

### Add and Commit Tracked Files
```cmd
git commit -am "Commit message"
```

---

# 6. Remote Repository

### Add Remote
```cmd
git remote add origin <repository-url>
```

### View Remotes
```cmd
git remote -v
```

### Change Remote URL
```cmd
git remote set-url origin <new-url>
```

### Remove Remote
```cmd
git remote remove origin
```

---

# 7. Push Changes

### First Push
```cmd
git push -u origin main
```

### Push Changes
```cmd
git push
```

### Push Specific Branch
```cmd
git push origin branch-name
```

### Force Push
```cmd
git push --force
```

---

# 8. Pull Changes

### Pull Latest Changes
```cmd
git pull
```

### Pull Specific Branch
```cmd
git pull origin main
```

### Fetch Without Merge
```cmd
git fetch
```

---

# 9. Branch Commands

### View Local Branches
```cmd
git branch
```

### View Remote Branches
```cmd
git branch -r
```

### View All Branches
```cmd
git branch -a
```

### Create Branch
```cmd
git branch branch-name
```

### Switch Branch
```cmd
git checkout branch-name
```

### Create and Switch
```cmd
git checkout -b branch-name
```

### Modern Switch Command
```cmd
git switch branch-name
```

### Create and Switch
```cmd
git switch -c branch-name
```

### Rename Branch
```cmd
git branch -m new-branch-name
```

### Delete Branch
```cmd
git branch -d branch-name
```

### Force Delete Branch
```cmd
git branch -D branch-name
```

---

# 10. Merge Branches

### Switch to Main Branch
```cmd
git checkout main
```

### Merge Branch
```cmd
git merge branch-name
```

### Abort Merge
```cmd
git merge --abort
```

---

# 11. Stash Commands

### Save Changes
```cmd
git stash
```

### View Stashes
```cmd
git stash list
```

### Apply Latest Stash
```cmd
git stash apply
```

### Apply and Remove
```cmd
git stash pop
```

### Delete Stash
```cmd
git stash drop
```

---

# 12. Undo Changes

### Discard File Changes
```cmd
git restore filename.txt
```

### Restore All Files
```cmd
git restore .
```

### Unstage File
```cmd
git restore --staged filename.txt
```

### Undo Last Commit (Keep Changes)
```cmd
git reset --soft HEAD~1
```

### Undo Last Commit (Delete Changes)
```cmd
git reset --hard HEAD~1
```

---

# 13. Tags

### Create Tag
```cmd
git tag v1.0
```

### View Tags
```cmd
git tag
```

### Push Tag
```cmd
git push origin v1.0
```

### Push All Tags
```cmd
git push --tags
```

---

# 14. Delete Remote Branch

```cmd
git push origin --delete branch-name
```

---

# 15. View Differences

### Current Changes
```cmd
git diff
```

### Staged Changes
```cmd
git diff --staged
```

### Compare Branches
```cmd
git diff branch1..branch2
```

---

# 16. Clean Untracked Files

### Preview
```cmd
git clean -n
```

### Delete Untracked Files
```cmd
git clean -f
```

### Delete Untracked Files and Folders
```cmd
git clean -fd
```

---

# 17. Common Workflow

## Pull Latest Code
```cmd
git pull origin main
```

## Create Feature Branch
```cmd
git checkout -b feature-login
```

## Add Files
```cmd
git add .
```

## Commit Changes
```cmd
git commit -m "Added login feature"
```

## Push Branch
```cmd
git push -u origin feature-login
```

## Merge Branch
```cmd
git checkout main
git pull
git merge feature-login
```

## Push Merged Code
```cmd
git push origin main
```

---

# 18. First-Time GitHub Push

```cmd
git init
git add .
git commit -m "Initial commit"
git branch -M main
git remote add origin <repository-url>
git push -u origin main
```

---

# Quick Daily Commands

```cmd
git status
git add .
git commit -m "message"
git pull
git push
git branch
git checkout branch-name
git merge branch-name
git log --oneline
```
