if has('win32')
  let $PATH = "C:/usr/PortableGit/bin;C:\usr\strawberry-perl\5.18.0.1-64bit-portable;C:/usr/ctags;C:/usr/curl/7.28.1/bin;C:/usr/openssl;C:\usr\ImageMagick;C:/usr/wbin;".$PATH
  let $GOROOT = "C:/usr/go"
  let $GOPATH = $USERPROFILE."/.go"
  let $PATH = $GOROOT."/bin;".$PATH
  let $PATH = $GOPATH."/bin;".$PATH
end

set runtimepath+=~/.vim/bundle
runtime! ../.vimrc.d/*.vim
