#!/bin/sh
git clone https://github.com/riywo/anyenv.git .anyenv
echo 'export PATH="$HOME/.anyenv/bin:$PATH"' >> ~/.zshenv
echo 'eval "$(anyenv init -)"' >> ~/.zshenv
exec $SHELL -l
anyenv install plenv
anyenv install rbenv
anyenv install pyenv
anyenv install ndenv
exec $SHELL -l
