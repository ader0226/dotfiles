# dotfiles

個人 shell / 終端機環境設定，主題使用 **Tokyo Night**。由 [chezmoi](https://chezmoi.io) 管理。

## 安裝（新機器一行搞定）

```bash
chezmoi init --apply https://github.com/ader0226/dotfiles
```

chezmoi 會自動：
1. clone 這個 repo 到 `~/.local/share/chezmoi`
2. 將所有設定檔套用到 `$HOME`
3. 執行 `run_once_install-deps.sh` 安裝 oh-my-zsh、powerlevel10k 及兩個 zsh plugin

## 需求

- `zsh`（設為預設 shell：`chsh -s "$(which zsh)"`）
- `git`、`curl`
- 一套 Nerd Font（p10k 用到 nerdfont-v3 圖示）— 推薦 [MesloLGS NF](https://github.com/romkatv/powerlevel10k#meslo-nerd-font-patched-for-powerlevel10k)
- 終端機支援 256 色 / true color

## 日常工作流

```bash
chezmoi edit ~/.zshrc    # 編輯設定（在 source 裡）
chezmoi diff             # 預覽變更
chezmoi apply            # 套用到 $HOME

chezmoi cd               # 進入 source dir
git add -A && git commit -m "..." && git push

chezmoi update           # 其他機器：拉最新並套用
```

## 內容

| 檔案 | 用途 |
|---|---|
| `dot_zshrc.tmpl` | oh-my-zsh 設定；macOS 自動 init Homebrew |
| `dot_p10k.zsh` | powerlevel10k rainbow style，Tokyo Night 色號 |
| `dot_tokyonight.zsh` | Tokyo Night 配色：syntax-highlighting、autosuggestions、LS_COLORS |
| `dot_tmux.conf` | tmux 基本設定 + Tokyo Night 狀態列 |
| `run_once_install-deps.sh` | 首次部署時安裝 oh-my-zsh、powerlevel10k、zsh plugins |
| `.chezmoi.toml.tmpl` | chezmoi config skeleton（供未來 template data 使用） |
