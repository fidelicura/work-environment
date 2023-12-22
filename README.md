# Description

I love Void Linux. It is **simple**, **bloatless** and **cozy**.
Also, I love BSPWM. It is **fast**, **modular** and **cozy**.

# Showcase

![Terminal (`kitty`)](showcase/terminal.png)
![Browser (`firefox`)](showcase/browser.png)
![Messenger (`telegram`)](showcase/messenger.png)
![Reader (`zathura`)](showcase/reader.png)

# Apps

- [x] Distro: [void](https://voidlinux.org/) because it is © ["just based"](https://youtu.be/rRFIlBIYCBY?feature=shared&t=9)
- [x] Theme: [gruvbox](https://github.com/morhetz/gruvbox)
- [x] Font: [iosevka]() with [custom build config](/files/assets/fonts/.local/share/fonts/private-build-plans.toml)
- [x] WM: [bspwm](https://github.com/baskerville/bspwm)
- [x] Hotkey Daemon: [sxhkd](https://github.com/baskerville/sxhkd)
- [x] Compositor: [picom](https://github.com/yshui/picom/) by [yshui](https://github.com/yshui)
- [x] Notifications: [dunst](https://github.com/dunst-project/dunst)
- [x] Shell: [bash](https://www.gnu.org/software/bash) with [custom scripts](/files/home/tilde/.bashrc)
- [x] Text Editor: [helix](https://github.com/helix-editor/helix)
- [x] Terminal: [alacritty](https://github.com/alacritty/alacritty) because of [bitmap support](https://github.com/kovidgoyal/kitty/issues/97)
- [x] App Launcher: [rofi](https://github.com/davatorium/rofi)
- [x] Browser: [firefox](https://www.mozilla.org/en-US/firefox/new/) with custom [user.js](/configs/firefox/.mozilla/firefox/main.main/user.js)
- [x] Reader: [zathura](https://git.pwmt.org/pwmt/zathura)
- [x] System Monitor: [bottom](https://github.com/ClementTsang/bottom)
- [x] MIME: [handlr](https://github.com/chmln/handlr) instead of [xdg-open](https://portland.freedesktop.org/doc/xdg-open.html)

# Bootstraping

If you want to use `install.sh` script, then you have to reinstall Void Linux <small>(musl)</small> from zero and run it after reboot from `void-installer`.
Also, you are free to rewrite it to your own kind: I tried to make it as simple as for newbies-welcome.

# Additionals

There is not everything that I wanted to include in this bootstrap.
To be "fully-qualified", you'll need to install:
- `Outline CLI` (VPN tool):
  - https://github.com/Jigsaw-Code/outline-sdk/tree/main/x/examples/outline-cli as `outline` under `/usr/local/bin`;
- `gruvbox` theme for `Telegram`, `VK`, `Zulip`, `YouTube`, `GitHub` and `Discord`:
  - https://t.me/addtheme/qoopdata - telegram;
  - https://uso.kkx.one/style/136259 - vk;
  - https://uso.kkx.one/style/168342 - zulip;
  - https://userstyles.world/api/style/7261.user.css - youtube;
  - https://userstyles.world/style/4653/gruvbox-github - github;
  - https://userstyles.world/style/2326/discord-gruvbox - discord;
- `duckduckgo` json settings from `$HOME/.mozilla/firefox/main.main/duckduckgo.json`;
- `Obsidian`:
  - from official website as AppImage and put under `$HOME/.own/obsidian`;
  - replace name of desktop entry from `/home/fidelicura/...` to your user name folder;
- `Discord`:
  - from official website as `tar.gz`, unzip and put under `$HOME/.own/discord`;
  - replace name of desktop entry from `/home/fidelicura/...` to your user name folder;
