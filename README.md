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

If you are developing javascript, please install prettier and eslint using `yarn add prettier --dev --exact; yarn add --dev eslint-plugin-prettier eslint-config-prettier;` so your code is formated on save. Also installing eslint and flow locally would be detected and used.

