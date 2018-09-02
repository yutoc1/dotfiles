"=========================================
"  initial proc
"=========================================
"release autogroup in MyAutoCmd
augroup MyAutoCmd
    autocmd!
augroup END

syntax on

"=========================================
"  encoding
"=========================================
set encoding=UTF-8
set fileencoding=UTF-8
set termencoding=UTF-8

"=========================================
"  general
"=========================================
"markdown filetype define
au BufRead,BufNewFile *.md set filetype=markdown
au BufRead,BufNewFile *.mkd set filetype=markdown

"search
set ignorecase
set smartcase
set incsearch
set hlsearch

"<tab>
set smarttab
set expandtab
set tabstop=4
set shiftwidth=4
set shiftround

"highlight kakko
set matchtime=2
set showmatch
set matchpairs& matchpairs+=<:>

"backup/swapfile
set nowritebackup
set nobackup
set noswapfile
set viminfo+=n~/.cache/vim/.viminfo

"editspace
set infercase
set virtualedit=all
set splitright
set hidden
set switchbuf=useopen
set pumheight=15

"display
set number
set textwidth=0
set colorcolumn=80
set list
set wrap
set laststatus=2

"bell
set t_vb=
set novisualbell
set noerrorbells

"invisible char
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%,eol:↲
""Visible ZenkakuSpace
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=#666666
au BufNewFile,BufRead * match ZenkakuSpace /　/

"clipboard
set clipboard+=unnamed,autoselect
vmap <C-c> :w !xsel -ib<CR><CR>

"=========================================
"  source config
"=========================================
runtime! .vim/config/*.vim

"=========================================
"  key config
"=========================================
"invalidation
nnoremap ZZ <Nop>
nnoremap ZQ <Nop>
nnoremap Q <Nop>

"alter escape
imap <C-k> <esc>
vmap <C-k> <esc>

"overlap visible-mode
vnoremap v $h

"superuser save 
cmap w!! w !sudo tee > /dev/null %

"alter move
noremap <Space>h ^
noremap <Space>l $

" nohlsearch 
nnoremap <silent><C-k><C-k> :<C-u>set nohlsearch<CR>

" insertmode move
inoremap <C-f> <right>
inoremap <C-p> <left>

"app lunch
nnoremap <Space>w :W3mVSplit google<CR>
nnoremap <Space>m :Gmail<CR>
nmap <Space>r <Plug>(quickrun)
nnoremap <silent> <Space>ss :VimShell<CR>
nnoremap <silent> <Space>sp :VimShellInteractive python<CR>
nnoremap <Space>rj :Ref webdict je<Space>
nnoremap <Space>re :Ref webdict ej<Space>
nnoremap <Space>rw :Ref webdict wiki<Space>

"for unite
nnoremap [unite] <Nop>
nmap <Space>u [unite]
nnoremap <silent> [unite]f :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> [unite]b :<C-u>Unite buffer<CR>
nnoremap <silent> [unite]r :<C-u>Unite register<CR>
nnoremap <silent> [unite]m :<C-u>Unite file_mru<CR>
nnoremap <silent> [unite]c :<C-u>Unite bookmark<CR>
nnoremap <silent> [unite]t :<C-u>Unite tab<CR>
nnoremap <silent> [unite]w :<C-u>Unite window<CR>
nnoremap <silent> [unite]e :VimFilerExplorer<CR>
nnoremap <F10> :UniteBookmarkAdd

"kakko and Left
imap {} {}<Left>
imap [] []<Left>
imap () ()<Left>
imap "" ""<Left>
imap '' ''<Left>
imap <> <><Left>

"=========================================
"  dein
"=========================================
"if !&compatible
"    set nocompatible
"endif

filetype plugin indent off

let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo = 'https://github.com/Shougo/dein.vim'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if ! isdirectory(s:dein_repo_dir)
    call system('git clone ' . s:dein_repo . " " . s:dein_repo_dir)
endif

execute 'set runtimepath^=' . s:dein_repo_dir

if dein#load_state(s:dein_dir)
    call dein#begin(s:dein_dir)
        let g:vimrc = expand('~/.vim/rc')
        let s:toml = g:vimrc . '/dein.toml'
        let s:lazy_toml = g:vimrc . '/dein_lazy.toml'

        call dein#load_toml(s:toml,      {'lazy':0})
        call dein#load_toml(s:lazy_toml, {'lazy':1})

    call dein#end()
    call dein#save_state()
endif

if dein#check_install()
    call dein#install()
endif

"=========================================
"  colorscheme
"=========================================
set background=dark
colorscheme hybrid
"transparent
highlight Normal ctermbg=none

"=========================================
"  neocomplete config
"=========================================
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
    " return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
    " For no inserting <CR> key.
    return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y> neocomplete#close_popup()
inoremap <expr><C-e> neocomplete#cancel_popup()
" Close popup by <Space>.
inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

"=========================================
"  lightline config
"=========================================
let g:lightline = {
     \ 'colorscheme': 'hybrid',
     \ 'mode_map': {'c': 'NORMAL'},
     \ 'active': {
     \     'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ],
     \     'right': [ [ 'lineinfo', 'syntastic' ], [ 'percent' ], [ 'fileencoding', 'filetype' ]]
     \ },
     \ 'component_function': {
     \     'modified': 'LightLineModified',
     \     'readonly': 'LightLineReadonly',
     \     'fugitive': 'LightLineFugitive',
     \     'filename': 'LightLineFilename',
     \     'fileformat': 'LightLineFileformat',
     \     'filetype': 'LightLineFiletype',
     \     'fileencoding': 'LightLineFileencoding',
     \     'mode': 'LightLineMode'
     \ }
     \ }

function! LightLineModified()
    return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightLineReadonly()
    return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? 'x' : ''
endfunction

function! LightLineFilename()
    return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

function! LightLineFugitive()
    if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
        return fugitive#head()
    else
        return ''
    endif
endfunction

function! LightLineFileformat()
    return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightLineFiletype()
    return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! LightLineFileencoding()
    return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction

function! LightLineMode()
    return winwidth(0) > 60 ? lightline#mode() : ''
endfunction

"=========================================
"  final proc
"=========================================
filetype plugin indent on
