" basic settings
execute pathogen#infect()
set number
syntax on
filetype plugin indent on
set nobackup
set nowritebackup
set swapfile
set dir=/tmp
set laststatus=2
set nowrap
set cursorline
set noshowmode
set list
set scrolloff=7
autocmd FileType nerdtree :call GetFt()

" use indents of 4 spaces
set shiftwidth=4
" tabs are tabs
set noexpandtab
" an indentation every four columns
set tabstop=4
" let backspace delete indent
set softtabstop=4
" enable auto indentation
set autoindent
" I always linger on the shift key...
:command WQ wq
:command Wq wq
:command Wqa wqa
:command W w
:command Q q


" functions
function Minimalify()
	if &laststatus
		setlocal laststatus=0
	else
		setlocal laststatus=2
	endif
	set noshowmode! list! number! cursorline!
	:GitGutterSignsToggle
endfunction

function! ChangeBack()
	:hi CursorColumn ctermbg=10
	:setlocal colorcolumn=1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,157,158,159,160,161,162,163,164,165,166,167,168,169,170,171,172,173,174,175,176,177,178,179,180,181,182,183,184,185,186,187,188,189,190,191,192,193,194,195,196,197,198,199,200,201,202,203,204,205,206,207,208,209,210,211,212,213,214,215,216,217,218,219,220,221,222,223,224,225,226,227,228,229,230,231,232,233,234,235,236,237,238,239,240,241,242,243,244,245,246,247,248,249,250,251,252,253,254,255,256
endfunction

function! GetFt()
	if &filetype == "nerdtree"
		:call ChangeBack()
	endif
endfunction

" minimal current line indicator
set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %{LineNoIndicator()}
let g:line_no_indicator_chars = [' ', '▁', '▂', '▃', '▄', '▅', '▆', '▇', '█']

" git gutter settings
let g:gitgutter_override_sign_column_highlight = 0
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '±'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '^'
let g:gitgutter_sign_modified_removed = '∆'

" strip trailing whitespaces
autocmd BufWritePre * %s/\s\+$//e

" ui settings
let g:enable_bold_font = 1
let g:enable_italic_font = 1
colorscheme agila
set listchars=tab:│\ ,eol:¬,nbsp:␣,trail:•,extends:>,precedes:<

" keybindings
map <F1> :NERDTreeCWD
map <F2> :NERDTreeToggle
map <F3> :call Minimalify()
map <F5> :split
map <F6> :vsplit
map <F9> :GitGutterSignsToggle

" airline
let g:airline_powerline_fonts = 1
let g:airline_section_x = '%{&filetype}'
let g:airline_section_y = '%#__accent_bold#%{LineNoIndicator()}%#__restore__#'
let g:airline_section_z = '%2c'

" youcompleteme
let g:ycm_error_symbol = ' '
let g:ycm_warning_symbol = ' '
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_completion = 0
let g:ycm_confirm_extra_conf = 0

" NERDTree
let NERDTreeShowHidden = 1
let g:NERDTreeWinSize=35
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
let g:NERDTreeWinPos = "right"

" Autoclose nerdtree if it is the only open buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
