echo -e "\n[$] > Creating folders hierarchy..."
mkdir -p $HOME/downloads &&
mkdir -p $HOME/projects &&
mkdir -p $HOME/documents &&
mkdir -p $HOME/documents/notes &&
mkdir -p $HOME/documents/books &&
mkdir -p $HOME/documents/music &&
mkdir -p $HOME/documents/videos &&
mkdir -p $HOME/documents/pictures &&

mkdir -p $HOME/.own/bin &&
mkdir -p $HOME/.own/scripts &&
mkdir -p $HOME/.own/go &&
mkdir -p $HOME/.own/zig/src &&
mkdir -p $HOME/.own/zig/lsp &&
mkdir -p $HOME/.own/rust/cargo &&
mkdir -p $HOME/.own/rust/rustup &&
mkdir -p $HOME/.config &&
mkdir -p $HOME/.themes &&
mkdir -p $HOME/.icons &&
mkdir -p $HOME/.local/share/fonts &&
mkdir -p $HOME/.mozilla/firefox/main.main/chrome &&
mkdir -p $HOME/.mozilla/firefox/main.main/assets &&
mkdir -p $HOME/.mozilla/firefox/main.main/extensions
echo -e "\n[$] > Hierarchy created successfully!"
