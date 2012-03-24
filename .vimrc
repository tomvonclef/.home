set backspace=eol,indent,start
set autoindent

" don't highlight the last search upon startup
set viminfo="h"

" Do C-style auto indentation on C/C++/Perl files only :)
:filetype on
:autocmd FileType c,cpp,perl :set cindent

" stop Vim from beeping all the time
set vb

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smarttab

set ruler
set background=dark

" turn expandtab off for makefiles
autocmd FileType make set noexpandtab

" uncomment to use a different color map
":hi Comment   term=bold cterm=NONE ctermfg=Blue ctermbg=NONE gui=NONE guifg=Blue guibg=NONE
":hi Constant  term=underline cterm=NONE ctermfg=Red ctermbg=NONE gui=NONE guifg=Magenta guibg=NONE
":hi Special   term=bold cterm=NONE ctermfg=Magenta ctermbg=NONE gui=NONE guifg=SlateBlue guibg=NONE
":hi Identifier   term=underline cterm=NONE ctermfg=Cyan ctermbg=NONE gui=NONE guifg=Cyan guibg=NONE
":hi Statement term=bold cterm=NONE ctermfg=Yellow ctermbg=NONE gui=bold guifg=Brown guibg=NONE
":hi PreProc   term=underline cterm=NONE ctermfg=Magenta ctermbg=NONE gui=NONE guifg=Purple guibg=NONE
":hi Type      term=underline cterm=NONE ctermfg=Green ctermbg=NONE gui=bold guifg=SeaGreen guibg=NONE
":hi Underlined   term=underline cterm=underline ctermfg=Magenta gui=underline guifg=SlateBlue
":hi Ignore term=NONE cterm=NONE ctermfg=white ctermbg=NONE gui=NONE guifg=bg guibg=NONE

"command-line completion operates in an enhanced mode.
set wildmenu

"Tell you if you are in insert mode
set showmode

"match parenthesis, i.e. ) with (  and } with {
set showmatch

"ignore case when doing searches
set ignorecase

"tell you how many lines have been changed
"set report=0

"#####################################################
" the following are for dealing with whitespace
" tabs and trailing spaces

"auto remove trailing whitespace on save
"autocmd BufWritePre * :%s/\s\+$//e

"Delete trailing spaces upon leaving insert mode
autocmd InsertLeave * s/\s\+$//e

"Show tabs and trailing whitespace
set list listchars=tab:#=,trail:·
highlight ExtraWhitespace ctermfg=8 guifg=gray34
match ExtraWhitespace /\s\+$\|\t/

function! TrimSpaces() range
  let oldhlsearch=&hlsearch
  :%s/\s\+$//e
  let &hlsearch=oldhlsearch
endfunction

autocmd InsertEnter * :let b:insert_start = line('.')
autocmd InsertLeave * :call <SID>StripTrailingWhitespaces()

fun! <SID>StripTrailingWhitespaces()
    let original_cursor = getpos('.')
    exe b:insert_start . ',.s/\s\+$//e'
    call setpos('.', original_cursor)
endfun

"#####################################################
" Other stuff

set mouse=a

set hlsearch

imap jk <Esc>

