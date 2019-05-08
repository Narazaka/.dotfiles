#!/bin/sh
git clone https://github.com/riywo/anyenv.git .anyenv
echo 'export PATH="$HOME/.anyenv/bin:$PATH"' >> ~/.zshenv
~/.anyenv/bin/anyenv install --init
echo 'eval "$(anyenv init -)"' >> ~/.zshenv
exec
