#!/bin/sh
git clone --depth 1 --single-branch https://github.com/git/git.git .git-master
echo 'export PATH="$HOME/.git-master/contrib/diff-highlight:$PATH"' >> ~/.zshenv
