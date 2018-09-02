"========================================
" Description
"========================================
" configuration for fzf

"========================================
" function
"========================================
command! FZFFileList call fzf#run({
    \ 'source': 'find . -type d -name .git -prune -o ! -name .DS_Store',
    \ 'sink': 'e'})

command! FZFMru call fzf#run({
    \ 'source': v:oldfiles,
    \ 'sink': 'e',
    \ 'options': '-m -x +s',
    \ 'donw': '40%'})

"========================================
" key config
"========================================
nnoremap [fzf] <Nop>
nmap <Space>f [fzf]

nnoremap <silent> [fzf]f :FZFFileList<CR>
nnoremap <silent> [fzf]m :FZFMru<CR>
