"filetype off
"call pathogen#runtime_append_all_bundles()
"filetype plugin indent on

set nocompatible    " let's not be like vi
set modelines=0     " for security
syntax enable

" misc stuFF
imap jk <Esc>
set background=dark
set backspace=eol,indent,start
set encoding=utf-8
set hidden
set ignorecase      " ignore case when doing searches
set laststatus=2
set mouse=a         " enable the use of the mouse
set report=0        " tell you how many lines have been changed
set ruler           " show the line and column number of the cursor position
set scrolloff=3
set showcmd
set showmatch       " match parenthesis, i.e. ) with (  and } with {
set showmode        " if in Insert, Replace or Visual mode display a message
set ttyfast
set vb              " stop Vim from beeping all the time
set viminfo="h"     " don't highlight the last search upon startup
set visualbell
set wildmenu        " command-line completion operates in an enhanced mode.
"set cursorline
"set number
"set relativenumber
"set undofile

" tab/indentation stuff
set autoindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
set expandtab

" turn expandtab off for makefiles
autocmd FileType make set noexpandtab

" do C-style auto indentation on C/C++/Perl files only
filetype on
autocmd FileType c,cpp,perl set cindent

" make sure all ASP files have Win line endings
autocmd FileType asp set ff=dos

" adjust configuration for Windows {{{
"if has("win32") || has("win16")
"  set ff=dos
"else
"  set shell=/bin/bash
"endif
" }}}

"#####################################################
" THE FOLLOWING ARE FOR DEALING WITH WHITESPACE

" uncomment to auto remove trailing whitespace on save
"autocmd BufWritePre * :%s/\s\+$//e

" show tabs and trailing whitespace
set list listchars=tab:#=,trail:·
highlight ExtraWhitespace ctermfg=8 guifg=gray34
match ExtraWhitespace /\s\+$\|\t/

" function to trim all trailing spaces from a buffer
ab trim! call TrimSpaces()
fun! TrimSpaces() range
  let oldhlsearch=&hlsearch
  :%s/\s\+$//e
  let &hlsearch=oldhlsearch
endfun

" a group of commands to strip all trailing
" spaces whenever you exit Insert mode
autocmd InsertEnter * :let b:insert_start = line('.')
autocmd InsertLeave * :call <SID>StripTrailingWhitespaces()
fun! <SID>StripTrailingWhitespaces()
    let original_cursor = getpos('.')
    exe b:insert_start . ',.s/\s\+$//e'
    call setpos('.', original_cursor)
endfun
