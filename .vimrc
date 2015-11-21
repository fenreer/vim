" Automatically reload .vimrc when it's edited
autocmd! bufwritepost .vimrc source %

" Improved copy and paste
set pastetoggle=<F2>
vnoremap <C-c> "*y

" Sane mouse and backspace behavior
set mouse=a " On Mac OS X, press ALT and click to set cursor position
set bs=2

" Rebind leader key
let mapleader = ","

" Remove highlight from last search
noremap <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>
inoremap <C-n> :nohl<CR>

" Bind control+movement to move around splits
map <c-h> <c-w>h
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l

" Sane tab navigation
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>

" Map sort function
vnoremap <Leader>s :sort<CR>

" Maintain selection when indenting/outdenting code blocks
vnoremap < <gv
vnoremap > >gv

" Show trailing whitespace (insert BEFORE colorscheme)
"autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
"au InsertLeave * match ExtraWhitespace /\s\+$/

" Color scheme
" Installation:
" mkdir -p ~/.vim/colors && cd ~/.vim/colors
" wget -O pychimp.vim http://www.vim.org/scripts/download_script.php?src_id=17973
set t_Co=256
color pychimp

" Enable syntax highlighting
"filetype off
"filetype plugin indent on
syntax on

" Various IDE-like settings
set number	   " Show line numbers
set textwidth=79	" Width of document (used by gd)
set nowrap	   " Don't automatically wrap on load
set fo-=t	   " Don't automatically wrap text when typing
set colorcolumn=80
highlight ColorColumn ctermbg=233

" Automatically format paragraphs when pressing "Q"
vmap Q gq
nmap Q gqap

" History and undo levels
set history=700
set undolevels=700

" Tab stuff
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

" Use case-INsensitive searches
set hlsearch
set incsearch
set ignorecase
set smartcase

" Disable swap and backup files
set nobackup
set nowritebackup
set noswapfile

" PLUGINS!
"
" Install pathogen:
" mkdir -p ~/.vim/autoload ~/.vim/bundle
" curl -LSso ~/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/HEAD/autoload/
" Now install each plugin into .vim/bundle/plugin-name/ directory and each one
" will "just work"
filetype on
filetype off
call pathogen#infect()
filetype plugin indent on

" Python IDE setup

" Settings for vim-powerline
" cd ~/.vim/bundle
" git clone git://github.com/Lokaltog/vim-powerline.git
set laststatus=2

" Settings for ctrlp
" cd ~/.vim/bundle
" git clone https://github.com/kien/ctrlp.vim.git
let g:ctrlp_max_height = 30
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*

" Settings for python-mode
" cd ~/.vim/bundle
" git clone https://github.com/klen/python-mode
"map <Leader>g :call RopeGotoDefinition()<CR>
"let ropevim_enable_shortcuts = 1
"let g:pymode_rope_goto_def_newwin = "vnew"
"let g:pymode_rope_extended_complete = 1
"let g:pymode_breakpoint = 0
"let g:pymode_syntax = 1
"let g:pymode_syntax_builtin_objs = 0
"let g:pymode_syntax_builtin_funcs = 0
"map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

" Better navigation through omnicomplete option list
set completeopt=longest,menuone
function! OmniPopup(action)
    if pumvisible()
        if a:action == 'j'
            return "\<C-N>"
        elseif a:action == 'k'
            return "\<C-P>"
        endif
    endif
    return a:action
endfunction

inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>

" Python code folding
" mkdir -p ~/.vim/ftplugin
" wget -O ~/.vim/ftplugin/python_editing.vim http://www.vim.org/scripts/download_script.php?src_id=5492
set nofoldenable
