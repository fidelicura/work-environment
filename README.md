# Description

I love Void Linux. It is **simple**, **bloatless** and **cozy**. Also, I love BSPWM - it is **fast**, **modular** and **cozy**.

>I prefer `clang` and `musl` over `gcc` and `glibc` and I don't use any bar

# Showcase

![Terminal (`kitty`)](showcase/terminal.png)
![Browser (`firefox`)](showcase/browser.png)
![Messenger (`telegram`)](showcase/messenger.png)
![Reader (`zathura`)](showcase/reader.png)

# Apps

- [x] Distro: [void](https://voidlinux.org/) because it is © ["just based"](https://youtu.be/rRFIlBIYCBY?feature=shared&t=9)
- [x] Theme: [gruvbox](https://github.com/morhetz/gruvbox)
- [x] WM: [bspwm](https://github.com/baskerville/bspwm)
- [x] Hotkey Daemon: [sxhkd](https://github.com/baskerville/sxhkd)
- [x] Compositor: [picom](https://github.com/yshui/picom/) by [yshui](https://github.com/yshui)
- [x] Shell: [bash](https://www.gnu.org/software/bash) with [custom scripts](/configs/tilde/.bashrc)
- [x] Text Editor: [helix](https://github.com/helix-editor/helix)
- [x] Terminal: [kitty](https://github.com/kovidgoyal/kitty) because of [ligature support](https://github.com/alacritty/alacritty/issues/50)
- [x] App Launcher: [rofi](https://github.com/davatorium/rofi)
- [x] Browser: [firefox](https://www.mozilla.org/en-US/firefox/new/) with custom [user.js](/configs/firefox/.mozilla/firefox/main.main/user.js)
- [x] Reader: [zathura](https://git.pwmt.org/pwmt/zathura)
- [x] Preview: [glow](https://github.com/charmbracelet/glow)
- [x] System Monitor: [bottom](https://github.com/ClementTsang/bottom)
- [x] MIME: [handlr](https://github.com/chmln/handlr) instead of [xdg-open](https://portland.freedesktop.org/doc/xdg-open.html)

# Bootstraping

If you want to use `install.sh` script, then you have to reinstall Void Linux <small>(musl)</small> from zero and run it after reboot from `void-installer`.
Also, you are free to rewrite it to your own kind: I tried to make it as simple as for newbies-welcome.

# Additionals

There is not everything that I wanted to include in this bootstrap.
To be "fully-qualified", you'll need to install:
- `Zig` (programming language) + `zls` (language server for `Zig`):
  - according folders (under the `$HOME/.own/`: `zig/src` for `Zig`, `zig/lsp` for `zls`);
- `marksman` (language server for `Markdown`):
  - install https://github.com/artempyanykh/marksman/releases and move to `$HOME/.own/marksman/`;
- `Outline CLI` (VPN tool):
  - https://github.com/Jigsaw-Code/outline-sdk/tree/main/x/examples/outline-cli as `output` under `/usr/local/bin`;
- `gruvbox` theme for `Telegram`, `Firefox` and `YouTube`:
  - https://t.me/addtheme/qoopdata - telegram;
  - https://addons.mozilla.org/en-US/firefox/addon/gruvbox-true-dark/ - firefox;
  - https://userstyles.world/api/style/7261.user.css - youtube;
