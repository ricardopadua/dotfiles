## Installation

Run the command to copy files over. It will prompt you before replacing if the files already exist.

```sh
curl -H "Cache-Control: no-cache" -sSL \
https://raw.githubusercontent.com/ricardopadua/dotfiles/refs/heads/main/install.sh \
| bash -s -- \
https://github.com/ricardopadua/dotfiles \
~/.dotfiles
```

After installing, open a new terminal window to see the effects.

