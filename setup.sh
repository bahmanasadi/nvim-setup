#!/bin/bash

nvim=~/.config/nvim
bundle=$nvim/bundle
mkdir -p $nvim $nvim/autoload $bundle
curl -LSso $nvim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
git clone https://github.com/altercation/vim-colors-solarized.git $bundle/vim-colors-solarized
git clone https://github.com/neomake/neomake $bundle/neomake
git clone https://github.com/ctrlpvim/ctrlp.vim.git $bundle/ctrlp.vim
git clone https://github.com/sbdchd/neoformat $bundle/neoformat
git clone --depth=1 https://github.com/vim-syntastic/syntastic.git $bundle/syntastic
git clone https://github.com/leafgarland/typescript-vim.git $bundle/typescript-vim
cp ./init.vim $nvim/
