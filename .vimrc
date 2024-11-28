call plug#begin()
Plug 'rose-pine/vim'
Plug 'itchyny/lightline.vim'
call plug#end()

" PLUGIN SETTINGS "

colorscheme rosepine_moon
let g:disable_bg = 1

set laststatus=2
set noshowmode
set wildmenu
let g:lightline = {
			\ 'colorscheme': 'rosepine_moon', 
			\ 'mode_map': {
			\ 'n' : 'NRM',
			\ 'i' : 'INS',
			\ 'R' : 'REP',
			\ 'v' : 'VIS',
			\ 'V' : 'VLI',
			\ "\<C-v>": 'VBL',
			\ 'c' : 'CMD',
			\ 's' : 'S',
			\ 'S' : 'SL',
			\ "\<C-s>": 'SB',
			\ 't': 'T',
			\ },
			\ }

" BASIC SETTINGS "

set number
set shiftwidth=2
set tabstop=2
set autoindent
set mouse=a

set nobackup
set noswapfile
set noundofile

" COLOR OVERRIDES "

syntax on
hi Visual ctermfg=7
hi Search ctermfg=7
" hi LineNr ctermfg=245
" hi CursorLineNr ctermfg=7
" hi Comment ctermfg=60
" hi Statement ctermfg=12
