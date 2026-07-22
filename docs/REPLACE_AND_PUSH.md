# Replace the old files and push

Do not delete the hidden `.git` folder.

1. Delete the old project files.
2. Copy all files from this clean package into the same repository folder.
3. Open PowerShell in the repository folder.
4. Run:

```powershell
git status
git add -A
git commit -m "Rebuild project with clean PLC and dual HMI structure"
git push
```

`git add -A` records new files, changed files, and deleted files.
