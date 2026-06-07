====================================================
GIT COMMANDS CHEAT SHEET (WINDOWS CMD)
====================================================

---------------------------
1. INITIAL SETUP
---------------------------

Check Git Version:
git --version

Set Username:
git config --global user.name "Your Name"

Set Email:
git config --global user.email "your@email.com"

View Configuration:
git config --list

---------------------------
2. CREATE REPOSITORY
---------------------------

Initialize Git:
git init

Clone Existing Repository:
git clone <repository-url>

Example:
git clone https://github.com/user/repo.git

---------------------------
3. CHECK STATUS
---------------------------

Check Repository Status:
git status

View Commit History:
git log

Compact Log:
git log --oneline

Graph View:
git log --oneline --graph --all

---------------------------
4. ADD FILES
---------------------------

Add Specific File:
git add filename.txt

Add Multiple Files:
git add file1.txt file2.txt

Add All Files:
git add .

---------------------------
5. COMMIT CHANGES
---------------------------

Commit Changes:
git commit -m "Commit message"

Add and Commit Tracked Files:
git commit -am "Commit message"

---------------------------
6. REMOTE REPOSITORY
---------------------------

Add Remote:
git remote add origin <repository-url>

View Remote:
git remote -v

Change Remote URL:
git remote set-url origin <new-url>

Remove Remote:
git remote remove origin

---------------------------
7. PUSH CHANGES
---------------------------

First Push:
git push -u origin main

Push Changes:
git push

Push Specific Branch:
git push origin branch-name

Force Push:
git push --force

---------------------------
8. PULL CHANGES
---------------------------

Pull Latest Changes:
git pull

Pull Specific Branch:
git pull origin main

Fetch Without Merge:
git fetch

---------------------------
9. BRANCH COMMANDS
---------------------------

View Branches:
git branch

View Remote Branches:
git branch -r

View All Branches:
git branch -a

Create Branch:
git branch branch-name

Switch Branch:
git checkout branch-name

Create and Switch:
git checkout -b branch-name

(New Method)
git switch branch-name

Create and Switch:
git switch -c branch-name

Rename Branch:
git branch -m new-branch-name

Delete Branch:
git branch -d branch-name

Force Delete Branch:
git branch -D branch-name

---------------------------
10. MERGE BRANCHES
---------------------------

Switch to Target Branch:
git checkout main

Merge Branch:
git merge branch-name

Abort Merge:
git merge --abort

---------------------------
11. STASH
---------------------------

Save Changes:
git stash

View Stashes:
git stash list

Apply Latest Stash:
git stash apply

Apply and Remove:
git stash pop

Delete Stash:
git stash drop

---------------------------
12. UNDO CHANGES
---------------------------

Discard Changes in File:
git checkout -- filename.txt

Restore File:
git restore filename.txt

Restore All Files:
git restore .

Unstage File:
git restore --staged filename.txt

Reset Last Commit (Keep Changes):
git reset --soft HEAD~1

Reset Last Commit (Delete Changes):
git reset --hard HEAD~1

---------------------------
13. TAGS
---------------------------

Create Tag:
git tag v1.0

List Tags:
git tag

Push Tag:
git push origin v1.0

Push All Tags:
git push --tags

---------------------------
14. DELETE REMOTE BRANCH
---------------------------

git push origin --delete branch-name

---------------------------
15. VIEW DIFFERENCES
---------------------------

View Changes:
git diff

View Staged Changes:
git diff --staged

Compare Branches:
git diff branch1..branch2

---------------------------
16. CLEAN UNTRACKED FILES
---------------------------

Preview:
git clean -n

Delete Files:
git clean -f

Delete Files and Folders:
git clean -fd

---------------------------
17. COMMON WORKFLOW
---------------------------

1. Pull latest code
git pull origin main

2. Create branch
git checkout -b feature-login

3. Make changes

4. Add files
git add .

5. Commit
git commit -m "Added login feature"

6. Push branch
git push -u origin feature-login

7. Merge after approval
git checkout main
git pull
git merge feature-login

8. Push merged code
git push origin main

---------------------------
18. GITHUB FIRST TIME PUSH
---------------------------

git init
git add .
git commit -m "Initial commit"
git branch -M main
git remote add origin <repository-url>
git push -u origin main

====================================================
END OF GIT CHEAT SHEET
====================================================
