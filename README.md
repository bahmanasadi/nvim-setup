# neovim easy Setup
It is assumed that you already have nvim, curl and git installed on your box.

Once you run the `setup.sh` script, the following plugins will be installed:

  - pathogen
  - vim-colors-solarized
  - neomake
  - ctrlp
  - neoformat
  - syntastic

If you have `ag` installed, ctrlp will use that instead of the default find command. This enhances your experience greately.

If you are developing javascript, please install js-beautify using `npm install js-beautify -g` so your code is formated on save. Also installing eslint and flow locally would be detected and used.

