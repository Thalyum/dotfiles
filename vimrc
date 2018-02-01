" VIM Configration File
"
" Author: Eric Le Bihan <eric.lebihan@sagemcom.com>
"
" Some features, like NeoComplete, requires vim >= 7.4 with Lua suuport.
" As this version is not available on Debian Wheezy, they are not enabled by
" default.
"

scriptencoding utf-8
set encoding=utf-8

set nocompatible
filetype off

" Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'altercation/vim-colors-solarized'
Plugin 'bling/vim-airline'
Plugin 'brookhong/cscope.vim'
Plugin 'calincru/qml.vim'
Plugin 'crusoexia/vim-monokai'
Plugin 'dagwieers/asciidoc-vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'dracula/vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'fatih/vim-go'
Plugin 'godlygeek/tabular'
Plugin 'gmarik/Vundle.vim'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'mileszs/ack.vim'
Plugin 'peterhoeg/vim-qml'
Plugin 'racer-rust/vim-racer'
Plugin 'rhysd/vim-clang-format'
Plugin 'Rename'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
" Plugin 'Shougo/neocomplete'
" Plugin 'Shougo/neosnippet'
" Plugin 'Shougo/neosnippet-snippets'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-obsession'
Plugin 'tpope/vim-speeddating'
Plugin 'tpope/vim-surround'
Plugin 'tkztmk/vim-vala'
Plugin 'vim-scripts/qmake--syntax.vim'
Plugin 'wting/rust.vim'

call vundle#end()

" Airline
set laststatus=2
" let g:airline_powerline_fonts = 1
" let g:airline#extensions#tabline#enabled = 1

" Syntastic
let g:syntastic_mode_map = { 'mode': 'active',
	\ 'active_filetypes': [],
	\ 'passive_filetypes': ['html'] }
let g:syntastic_python_checkers=['flake8']
let g:syntastic_python_flake8_args = '--ignore="E501,E302"'
let g:syntastic_vala_modules = 'gtk+-3.0 gio-2.0'
let b:syntastic_c_cflags = '-I/usr/include/glib-2.0 -I/usr/include/gtk-3.0'

" Neocomplete
" let g:acp_enableAtStartup = 0
" let g:neocomplete#enable_at_startup = 1
" let g:neocomplete#enable_smart_case = 1
" inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" Neosnippet
" imap <C-k>     <Plug>(neosnippet_expand_or_jump)
" smap <C-k>     <Plug>(neosnippet_expand_or_jump)
" xmap <C-k>     <Plug>(neosnippet_expand_target)

" let g:neosnippet#snippets_directory='~/.vim/snippets'

" SuperTab-like snippets behavior
" imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
" \ "\<Plug>(neosnippet_expand_or_jump)"
" \: pumvisible() ? "\<C-n>" : "\<TAB>"
" smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
" \ "\<Plug>(neosnippet_expand_or_jump)"
" \: "\<TAB>"

" Jedi
let g:jedi#show_call_signatures = "0"

" Tagbar
let g:tagbar_compact = 1

set vb
set tabstop=8
set shiftwidth=8
set textwidth=78
set smartindent
set wrap
set ruler
set showmatch
set hlsearch
set modeline
set backupdir=~/.vimbackup
set directory=.,~/.vimbackup
" Allow backspace to delete character in front of cursor and line break
set backspace=indent,eol,start

" Show tabs
set list!
set listchars=tab:»\ ,
nnoremap <silent> <F8> :set list! <CR>

" Keyboard Shortcuts
let mapleader = ';'
nmap <leader>b :CtrlPBuffer<CR>
nmap <leader>e :NERDTreeToggle<CR>
nmap <leader>f :CtrlP<CR>
nmap <leader>/ :NERDTreeFind<CR>
nmap <leader>t :TagbarToggle<CR>
nmap <leader>j :TagbarOpenAutoClose<CR>
noremap <silent><leader>? :map <leader><CR>

inoremap jj <Esc>

" File syntax highligthing and indentation
syntax enable
filetype plugin indent on
" C
au FileType c set noet ai cindent ts=8 sw=8 sts=8
au BufRead,BufNewFile *.h set ft=c
" Linux coding style
set formatoptions=tcqlron
set cinoptions=:0,l1,t0,g0,(0
" C++
au FileType cpp set ai cindent ts=4 sw=4 sts=4 et omnifunc=omni#cpp#complete#Main
au BufRead,BufNewFile *.hpp set ft=cpp
" Objective-C
au FileType objc set ai cindent ts=4 sw=4 sts=4
au BufRead,BufNewFile *.m set ft=objc
" Python
au FileType python set ts=4 sw=4 sts=4 et ai
" Perl
au FileType perl set ts=4 sw=4 sts=4 et ai
" Shell
au FileType shell set ts=4 sw=4 sts=4 et ai
" Ruby
au FileType ruby set ts=2 sw=2 sts=2 et ai
au BufRead,BufNewFile *.ru setfiletype ruby
" Bitbake
au BufRead,BufNewFile *.b{b,class} let is_bash=1|setfiletype sh
" Vala
au FileType vala set ts=4 sw=4 sts=4 et ai
" Javascript
au FileType javascript set ts=4 sw=4 sts=4 et ai
" PHP
au BufNewFile,BufRead *.php set filetype=php
au FileType php set ts=4 sw=4 sts=4 et ai
" RestructuredText
au FileType rst set isk+=-
" Git commit messages
au Filetype gitcommit setlocal spell textwidth=72
au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])
" Qmake
au BufRead,BufNewFile *.pro set filetype=qmake
au BufRead,BufNewFile *.pri set filetype=qmake
au FileType qmake set ts=4 sw=4 sts=4 et ai
" Markdown
au BufRead,BufNewFile *.md set filetype=markdown
" Mutt
au BufRead /tmp/mutt-* set tw=72
" Rust
let g:rustfmt_autosave = 1

" build tags of your own project with Ctrl-F12
map <C-F12> :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" Reload Vim settings after editing config file
autocmd! bufwritepost .vimrc source ~/.vimrc

" Enable per-directory .vimrc files, but disable unsafe commands
set exrc
set secure

" To save files before a :make
set autowrite
set guioptions-=T
runtime! ftplugin/man.vim

" Color!
let g:background_type = "dark"
execute "set background=" . g:background_type
set t_Co=256
colorscheme solarized
if has("gui_running")
	set background=light
	colorscheme default
endif

function! ToggleBackgroundType()
	if (g:background_type == "dark")
		let g:background_type = "light"
	else
		let g:background_type = "dark"
	endif
	execute "set background=" . g:background_type
endfunction

nnoremap <silent> <F9> :call ToggleBackgroundType() <CR>

" Show text wrap limit on lines that exceeds it (Damian Conway)
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%79v', 100)

" Remove whitespaces
" autocmd BufWritePre * :%s/\s\+$//e

" Enable word completion using dictionary
set dictionary+=/usr/share/dict/words

" Commands
map <leader>sl :!svn log -l1 % <CR>
map <leader>gl :!git log -1 % <CR>

" Functions

"" C/C++ Helpers

function! InsertCppHeaderGuard()
python << EOF
import vim
import os
buffer = vim.current.buffer
name = os.path.split(buffer.name)[1]
name = name.upper()
for c in ('.', '-'):
	name = name.replace(c, '_')
buffer.append('#ifndef ' + name)
buffer.append('#define ' + name)
buffer.append('#endif /* ' + name + ' */')
EOF
endfunction

function! InsertCxxNamespace(namespace)
python << EOF
import vim
def gen_lines(namespace):
	names = namespace.split('::', 1)
	lines = ['namespace ' + names[0], '{']
	if len(names) == 2:
		lines += gen_lines(names[1])
	lines.append('} // namespace ' + names[0])
	return lines

buffer = vim.current.buffer
row, col = vim.current.window.cursor
buffer[row - 1:row - 1] = gen_lines(vim.eval('a:namespace'))
EOF
endfunction

command! -nargs=0 InsertCppHeaderGuard call InsertCppHeaderGuard()
command! -nargs=1 InsertCxxNamespace call InsertCxxNamespace('<args>')

" clang-format
let g:clang_format#detect_style_file = 1
