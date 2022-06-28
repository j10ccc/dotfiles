" Description: Keymaps
"
nmap <C-a> gg<S-v>G

" Save with root permission
command! W w !sudo tee > /dev/null %S

" Split window
nmap ss :split<Return><C-w>w
nmap sv :vsplit<Return><C-w>w

" Open current directory
nmap te :tabedit 
nmap <S-Tab> :tabnext<Return>
nmap <Tab> :bn<Return>

" Move window
nmap <Space> <C-w>w
map s<left> <C-w>h
map s<up> <C-w>k
map s<down> <C-w>j
map s<right> <C-w>l
map sh <C-w>h
map sk <C-w>k
map sj <C-w>j
map sl <C-w>l
