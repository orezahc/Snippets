# sh <(curl -s https://raw.githubusercontent.com/orezahc/Snippets/master/vim-setup.sh)

mkdir -p ~/.vim/colors
git clone https://github.com/altercation/vim-colors-solarized.git
mv vim-colors-solarized/colors/solarized.vim ~/.vim/colors/
rm -rf vim-colors-solarized

cat > ~/.vimrc << EOF
set nocompatible              " be iMproved, required
filetype off                  " required
set backspace=2
set number
syntax enable
set background=dark
let g:solarized_termcolors=256
colorscheme solarized
EOF

