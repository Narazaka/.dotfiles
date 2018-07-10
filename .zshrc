if [ -f ~/.zshenv ] ; then ; source ~/.zshenv ; fi
if [ -f ~/.zplug/init.zsh ] ; then
  source ~/.zplug/init.zsh
  source ~/.zpluglist.zsh
  if ! zplug check --verbose; then
    printf 'Install? [y/N]: '
    if read -q; then
      echo; zplug install
    fi
  fi
  zplug load --verbose

  if zplug check "mollifier/anyframe" ; then
    bindkey '^xf' anyframe-widget-insert-filename
    bindkey '^x^b' anyframe-widget-checkout-git-branch
    bindkey '^xb' anyframe-widget-insert-git-branch
    # bindkey '^xg' anyframe-widget-git-add
    # bindkey '^x^h' anyframe-widget-execute-history
    bindkey '^x^h' anyframe-widget-put-history
  fi
fi


zcompile ~/.zshrc # compile zshrc
export LANG=en_US.UTF-8
export PATH=~/.bin:~/local/bin:~/.usr/bin:~/.cargo/bin:${PATH}
export PATH=node_modules/.bin:${PATH}

# ssh経由でログインしているか
if [ -n "$SSH_CLIENT" -o -n "$SSH_TTY" -o "`ps -o comm= -p $PPID`" = "sshd" ] ; then
  IS_REMOTE_LOGIN_SHELL=1
fi

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

autoload -Uz add-zsh-hook # precmd etc

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
autoload -Uz vcs_info

PROMPT_COLOR="%{$bg[default]%}%{$fg_bold[white]%}"
PROMPT2_COLOR="%{$fg_bold[magenta]}"
SPROMPT_COLOR="%{$fg_bold[red]%}"
RPROMPT_COLOR="%{$fg_bold[yellow]%}"

if [ $IS_REMOTE_LOGIN_SHELL ] ; then
  PROMPT_HOST_COLOR="%{$bg[yellow]%}%{$fg_bold[red]%}"
else
  PROMPT_HOST_COLOR="%{$fg_bold[yellow]%}"
fi
PROMPT_TIME_COLOR="%{$fg_bold[green]%}"
PROMPT_SUCCESS_COLOR="%{$fg_bold[blue]%}"
PROMPT_FAIL_COLOR="%{$fg_bold[red]%}"
PROMPT_LAST_CMD_STATUS_COLOR="%(?.${PROMPT_SUCCESS_COLOR}.${PROMPT_FAIL_COLOR})" # $? : 最後のコマンドの終了ステータス
PROMPT_VCS_COLOR="%{$fg_bold[white]%}"
PROMPT_VCS_BRANCH_COLOR="%{$fg[green]%}"
PROMPT_VCS_STAGED_COLOR="%{$fg[yellow]%}"
PROMPT_VCS_UNSTAGED_COLOR="%{$fg[red]%}"
PROMPT_VCS_ACTION_COLOR="%{$fg[yellow]%}"
#	PROMPT2_COLOR="%{[1m[35m%}"
#	SPROMPT_COLOR="%{[1m[31m%}"
#	RPROMPT_COLOR="%{[1m[33m%}"
case ${UID} in
	0)
#	PROMPT_COLOR="%{[1m[31m%}"
	PROMPT_USER_COLOR="%{$fg_bold[red]%}"
	;;
	*)
	PROMPT_USER_COLOR="%{$fg_bold[cyan]%}"
	;;
esac
#PROMPT_RESET_COLOR="%{[m%}"
PROMPT_RESET_COLOR="%{$reset_color%}"

# prompt -l # プロンプトテーマを表示するコマンド
PROMPT_LAST_CMD_STATUS="%(?.O.X)" # $? : 最後のコマンドの終了ステータス
PROMPT_END="%(!.#.$) "
PROMPT2_END="%_> "
PROMPT_VAL_PLACE_HOME="%~"
PROMPT_VAL_PLACE="%/"
PROMPT_VAL_USER="$USER" # %n
PROMPT_VAL_HOST="%m"
PROMPT_VAL_HOST_LONG="%M"
PROMPT_VAL_TIME="%*"
zstyle ':vcs_info:*' enable git svn bzr hg
zstyle ':vcs_info:git:*' check-for-changes true # enable %c,%u
zstyle ':vcs_info:git:*' stagedstr "${PROMPT_VCS_STAGED_COLOR}" # %c : has staged not commited entries
zstyle ':vcs_info:git:*' unstagedstr "${PROMPT_VCS_UNSTAGED_COLOR}" # %u : has not staged not commited entries
zstyle ':vcs_info:*' formats "${PROMPT_VCS_COLOR}[${PROMPT_VCS_BRANCH_COLOR}%c%u%b${PROMPT_VCS_COLOR}]" # %s=vcs name / %b=branch
zstyle ':vcs_info:*' actionformats "${PROMPT_VCS_COLOR}[${PROMPT_VCS_BRANCH_COLOR}%c%u%b${PROMPT_VCS_COLOR}]${PROMPT_VCS_COLOR}(${PROMPT_VCS_ACTION_COLOR}%a${PROMPT_VCS_COLOR})" # %a=action
precmd_vcs_info() {
  LANG=C vcs_info
  PROMPT_VAL_VCS="${vcs_info_msg_0_}"
  PROMPT="${PROMPT_LAST_CMD_STATUS_COLOR}${PROMPT_LAST_CMD_STATUS}${PROMPT_USER_COLOR}${PROMPT_VAL_USER}${PROMPT_COLOR}@${PROMPT_HOST_COLOR}${PROMPT_VAL_HOST}${PROMPT_COLOR}${PROMPT_VAL_VCS}${PROMPT_COLOR}${PROMPT_END}${PROMPT_RESET_COLOR}"
}
add-zsh-hook precmd precmd_vcs_info
PROMPT2="${PROMPT2_COLOR}${PROMPT2_END}${PROMPT_RESET_COLOR}"
SPROMPT="${SPROMPT_COLOR}Correct${PROMPT_RESET_COLOR} '%R' -> '%r' [nyae]?"
RPROMPT="[${RPROMPT_COLOR}${PROMPT_VAL_PLACE_HOME}${PROMPT_RESET_COLOR}]${PROMPT_RESET_COLOR}"

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
alias bec='bundle exec'
alias rake='noglob rake'
case ${OSTYPE} in
  darwin*)
    alias shoes='/Applications/Shoes.app/Contents/MacOS/shoes'
    ;;
esac
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
# capistrano用ステージリスト
alias cst='find config/deploy -name "*.rb" | perl -nle "print /([^\\/]+)\.rb$/;print \"-\"x10;open F, \$_;print grep /^server|rails_env/, <F>"'
alias g='git'

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
