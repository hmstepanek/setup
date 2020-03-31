execute pathogen#infect()
" python syntax
set background=dark

" plus these user specific settings
" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

" don't create swap files
set nobackup
set nowritebackup
set noswapfile

" set copy in vim to copy to clipboard
set clipboard=unnamed
" show line numbers
set number

" replace all tabs with 4 spaces
set tabstop=4
set shiftwidth=4
set expandtab

" remove trailing white space on save
autocmd BufWritePre *.py %s/\s\+$//e
autocmd BufWritePre *.yaml %s/\s\+$//e
autocmd BufWritePre *.vimrc %s/\s\+$//e

syntax enable

noremap <leader>s :setlocal spell! spelllang=en_US<cr>
noremap <leader>sm :mkspell! ~/.vim/spellfile.utf-8.add<cr>
set spellfile=$HOME/.vim/spellfile.utf-8.add


" make delete behave
set backspace=indent,eol,start

" add red line at end of line
let &colorcolumn="89"

" render html properly
au BufNewFile,BufRead *.html,*.htm,*.shtml,*.stm set ft=jinja
au BufNewFile,BufRead *.conf set syntax=conf

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" post install (yarn install | npm install) then load plugin only for editing
" supported files
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

" Initialize plugin system
call plug#end()
