
zcompile ~/.zshrc # compile zshrc
export LANG=en_US.UTF-8
export PATH=~/local/bin:${PATH}

########################################
# History
########################################
HISTFILE=~/.zhistory
HISTSIZE=10000
SAVEHIST=10000
setopt extended_history      # 履歴ファイルに開始時刻と経過時間を記録
setopt append_history        # 履歴を追加 (毎回 .zhistory を作るのではなく)
setopt inc_append_history    # 履歴をインクリメンタルに追加
setopt share_history         # 履歴の共有
setopt hist_ignore_all_dups  # 重複するコマンド行は古い方を削除
setopt hist_ignore_dups      # 直前と同じコマンドラインはヒストリに追加しない
unsetopt hist_ignore_space     # スペースで始まるコマンド行はヒストリリストから削除 (→ 先頭にスペースを入れておけば、ヒストリに保存されない)
setopt hist_verify         # ヒストリを呼び出してから実行する間に一旦編集可能を止める
setopt hist_reduce_blanks    # 余分な空白は詰めて記録
unsetopt hist_save_no_dups     # ヒストリファイルに書き出すときに、古いコマンドと同じものは無視する。
setopt hist_no_store         # historyコマンドは履歴に登録しない
setopt hist_expand           # 補完時にヒストリを自動的に展開
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end

# 全履歴の一覧を出力する
function history-all { history -E 1 }

########################################
# cd Help
########################################
setopt auto_cd               # ディレクトリのみで移動
setopt auto_pushd            # 普通に cd するときにもディレクトリスタックにそのディレクトリを入れる
setopt pushd_ignore_dups     # ディレクトリスタックに重複する物は古い方を削除
setopt pushd_to_home         # pushd 引数ナシ == pushd $HOME
setopt pushd_silent          # pushd,popdの度にディレクトリスタックの中身を表示しない

########################################
# Input Help
########################################
setopt correct
setopt extended_glob         # 拡張グロブを有効にする
setopt prompt_subst
zstyle ':completion:*:default' menu select # completion with arrow key
#zstyle ':completion:*:default' menu auto
zstyle ':completion:*' use-cache true # completion cache
#zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' # completion ignore case
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS} # completion color
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([%0-9]#)*=0=01;31' # completion color for kill
zstyle ':completion:*:processes' command 'ps x' # completion for kill : can select from `ps x`

setopt list_packed # compact list
setopt auto_remove_slash     # 補完で末尾に補われた / を自動的に削除
setopt auto_param_slash      # ディレクトリ名の補完で末尾の / を自動的に付加し、次の補完に備える
setopt mark_dirs             # ファイル名の展開でディレクトリにマッチした場合 末尾に / を付加
setopt list_types            # 補完候補一覧でファイルの種別を識別マーク表示 (訳注:ls -F の記号)
unsetopt menu_complete       # 補完の際に、可能なリストを表示してビープを鳴らすのではなく、最初にマッチしたものをいきなり挿入、はしない
setopt auto_list             # ^Iで補完可能な一覧を表示する(補完候補が複数ある時に、一覧表示)
setopt auto_menu             # 補完キー連打で順に補完候補を自動で補完
setopt auto_param_keys       # カッコの対応などを自動的に補完
setopt auto_resume           # サスペンド中のプロセスと同じコマンド名を実行した場合はリジューム
setopt magic_equal_subst # --hoge=completion
setopt numeric_glob_sort     # 数字を数値と解釈してソートする
setopt path_dirs             # コマンド名に / が含まれているとき PATH 中のサブディレクトリを探す
setopt print_eight_bit       # 補完候補リストの日本語を適正表示

#setopt auto_correct          # 補完時にスペルチェック
setopt correct               # スペルミスを補完
#setopt correct_all           # コマンドライン全てのスペルチェックをする

autoload -U predict-on       # 履歴による予測入力 (man zshcontrib)
zle -N predict-on
zle -N predict-off
bindkey '^xp'  predict-on    # Cttl+x p で予測オン
bindkey '^x^p' predict-off   # Cttl+x Ctrl+p で予測オフ

########################################
# Warnings
########################################
setopt nomatch
setopt notify
#unsetopt beep
setopt no_beep               # コマンド入力エラーでBeepを鳴らさない

########################################
# Keyboard
########################################
#bindkey -v # vi like
#bindkey -e # emacs like
setopt no_flow_control # disable C-s, C-q
#unsetopt flow_control        # (shell editor 内で) C-s, C-q を無効にする

# cursor to end of line
bindkey -M viins "$terminfo[cuu1]" up-line-or-history
bindkey -M viins "$terminfo[cud1]" down-line-or-history
bindkey -M viins "$terminfo[kcuu1]" up-line-or-history
bindkey -M viins "$terminfo[kcud1]" down-line-or-history

bindkey -a 'w' push-line
bindkey -a 'H' run-help
bindkey "^[[5C" forward-word # Ctrl+-> = word ->
bindkey "^f" forward-word # Ctrl+f = word ->
bindkey "^[[5D" backward-word # Ctrl+<- = word <-
bindkey "^b" backward-word # Ctrl+b = word <-

########################################
# Complete
########################################
autoload -Uz compinit
compinit
setopt complete_aliases

########################################
# PROMPT
########################################
autoload -Uz colors ; colors

case ${UID} in
	0)
#	PROMPT_COLOR="%{[1m[31m%}"
#	PROMPT2_COLOR="%{[1m[35m%}"
#	SPROMPT_COLOR="%{[1m[31m%}"
#	RPROMPT_COLOR="%{[1m[33m%}"
	PROMPT_COLOR="%{$fg_bold[red]%}"
	PROMPT2_COLOR="%{$fg_bold[magenta]}"
	SPROMPT_COLOR="%{$fg_bold[red]%}"
	RPROMPT_COLOR="%{$fg_bold[yellow]%}"
	;;
	*)
#	PROMPT_COLOR="%{[1m[34m%}"
#	PROMPT_COLOR="%{[1m[36m%}"
#	PROMPT2_COLOR="%{[1m[35m%}"
#	SPROMPT_COLOR="%{[1m[31m%}"
#	RPROMPT_COLOR="%{[1m[33m%}"
	PROMPT_COLOR="%{$fg_bold[cyan]%}"
	PROMPT2_COLOR="%{$fg_bold[magenta]}"
	SPROMPT_COLOR="%{$fg_bold[red]%}"
	RPROMPT_COLOR="%{$fg_bold[yellow]%}"
	;;
esac
#PROMPT_RESET="%{[m%}"
PROMPT_RESET="%{$reset_color%}"

# prompt -l # プロンプトテーマを表示するコマンド
PROMPT_END="%(!.#.$) "
PROMPT2_END="%_> "
PROMPT_VAL_PLACE_HOME="%~"
PROMPT_VAL_PLACE="%/"
PROMPT_VAL_USER="$USER" # %n
PROMPT_VAL_HOST="%m"
PROMPT_VAL_HOST_LONG="%M"
PROMPT_VAL_TIME="%*"
PROMPT="${PROMPT_COLOR}${PROMPT_VAL_USER}@${PROMPT_VAL_HOST}${PROMPT_END}${PROMPT_RESET}"
PROMPT2="${PROMPT2_COLOR}${PROMPT2_END}${PROMPT_RESET}"
SPROMPT="${SPROMPT_COLOR}Correct${PROMPT_RESET} '%R' -> '%r' [nyae]?"
RPROMPT="[${RPROMPT_COLOR}${PROMPT_VAL_PLACE_HOME}${PROMPT_RESET}]"

########################################
# Export
########################################
export EDITOR=vim
export VIEWER=vim

########################################
# ls Help
########################################
eval `dircolors`

########################################
# LS_COLORS
########################################
eval `dircolors ~/.dir_colors -b`
#export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

########################################
# Utility
########################################
#zstyle :compinstall filename '~/.zshrc'

#setopt AUTOLOGOUT=n          # n分後に自動的にログアウト

#setopt complete_in_word
setopt brace_ccl             # ブレース展開機能を有効にする
setopt equals                # =COMMAND を COMMAND のパス名に展開
#setopt auto_name_dirs

setopt hash_cmds             # 各コマンドが実行されるときにパスをハッシュに入れる

#setopt ignore_eof            # C-dでログアウトしない

setopt bsd_echo # 組み込みコマンド echo を、 BSD echo(1) コマンドと互換性のある動作にする。 -e オプションが指定されなければ、与えられた文字列中からバックスラッシュつきのエスケープシーケンスを無効化する。
setopt no_hup                # ログアウト時にバックグラウンドジョブをkillしない
#setopt no_checkjobs          # ログアウト時にバックグラウンドジョブを確認しない
setopt notify                # バックグラウンドジョブが終了したら(プロンプトの表示を待たずに)すぐに知らせる
setopt long_list_jobs        # 内部コマンド jobs の出力をデフォルトで jobs -L にする

#setopt mail_warning
setopt multios               # 複数のリダイレクトやパイプなど、必要に応じて TEE や CAT の機能が使われる
setopt short_loops           # FOR, REPEAT, SELECT, IF, FUNCTION などで簡略文法が使えるようになる
#setopt sun_keyboard_hack     # SUNキーボードでの頻出 typo ` をカバーする
setopt always_last_prompt    # カーソル位置は保持したままファイル名一覧を順次その場で表示
#setopt cdable_vars # cd に与えられる引数がディレクトリではなく、スラッシュから開始されない場合には、先頭が `~' で開始されるように拡張される(`Filename Expansion' を参照のこと)。
setopt sh_word_split # クォートされていない変数拡張が行われたあとで、フィールド分割を行う。このオプションは単語の分割には何の影響も与えない(`Parameter Expansion' を参考のこと)。

setopt rm_star_wait          # rm * を実行する前に確認
#setopt rm_star_silent        # rm * を実行する前に確認しない
#setopt no_clobber            # リダイレクトで上書きを禁止
unsetopt no_clobber

#setopt no_unset              # 未定義変数の使用禁止

setopt interactive_comments  # コマンド入力中のコメントを認める
#setopt chase_links           # シンボリックリンクはリンク先のパスに変換してから実行
setopt print_exit_value      # 戻り値が 0 以外の場合終了コードを表示
#setopt single_line_zle       # デフォルトの複数行コマンドライン編集ではなく、１行編集モードになる
#setopt xtrace                # コマンドラインがどのように展開され実行されたかを表示する

########################################
# aliases
########################################
alias ls='ls --color=auto'
alias la='ls -a' lsa='ls -a'
alias ll='ls -l' lsl='ls -l'
alias lal='ls -la' lla='ls -la' lsal='ls -la' lsla='ls -la'
alias lr='ls -lR' lsr='ls -lR'
alias lra='ls -laR' lar='ls -laR' lsra='ls -laR' lsar='ls -laR'
alias grep='grep --color=auto'
alias pac='pacman-color'
alias -g L='| less'
alias -g G='| grep'
alias -g H='| head'
alias -g T='| tail'
alias -g S='| sed'
alias -g A='| awk'
alias -g W='| wc'
alias nc='sudo netcfg'
alias bzre='bzr explorer'
alias fbterm='LANG=ja_JP.UTF8 fbterm'
# pop command
alias pd='popd'
alias gd='dirs -v; echo -n "select number: ";
read newdir; cd +"$newdir" '
alias h='history'
alias ha='history-all'
alias sc='screen -U'
alias sclose='screen -D'
alias ssh='ssh -o ServerAliveInterval=60'
# HTMLファイルに張り付け用の、タブ、空白、< > の変換コマンド
alias htmlconv='sed -e "s/</\&lt;/g;s/>/\&gt;/g;s/\t/\&nbsp;\&nbsp;\&nbsp;\&nbsp;/g;s/\s/\&nbsp;/g" '

########################################
# Misc
########################################
# タイトルバーの動的変更
precmd() {
[[ -t 1 ]] || return
case $TERM in
sun-cmd) print -Pn "\e]l[%~]\e\\"
 ;;
*xterm*|rxvt|(dt|k|E)term) print -Pn "\e]2;[%~]\a"
 ;;
esac
}

umask 022 # for create files
ulimit -s unlimited  # stack size 制限解除
limit coredumpsize 0 # core 抑制
export G_FILENAME_ENCODING=@locale # Grip などGlibアプリケーション出力での文字化け防止

#sudo() {
#  local args
#  case $1 in
#    vi|vim)
#      args=()
#      for arg in $@[2,-1]
#      do
#        if [ $arg[1] = '-' ]; then
#          args[$(( 1+$#args ))]=$arg
#        else
#          args[$(( 1+$#args ))]="sudo:$arg"
#        fi
#      done
#      command vim $args
#      ;;
#    *)
#      command sudo $@
#      ;;
#  esac
#}

[[ -s ~/.zresources ]] && source ~/.zresources
