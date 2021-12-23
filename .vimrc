" Autoinstall plugin manager VimPlug

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

syntax on

set number
set nocompatible
set encoding=utf-8
filetype plugin indent on

set expandtab
set shiftwidth=2
set softtabstop=2


" Remove c-a bind since it's used in tmux
map <C-a> <nop>

call plug#begin('~/.vim/plugged')
"{{ Install solarized theme
Plug 'micha/vim-colors-solarized'

"}}
"{{ Configuring NerdTree
Plug 'scrooloose/nerdtree'

  " ---> to hide unwanted files <---
  let NERDTreeIgnore = [ '__pycache__', '\.pyc$', '\.o$', '\.swp',  '*\.swp',  'node_modules/' ]
  " ---> show hidden files <---
  let NERDTreeShowHidden=1
  " ---> autostart nerd-tree when you start vim <---
  autocmd vimenter * NERDTree
  autocmd StdinReadPre * let s:std_in=1
  autocmd VimEnter * if argc() == 0 && !exists("s:stdn_in") | NERDTree | endif
  " ---> close vim if only thing left is nerd-tree <---
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif 
  " ---> toggling nerd-tree using Ctrl-N <---
  map <C-n> :NERDTreeToggle<CR>
"}}

"{{ Configuring Vim Surround
Plug 'tpope/vim-surround'
"}}

"{{ Configuring YouCompleteMe
Plug 'valloric/youcompleteme', { 'do': './install.py' }

  " ---> youcompleteme configuration <---
  let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'

  " ---> compatibility with another plugin (ultisnips) <---
  let g:ycm_key_list_select_completion = [ '<C-n>', '<Down>' ] 
  let g:ycm_key_list_previous_completion = [ '<C-p>', '<Up>' ]
  let g:SuperTabDefaultCompletionType = '<C-n>'
  " ---> disable preview window <---
  set completeopt-=preview
  " ---> navigating to the definition of a a symbol <---
  map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
"}}

"{{ Configuring CtrlP
Plug 'ctrlpvim/ctrlp.vim'

let g:ctrlp_show_hidden = 1
"}}

" Snippets related
source ~/.vim/snippets.vim

"{{ Git integration
" ---> git commands within vim <---
Plug 'tpope/vim-fugitive'
" ---> git changes on the gutter <---
Plug 'airblade/vim-gitgutter'
" ---> nerdtree git changes <---
Plug 'Xuyuanp/nerdtree-git-plugin'
"}}

"{{ Autopairs
" ---> closing XML tags <---
Plug 'alvan/vim-closetag'
" ---> files on which to activate tags auto-closing <---
  let g:closetag_filenames = '*.html,*.xhtml,*.xml,*.vue,*.phtml,*.js,*.jsx,*.coffee,*.erb'
" ---> closing braces and brackets <---
Plug 'jiangmiao/auto-pairs'
"}}

"{{ TMux - Vim integration
Plug 'christoomey/vim-tmux-navigator'
"}}
" Vim and Tmux pane navigation integration
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <c-h> :TmuxNavigateLeft<cr> 
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
" nnoremap <silent> {Previous-Mapping} :TmuxNavigatePrevious<cr>
" Write all buffers before navigating from Vim to tmux pane | 1 - current buffer if changed
let g:tmux_navigator_save_on_switch = 2
" Disable tmux navigator when zooming the Vim pane
let g:tmux_navigator_disable_when_zoomed = 1

" Syntax related
source ~/.vim/syntax.vim

"{{ Fzf vim integration - with fzf already installed in system
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
"}}

"{{ Vim - Tmux integration
Plug 'christoomey/vim-tmux-navigator'
"}}

call plug#end()

"let g:solarized_termtrans = 1
"colorscheme solarized

" Yank text to the OS X clipboard
noremap <leader>y "*y
noremap <leader>yy "*Y

" Preserve indentation while pasting text from the OS X clipboard
noremap <leader>p :set paste<CR>:put  *<CR>:set nopaste<CR>

" Should come after plug#end() to work properly
set background=dark
" solarized options 
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
" ---> If Iterm2 color palette is not solarized <---
" let g:solarized_termcolors=256
" ---> If Iterm2 color palette is solarized <--- 
let g:solarized_termcolors = 16
let g:solarized_termtrans = 1

" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

" zoom a vim pane, <C-w>= to re-balance
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>

colorscheme solarized
