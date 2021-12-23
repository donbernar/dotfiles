# dotfiles
My personal configurations and setup scripts

```
git clone ...
./dotfiles/install
```

`brew bundle`

## Submodules

To install a submodule:
```
git submodule add [submodule-repo-url] [submodule-name]
```

Initializing all submodules:
```
git submodule update --init --recursive
```

Upgrading submodules to latest version:
```
git submodule update --init --remote
```

## DotBot

This project is using Dotbot, for more information please take a look to the repo: https://github.com/anishathalye/dotbot

In order to update Dotbot, run the following command:
```
git submodule update --init --remote dotbot
```

## Next steps
* Create install steps in README.md
* Export/Import Iterm2 configuration - DONE
* Export/Import Alfred configuration - DONE
* Export/Import Karabiner configuration - DONE
* Move all MAC related scripts and config to a repo in order to have SO agnostic dotfiles

