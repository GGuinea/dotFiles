"                              ,,      ,,          
"    ▄▄▓▓▓▄▄                   ▓▓      ▓▓          
"   ▓▓Γ   '▓▓     ▓▓▓▓▓▓▓▓▌    ▓▓      ▓▓  ▄▓▓▀▓▓▓ 
"   ╨▓▓▄▄,                     ▓▓██████▓▓ ╔▓▌   ▓▓ 
"      ╙▀▀█▓▓                  ▓▓      ▓▓ ╙▓▄   ▓▓ 
"   ▓▓     ▓▓∩    ▓▓▓▓▓▓▓▓▌    ▓▓      ▓▓  ▀▓▄▄▓▓▓ 
"    ▀▓▓▓▓▓█▀      ╙╙╙╙╙╙╙                 ▓▄  ,▓▓ 
"                                           ▀▀▀▀╚  

call plug#begin()
  Plug 'vimoxide/vim-cinnabar'
  Plug 'vimoxide/vim-quickscope'
  Plug 'vimoxide/vim-sherlock'
  Plug 'vimoxide/vim-spaceline'
  Plug 'vimoxide/vim-vifmd'
  Plug 'preservim/nerdtree'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'kyoz/purify', { 'rtp': 'vim' }
  Plug 'vim-airline/vim-airline-themes'
  Plug 'scrooloose/syntastic'
  Plug 'dart-lang/dart-vim-plugin'
  Plug 'honza/vim-snippets'
  Plug 'natebosch/dartlang-snippets'
  Plug 'tpope/vim-fugitive'
  Plug 'preservim/nerdcommenter'
call plug#end()

colorscheme purify 

autocmd vimenter * NERDTree
let mapleader = ","              " Leader
let &ls = 2                             " Set to 0 to disable statusline (if 0, showmode is enabled)

" Enable Statusline
set arabicshape!
set backspace=indent,eol,start
set cmdheight=1
set complete-=i
set fdm=marker
set hidden
set ignorecase
set incsearch
set mouse=a
set nocp
set noruler
set cursorline
set cursorcolumn
set noshowcmd 
set noswapfile
set nowrap
set nrformats-=octal
set number relativenumber
set termguicolors
set pumheight=20
set scrolloff=2
set selection=exclusive
set showtabline=0
set smartcase
set splitbelow splitright
set virtualedit=block
set wildmenu
set list
set tabstop=4
set shiftwidth=4
set autoindent
set expandtab
if has('gui_running')
  " GUI options here

  if has("gui_macvim")
    set guioptions=
    set macligatures
    set macmeta!
  endif
endif

if has('nvim')
  set inccommand=nosplit
else
  au BufEnter * set tm=500 ttm=0
endif

if &ls == 2 | set nosmd | endif
if exists("&pumwidth") | set pumwidth=40 | endif
  "Syntastic plugin
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
  "End of Syntastic plugin

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
let g:coc_snippet_next = '<tab>'
" Y like D
nnoremap Y y$


" Splits
nnoremap <silent> \| :vs<CR>
nnoremap <silent> <C-l> <C-w>l
nnoremap <silent> <C-h> <C-w>h
"nnoremap <silent> <C-j> <C-w>j
nnoremap <silent> <C-k> <C-w>k

" Bind CTRL+S -> Save
nnoremap <silent> <C-s> :w<cr>
inoremap <silent> <C-s> <C-o><C-s>
cnoremap <silent> <C-s> <C-\><C-c><C-s>

" Bind CTRL+q -> Quit
nnoremap <silent> <C-q> <C-w>q
inoremap <silent> <C-q> <C-o><C-q>
cnoremap <silent> <C-q> <C-\><C-c><C-q>

" Easy paste above/below
nnoremap <silent> <M-p> :put<CR>
nnoremap <silent> <M-P> :put!<CR>

" Easier Indentations
vnoremap < <gv
vnoremap > >gv

" System Clipboard
noremap <Leader>y "*y
noremap <Leader>Y "+y

" Terminal
tnoremap <silent> <ESC><ESC> <C-\><C-N><C-w><C-w>
nnoremap <silent> <Leader>p :VifmdToggle<CR>

" Sherlock
cnoremap <C-p> <C-\>e sherlock#completeBackward()<CR>
cnoremap <C-n> <C-\>e sherlock#completeForward()<CR>

" Quick buffer cycling
nnoremap <silent> <Leader>bn :call exutils#next_buffer()<CR>
nnoremap <silent> <Leader>bp :call exutils#previous_buffer()<CR>

augroup CustomGroup
  autocmd!
  au InsertEnter * set norelativenumber
  au InsertLeave * set relativenumber
  au BufEnter    * set formatoptions-=cro
  au WinEnter    * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&filetype") == "vifmd" | bw! | q | endif
augroup END

:hi clear CursorLine
:hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=grey40 guifg=white
:hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=grey40 guifg=white
let g:coc_disable_startup_warning = 1
