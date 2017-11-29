set nocompatible    " let's not be like vi
set modelines=0     " for security
syntax enable

" misc stuff
set backspace=eol,indent,start
set encoding=utf-8
set ignorecase      " ignore case when doing searches
set showmatch
set visualbell
set viminfo="h"
set wildmenu        " command-line completion operates in an enhanced mode.

" tab/indentation stuff
set autoindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
set expandtab

" turn expandtab off for makefiles
autocmd FileType make set noexpandtab

" make sure all ASP files have Win line endings
autocmd FileType asp set ff=dos

" show tabs
set list listchars=tab:#=,trail:·

" show trailing whitespace when not in insert mode
highlight ExtraWhitespace ctermfg=8 guifg=gray34
match ExtraWhitespace /\s\+$\|\t/
autocmd InsertEnter * :match none ExtraWhitespace
autocmd InsertLeave * :match ExtraWhitespace /\s\+$\|\t/

" a group of commands to strip all trailing
" spaces whenever you exit Insert mode
autocmd InsertEnter * :let b:insert_start = line('.')
autocmd InsertLeave * :call <SID>StripTrailingWhitespaces()
fun! <SID>StripTrailingWhitespaces()
    let original_cursor = getpos('.')
    exe b:insert_start . ',.s/\s\+$//e'
    call setpos('.', original_cursor)
endfun
