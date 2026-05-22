# dotfiles

個人 shell / 終端機環境設定，主題使用 **Tokyo Night**。

## 內容

| 檔案 | 用途 |
|---|---|
| `.zshrc` | oh-my-zsh 設定，啟用 `git` / `zsh-autosuggestions` / `zsh-syntax-highlighting` 三個 plugin，主題用 powerlevel10k |
| `.p10k.zsh` | powerlevel10k rainbow style 配置，全部色號重新映射到 Tokyo Night 256-color |
| `.tokyonight.zsh` | 集中管理 Tokyo Night 配色：zsh-syntax-highlighting、zsh-autosuggestions、`LS_COLORS`、tab 補完上色 |
| `.tmux.conf` | tmux 基本設定 + Tokyo Night 狀態列 / 邊框 / 訊息列 |
| `install.sh` | 一鍵在新機器上安裝 oh-my-zsh、powerlevel10k、兩個 zsh plugin，並把設定檔 symlink 到 `$HOME` |

## 安裝

```bash
git clone https://github.com/<your-user>/dotfiles.git ~/dotfiles
cd ~/dotfiles
bash install.sh
exec zsh
```

預設用 symlink，這樣之後直接修改 `~/dotfiles/*` 並 `git commit` 即可。
要改成複製檔案而非 symlink：`bash install.sh --copy`。

舊的 dotfile 會被備份成 `*.bak`，不會直接覆蓋。

## 需求

- `zsh`（並設為預設 shell：`chsh -s "$(which zsh)"`）
- `git`、`curl`
- 一套 Nerd Font（p10k 用到 nerdfont-v3 圖示）— 推薦 [MesloLGS NF](https://github.com/romkatv/powerlevel10k#meslo-nerd-font-patched-for-powerlevel10k)
- 終端機支援 256 色 / true color

## Tokyo Night 色票（256-color 近似）

| 用途 | 色號 | Hex |
|---|---|---|
| 深背景 | 235 | `#1a1b26` |
| 註解 / 邊框 | 60 | `#565f89` |
| 前景 | 146 | `#a9b1d6` |
| 亮前景 | 189 | `#c0caf5` |
| red | 210 | `#f7768e` |
| orange | 215 | `#ff9e64` |
| yellow | 179 | `#e0af68` |
| green | 149 | `#9ece6a` |
| teal | 115 | `#73daca` |
| cyan | 117 | `#7dcfff` |
| blue | 111 | `#7aa2f7` |
| purple | 141 | `#bb9af7` |
