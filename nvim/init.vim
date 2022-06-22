call plug#begin('~/.vim/plugged')
Plug 'Yggdroot/indentLine'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'morhetz/gruvbox'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'mhartington/nvim-typescript', {'do': './install.sh'}
" For async completion
Plug 'Shougo/deoplete.nvim'
" For Denite features
Plug 'Shougo/denite.nvim'
call plug#end()

runtime ./maps.vim

set encoding=utf-8
set fenc=utf-8
set showmatch
set rnu
set smarttab
set tabstop=4
set cursorline
"hi Normal cermfg=252 ctermbg=nonet

let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2

autocmd vimenter * ++nested colorscheme gruvbox
" 设置状态栏
let g:airline_theme='luna'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#buffer_nr_show = 0
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#keymap#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#buffer_idx_format = {
       \ '0': '0 ',
       \ '1': '1 ',
       \ '2': '2 ',
       \ '3': '3 ',
       \ '4': '4 ',
       \ '5': '5 ',
       \ '6': '6 ',
       \ '7': '7 ',
       \ '8': '8 ',
       \ '9': '9 '
       \}

" 修改了一些个人不喜欢的字符
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.linenr = " CL" " current line
let g:airline_symbols.whitespace = '|'
let g:airline_symbols.maxlinenr = 'Ml ' "maxline
let g:airline_symbols.branch = 'BR'
let g:airline_symbols.readonly = "RO"
let g:airline_symbols.dirty = "DT"
let g:airline_symbols.crypt = "CR" 



" autocmd vimenter * NERDTree  "自动开启Nerdtree
" let g:NERDTreeWinSize = 25 "设定 NERDTree 视窗大小
" let NERDTreeShowBookmarks=1  " 开启Nerdtree时自动显示Bookmarks
"打开vim时如果没有文件自动打开NERDTree
" autocmd vimenter * if !argc()|NERDTree|endif
"当NERDTree为剩下的唯一窗口时自动关闭
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" 设置树的显示图标
" let g:NERDTreeDirArrowExpandable = '+'
" let g:NERDTreeDirArrowCollapsible = '-'
" let NERDTreeIgnore = ['\.pyc$']  " 过滤所有.pyc文件不显示
" let g:NERDTreeShowLineNumbers=0 " 是否显示行号
" let g:NERDTreeHidden=0     "不显示隐藏文件
""Making it prettier
" let NERDTreeMinimalUI = 1
" let NERDTreeDirArrows = 1
" nmap <c-n> :NERDTreeToggle<CR> " 开启/关闭nerdtree快捷键

