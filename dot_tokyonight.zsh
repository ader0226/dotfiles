# Tokyo Night color overrides for zsh-syntax-highlighting, zsh-autosuggestions, and LS_COLORS.
# 256-color approximations of the Tokyo Night palette:
#   bg=235  comment=60  fg=146  fg_bright=189
#   red=210 orange=215  yellow=179 green=149
#   teal=115 cyan=117   blue=111   purple=141 magenta=140

# -------- zsh-autosuggestions (ghost-text hint) --------
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=60'

# -------- zsh-syntax-highlighting (typed-command coloring) --------
# Must be set AFTER the plugin is sourced. The plugin runs before this file,
# so values here override its defaults.
typeset -gA ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[default]='fg=189'
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=210,bold'
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=141'
ZSH_HIGHLIGHT_STYLES[alias]='fg=149'
ZSH_HIGHLIGHT_STYLES[suffix-alias]='fg=149'
ZSH_HIGHLIGHT_STYLES[global-alias]='fg=149'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=149'
ZSH_HIGHLIGHT_STYLES[function]='fg=149'
ZSH_HIGHLIGHT_STYLES[command]='fg=149'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=149,italic'
ZSH_HIGHLIGHT_STYLES[autodirectory]='fg=215,italic'
ZSH_HIGHLIGHT_STYLES[hashed-command]='fg=149'
ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=141'
ZSH_HIGHLIGHT_STYLES[path]='fg=111,underline'
ZSH_HIGHLIGHT_STYLES[path_pathseparator]='fg=146'
ZSH_HIGHLIGHT_STYLES[path_prefix]='fg=111'
ZSH_HIGHLIGHT_STYLES[path_prefix_pathseparator]='fg=146'
ZSH_HIGHLIGHT_STYLES[globbing]='fg=215'
ZSH_HIGHLIGHT_STYLES[history-expansion]='fg=141'
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=215'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=215'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]='fg=141'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=179'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=179'
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]='fg=179'
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]='fg=117'
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]='fg=117'
ZSH_HIGHLIGHT_STYLES[back-dollar-quoted-argument]='fg=117'
ZSH_HIGHLIGHT_STYLES[assign]='fg=117'
ZSH_HIGHLIGHT_STYLES[redirection]='fg=179,bold'
ZSH_HIGHLIGHT_STYLES[comment]='fg=60,italic'
ZSH_HIGHLIGHT_STYLES[named-fd]='fg=117'
ZSH_HIGHLIGHT_STYLES[numeric-fd]='fg=117'
ZSH_HIGHLIGHT_STYLES[arg0]='fg=149'
# Bracket matching
ZSH_HIGHLIGHT_STYLES[bracket-error]='fg=210,bold'
ZSH_HIGHLIGHT_STYLES[bracket-level-1]='fg=111'
ZSH_HIGHLIGHT_STYLES[bracket-level-2]='fg=141'
ZSH_HIGHLIGHT_STYLES[bracket-level-3]='fg=149'
ZSH_HIGHLIGHT_STYLES[bracket-level-4]='fg=179'
ZSH_HIGHLIGHT_STYLES[bracket-level-5]='fg=117'
ZSH_HIGHLIGHT_STYLES[cursor-matchingbracket]='standout'

# -------- LS_COLORS (ls / completion file coloring) --------
# Tokyo Night palette in 256-color (fg;5;N or bg;5;N notation)
export LS_COLORS="\
no=00:\
fi=00:\
rs=0:\
di=38;5;111:\
ln=38;5;117:\
mh=00:\
pi=38;5;179;48;5;235:\
so=38;5;141:\
do=38;5;141:\
bd=38;5;179;48;5;235;1:\
cd=38;5;179;48;5;235;1:\
or=38;5;210;48;5;235;1:\
mi=38;5;210;48;5;235;1:\
su=38;5;189;48;5;210:\
sg=38;5;235;48;5;179:\
ca=00:\
tw=38;5;235;48;5;149:\
ow=38;5;235;48;5;111:\
st=38;5;189;48;5;111:\
ex=38;5;149;1:\
*.tar=38;5;210:*.tgz=38;5;210:*.arc=38;5;210:*.arj=38;5;210:*.taz=38;5;210:\
*.lha=38;5;210:*.lz4=38;5;210:*.lzh=38;5;210:*.lzma=38;5;210:*.tlz=38;5;210:\
*.txz=38;5;210:*.tzo=38;5;210:*.t7z=38;5;210:*.zip=38;5;210:*.z=38;5;210:\
*.dz=38;5;210:*.gz=38;5;210:*.lrz=38;5;210:*.lz=38;5;210:*.lzo=38;5;210:\
*.xz=38;5;210:*.zst=38;5;210:*.tzst=38;5;210:*.bz2=38;5;210:*.bz=38;5;210:\
*.tbz=38;5;210:*.tbz2=38;5;210:*.tz=38;5;210:*.deb=38;5;210:*.rpm=38;5;210:\
*.jar=38;5;210:*.war=38;5;210:*.ear=38;5;210:*.sar=38;5;210:*.rar=38;5;210:\
*.alz=38;5;210:*.ace=38;5;210:*.zoo=38;5;210:*.cpio=38;5;210:*.7z=38;5;210:\
*.rz=38;5;210:*.cab=38;5;210:*.wim=38;5;210:*.swm=38;5;210:*.dwm=38;5;210:\
*.esd=38;5;210:\
*.jpg=38;5;141:*.jpeg=38;5;141:*.mjpg=38;5;141:*.mjpeg=38;5;141:*.gif=38;5;141:\
*.bmp=38;5;141:*.pbm=38;5;141:*.pgm=38;5;141:*.ppm=38;5;141:*.tga=38;5;141:\
*.xbm=38;5;141:*.xpm=38;5;141:*.tif=38;5;141:*.tiff=38;5;141:*.png=38;5;141:\
*.svg=38;5;141:*.svgz=38;5;141:*.webp=38;5;141:*.heic=38;5;141:*.avif=38;5;141:\
*.ico=38;5;141:\
*.mov=38;5;215:*.mpg=38;5;215:*.mpeg=38;5;215:*.m2v=38;5;215:*.mkv=38;5;215:\
*.webm=38;5;215:*.ogm=38;5;215:*.mp4=38;5;215:*.m4v=38;5;215:*.mp4v=38;5;215:\
*.vob=38;5;215:*.qt=38;5;215:*.nuv=38;5;215:*.wmv=38;5;215:*.asf=38;5;215:\
*.rm=38;5;215:*.rmvb=38;5;215:*.flc=38;5;215:*.avi=38;5;215:*.fli=38;5;215:\
*.flv=38;5;215:*.gl=38;5;215:*.dl=38;5;215:*.xcf=38;5;215:*.xwd=38;5;215:\
*.yuv=38;5;215:*.cgm=38;5;215:*.emf=38;5;215:*.ogv=38;5;215:*.ogx=38;5;215:\
*.aac=38;5;117:*.au=38;5;117:*.flac=38;5;117:*.m4a=38;5;117:*.mid=38;5;117:\
*.midi=38;5;117:*.mka=38;5;117:*.mp3=38;5;117:*.mpc=38;5;117:*.ogg=38;5;117:\
*.ra=38;5;117:*.wav=38;5;117:*.oga=38;5;117:*.opus=38;5;117:*.spx=38;5;117:\
*.xspf=38;5;117:\
*.pdf=38;5;179:*.doc=38;5;179:*.docx=38;5;179:*.odt=38;5;179:*.ppt=38;5;179:\
*.pptx=38;5;179:*.xls=38;5;179:*.xlsx=38;5;179:*.ods=38;5;179:*.csv=38;5;179:\
*.tsv=38;5;179:\
*.md=38;5;115:*.markdown=38;5;115:*.rst=38;5;115:*.txt=38;5;146:*.log=38;5;146:\
*.json=38;5;215:*.yaml=38;5;215:*.yml=38;5;215:*.toml=38;5;215:*.xml=38;5;215:\
*.ini=38;5;215:*.conf=38;5;215:*.cfg=38;5;215:*.env=38;5;215:\
*.sh=38;5;149:*.bash=38;5;149:*.zsh=38;5;149:*.fish=38;5;149:*.py=38;5;149:\
*.rb=38;5;149:*.js=38;5;149:*.ts=38;5;149:*.tsx=38;5;149:*.jsx=38;5;149:\
*.go=38;5;149:*.rs=38;5;149:*.c=38;5;149:*.cpp=38;5;149:*.cc=38;5;149:\
*.h=38;5;149:*.hpp=38;5;149:*.java=38;5;149:*.kt=38;5;149:*.swift=38;5;149:\
*.lua=38;5;149:*.vim=38;5;149:\
*~=38;5;60:*.bak=38;5;60:*.swp=38;5;60:*.tmp=38;5;60:*.old=38;5;60:\
*.orig=38;5;60:*.part=38;5;60:*.cache=38;5;60:*.dpkg-dist=38;5;60:\
*.dpkg-old=38;5;60:*.ucf-dist=38;5;60:*.ucf-new=38;5;60:*.ucf-old=38;5;60:\
*.rpmnew=38;5;60:*.rpmorig=38;5;60:*.rpmsave=38;5;60:"

# Apply the same palette to zsh tab-completion list
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
