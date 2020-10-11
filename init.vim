call plug#begin()
  Plug 'preservim/nerdtree'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'honza/vim-snippets'
  Plug 'natebosch/dartlang-snippets'
  Plug 'preservim/nerdcommenter'
  Plug 'junegunn/fzf'
  Plug 'junegunn/fzf.vim'
  Plug 'sheerun/vim-polyglot'
  Plug 'vimoxide/vim-statusline'
  Plug 'dart-lang/dart-vim-plugin'

  "Colors
  Plug 'sainnhe/gruvbox-material'
  Plug 'flazz/vim-colorschemes'
call plug#end()

" nerd tree 
let g:NERDTreeHijackNetrw=0  " tree enabled by default
nmap <F6> :NERDTreeToggle<CR>
" =========================================

let mapleader = ","              " Leader
let &ls = 2                             " Set to 0 to disable statusline (if 0, showmode is enabled)

colorscheme gruvbox
colorscheme gruvbox-material
"set termguicolors
" Enable Statusline ===========================================================
function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

set statusline=
set statusline+=%#PmenuSel#
set statusline+=%{StatuslineGit()}
set statusline+=%#LineNr#
set statusline+=\ %f
set statusline+=%m\
set statusline+=%=
set statusline+=%#CursorColumn#
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ %l:%c
set statusline+=\ 
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

