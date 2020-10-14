call plug#begin()
  Plug 'preservim/nerdtree'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'honza/vim-snippets'
  Plug 'natebosch/dartlang-snippets'
  Plug 'preservim/nerdcommenter'
  Plug 'junegunn/fzf'
  Plug 'junegunn/fzf.vim'
  Plug 'sheerun/vim-polyglot'
  Plug 'dart-lang/dart-vim-plugin'
  Plug 'vim-airline/vim-airline'
  "Colors
  Plug 'sainnhe/gruvbox-material'
  Plug 'flazz/vim-colorschemes'
call plug#end()

" nerd tree 
let g:NERDTreeHijackNetrw=0  " tree enabled by default
nmap <F6> :NERDTreeToggle<CR>
" =========================================

let mapleader = ","              " Leader

colorscheme gruvbox
colorscheme gruvbox-material
"set termguicolors
" Enable Statusline ===========================================================

"end of status line ===========================================================

" vertical split
nnoremap <silent> <bar> :vs<CR>

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
set ttimeoutlen=0

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
  "End of Syntastic plugin

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Splits
nnoremap <silent> \| :vs<CR>
nnoremap <silent> <C-l> <C-w>l
nnoremap <silent> <C-h> <C-w>h
nnoremap <silent> <C-j> <C-w>j
nnoremap <silent> <C-k> <C-w>k


":hi clear CursorLine
":hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=grey40 guifg=white
":hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=grey40 guifg=white
let g:coc_disable_startup_warning = 1

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)


" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

nmap <leader>sr :CocSearch <C-R>=expand("<cword>")<CR><CR>

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }

nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300
  " Recently vim can merge signcolumn and number column into one
set signcolumn=number


inoremap kj <esc>
nmap <Leader>wq :x<cr>
nmap <Leader>w :w<cr>
nmap <Leader>qq :q!<cr>

