if has('win32')
  let $PATH = "C:/usr/PortableGit/bin;".$PATH
  let $PATH = "C:/usr/ctags;".$PATH
  let $PATH = "C:/usr/curl/7.28.1/bin;".$PATH
  let $PATH = "C:/usr/openssl;".$PATH
  let $PATH = "C:/usr/ImageMagick;".$PATH
  let $PATH = "C:/usr/wbin;".$PATH
  let $PATH = "C:/usr/strawberry-perl/5.22.0.1-64bit-PDL/perl/bin;".$PATH
  let $PATH = "C:/usr/ruby/ruby-2.2.3-x64-mingw32/bin;".$PATH
  let $PATH = "C:/usr/WinPython/WinPython-64bit-3.5.1.3Zero/python-3.5.1.amd64;".$PATH
  let $PYTHONPATH = "C:/usr/WinPython/WinPython-64bit-3.5.1.3Zero/python-3.5.1.amd64/Lib"
  let $GOROOT = "C:/usr/go"
  let $GOPATH = $USERPROFILE."/.go"
  let $PATH = $GOROOT."/bin;".$PATH
  let $PATH = $GOPATH."/bin;".$PATH
end

set runtimepath+=~/.vim/bundle
runtime! ../.vimrc.d/*.vim
