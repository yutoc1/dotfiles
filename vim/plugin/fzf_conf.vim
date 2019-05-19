"========================================
" Description
"========================================
" configuration for fzf

"========================================
" function
"========================================
command! FZFFileList call fzf#run({
    \ 'source': 'find . -type d -name .git -prune -o ! -name .DS_Store',
    \ 'sink': 'e',
    \ 'down': '40%'})

command! FZFMru call fzf#run({
    \ 'source': v:oldfiles,
    \ 'sink': 'e',
    \ 'options': '-m -x +s',
    \ 'down': '40%'})

"========================================
" key config
"========================================
nnoremap [fzf] <Nop>
nmap <Space>f [fzf]

nnoremap <silent> [fzf]f :FZFFileList<CR>
nnoremap <silent> [fzf]r :FZFMru<CR>
nnoremap <silent> [fzf]m :Marks<CR>
nnoremap <silent> [fzf]b :Buffers<CR>

let g:fzf_layout = {'down': '40%'}
