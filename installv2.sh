#!/bin/bash
set -e

echo_title() {
  echo -e "\n\033[1;36m👉 $1\033[0m"
}

update_system() {
  echo_title "Updating system..."
  sudo apt update && sudo apt upgrade -y
}

install_fish() {
  echo_title "Installing Fish shell..."
  sudo apt-add-repository ppa:fish-shell/release-3
  sudo apt update
  sudo apt install -y fish curl git build-essential libssl-dev libreadline-dev zlib1g-dev
  mkdir -p ~/.config/fish
  chsh -s "$(which fish)"
}

install_starship() {
  echo_title "Installing Starship prompt..."
  curl -sS https://starship.rs/install.sh | sh -s -- -y
  mkdir -p ~/.config/fish
  grep -q "starship init fish" ~/.config/fish/config.fish || echo 'starship init fish | source' >> ~/.config/fish/config.fish
}

install_atuin() {
  echo_title "Installing Atuin shell history..."
  bash <(curl -sSL https://raw.githubusercontent.com/atuinsh/atuin/main/install.sh)
  atuin import auto || true
  grep -q "atuin init fish" ~/.config/fish/config.fish || echo 'atuin init fish | source' >> ~/.config/fish/config.fish
}

install_tmux() {
  echo_title "Installing Tmux + TPM..."
  sudo apt install -y tmux
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm || true
}

install_fish_plugins() {
  echo_title "Installing Fisher + Fish plugins..."

  fish -c 'curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher'

  fish -c 'fisher install jethrokuan/z'
  fish -c 'fisher install PatrickF1/fzf.fish'
  fish -c 'fisher install jorgebucaran/nvm.fish'
  fish -c 'fisher install meaningful-ooo/sponge'
}

install_nvm_node() {
  echo_title "Installing NVM + Node LTS..."
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"
  nvm install --lts
  nvm use --lts
}

install_rbenv_ruby() {
  echo_title "Installing rbenv + ruby-build + Ruby 3.3.0..."
  git clone https://github.com/rbenv/rbenv.git ~/.rbenv || true
  cd ~/.rbenv && src/configure && make -C src
  mkdir -p ~/.rbenv/plugins
  git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build || true

  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(~/.rbenv/bin/rbenv init -)"
  ~/.rbenv/bin/rbenv install -s 3.3.0
  ~/.rbenv/bin/rbenv global 3.3.0

  grep -q 'rbenv init - fish' ~/.config/fish/config.fish || echo 'status --is-interactive; and ~/.rbenv/bin/rbenv init - fish | source' >> ~/.config/fish/config.fish
}

install_ruby_gems() {
  echo_title "Installing Ruby gems: bundler, rails..."
  gem install bundler
  gem install rails
}

symlink_dotfile() {
  local source_file="$1"
  local target_file="$2"

  if [ -e "$target_file" ] && [ ! -L "$target_file" ]; then
    echo "⚠️  Skipping $target_file – already exists and is not a symlink."
  elif [ -L "$target_file" ]; then
    echo "🔗 $target_file already symlinked. Skipping."
  else
    ln -s "$source_file" "$target_file"
    echo "✅ Symlinked $target_file → $source_file"
  fi
}

symlink_wezterm_config() {
  echo_title "🔗 Symlinking wezterm.lua (Windows config)"

  local win_home
  win_home="$(wslpath -w ~ | sed 's/\\/\//g' | sed 's/C:/\/mnt\/c/')"

  symlink_dotfile "$(pwd)configs/wezterm/.wezterm.lua" "$win_home/wezterm.lua" 
}

main() {
  update_system
  install_fish
  install_starship
  install_atuin
  install_tmux
  install_fish_plugins
  install_nvm_node

  if [ ! -d "$HOME/.rbenv" ]; then
  install_rbenv_ruby
  install_ruby_gems
  else
    echo_title "📦 rbenv already installed – skipping Ruby install & gem setup."
  fi

  symlink_wezterm_config

  echo_title "Symlinking config.fish"
  symlink_dotfile "$(pwd)/config/fish/config.fish" "~/.config/fish/config.fish"
  echo_title "Symlinking .tmux.conf"
  symlink_dotfile "$(pwd)/config/.tmux.conf" "~/.tmux.conf"

  echo -e "\n✅ All done! Restart your WSL shell or run: \033[1mexec fish\033[0m"
}

main "$@"
