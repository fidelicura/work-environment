# Description

I love Void Linux. It is simple, bloatless and cozy. Also, I love BSPWM - it is fast, modular and cozy.

>I prefer `clang` and `musl` over `gcc` and `glibc`

# Apps

- [x] Distro: [void](https://voidlinux.org/) because it is © ["just based"](https://youtu.be/rRFIlBIYCBY?feature=shared&t=9)
- [x] Theme: [everforest](https://github.com/sainnhe/everforest) as an alternative of [gruvbox](https://github.com/morhetz/gruvbox)
- [x] WM: [bspwm](https://github.com/baskerville/bspwm)
- [x] Bar: [eww](https://github.com/elkowar/eww/tree/master)
- [x] Hotkey Daemon: [sxhkd](https://github.com/baskerville/sxhkd)
- [x] Compositor: [picom](https://github.com/pijulius/picom) by [pijulius](https://github.com/pijulius)
- [x] Shell: [bash](https://www.gnu.org/software/bash) with [custom scripts](/configs/tilde/.bashrc)
- [x] Text Editor: [helix](https://github.com/helix-editor/helix)
- [x] Terminal: [kitty](https://github.com/kovidgoyal/kitty) because of [ligature support](https://github.com/alacritty/alacritty/issues/50)
- [x] App Launcher: [rofi](https://github.com/davatorium/rofi)
- [x] Browser: [firefox](https://www.mozilla.org/en-US/firefox/new/) with custom [user.js](/configs/firefox/.mozilla/firefox/main.main/user.js)
- [x] Reader: [zathura](https://git.pwmt.org/pwmt/zathura)
- [x] Preview: [presenterm](https://github.com/mfontanini/presenterm)

# Bootstraping

If you want to use `install.sh` script, then you have to reinstall Void Linux <small>(musl)</small> from zero and run it after reboot from `void-installer`.
Also, you are free to rewrite it to your own kind: I tried to make it as simple as for newbies-welcome.

# Additionals

There is not everything that I wanted to include in this bootstrap.
To be "fully-qualified", you'll need to install:
- `Zig` (programming language) + `zls` (language server for `Zig`):
  - according folders (under the `$HOME/.zig/`: `src/` for `Zig`, `lsp/` for `zls`);
- `Outline CLI` (VPN tool):
  - https://github.com/Jigsaw-Code/outline-sdk/tree/main/x/examples/outline-cli as `output` under `/usr/local/bin`;
