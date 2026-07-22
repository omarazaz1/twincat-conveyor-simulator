# Push to GitHub

In PowerShell inside this folder:

```powershell
git init
git add .
git commit -m "Initial TwinCAT conveyor simulator"
git branch -M main
git remote add origin https://github.com/YOUR_USERNAME/twincat-conveyor-simulator.git
git push -u origin main
```

Create the GitHub repository first and leave it empty.

After the TwinCAT project runs, save the actual `.sln`, `.tsproj`, and PLC project
folder inside this repository, then commit and push again.
