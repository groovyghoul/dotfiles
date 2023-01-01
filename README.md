# dotfiles

My current dotfiles.

## Usage

```bash
cd ~
git clone https://github.com/groovyghoul/dotfiles.git
cd dotfiles
```
### Neovim

#### Linux
```bash
cp -rf nvim ~/.config/
```

#### Windows 
Either copy the folder, or
```bash
cp -r nvim ~/AppData/Local/
```
Create a symbolic link (NOTE: you have to either run Powershell as Administrator, or as a user with permission to create symbolic links.
The following assumes that the repo was cloned to `c:\source\github\`
```bash
New-Item -ItemType SymbolicLink -Path C:\Users\[username]\AppData\Local\nvim -Target C:\source\github\dotfiles\nvim
```

## License
[MIT](https://choosealicense.com/licenses/mit/)
