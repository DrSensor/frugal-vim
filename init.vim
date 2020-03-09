unlet! skip_defaults_vim
source $VIMRUNTIME/defaults.vim

if filereadable('.vim/.vault.vim')
	source .vim/.vault.vim 		" Special secure config
endif

set linebreak 	" stop wrapping lines in the middle of word
set splitbelow 	" :split will add window in below
set splitright 	" :vsplit will add window in right

set number
set relativenumber
set numberwidth=2

set cursorline

" Plugin Manager {{{
" ------------------
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim
let g:dein#auto_recache = 1
let g:dein#install_max_processes = 12

if dein#load_state('~/.cache/dein')
	call dein#begin('~/.cache/dein')
	call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')

	"Productivity {{{"
	call dein#add('easymotion/vim-easymotion')
	call dein#add('lotabout/skim.vim')
	call dein#add('wellle/context.vim')
	call dein#add('haya14busa/vim-asterisk')

	call dein#add('Shougo/echodoc.vim')
	call dein#add('sbdchd/neoformat')
	call dein#add('natebosch/vim-lsc')
	call dein#add('ajh17/VimCompletesMe')
	call dein#add('liuchengxu/vista.vim')

	"call dein#add('itchyny/vim-cursorword')
	call dein#add('t9md/vim-quickhl')
	call dein#add('tpope/vim-commentary')
	call dein#add('tpope/vim-surround')
	call dein#add('rhysd/git-messenger.vim')
	"------------=}}}"
	
	"Offices {{{
	call dein#add('gelisam/git-slides')
	call dein#add('vimwiki/vimwiki')
	call dein#add('junegunn/goyo.vim')
	call dein#add('junegunn/limelight.vim')
	"--------}}}

	"Asthetics {{{"
	call dein#add('auxiliary/vim-layout')
	call dein#add('nathanaelkane/vim-indent-guides')
	call dein#add('itchyny/lightline.vim')
	call dein#add('itchyny/vim-gitbranch')
	call dein#add('airblade/vim-gitgutter')

	call dein#add('chriskempson/base16-vim')
	call dein#add('mike-hearn/base16-vim-lightline')
	"----------}}}"
	call dein#end()

	if ! g:dein#_is_sudo
		call dein#save_state() 	" Save cached state for faster startup
	endif

	if dein#check_install() 	" Update or install plugins if a change detected
		if ! has('vim')
			set nomore
		endif
		call dein#install()
	endif
endif

filetype plugin indent on
syntax enable

" Trigger source event hooks
call dein#call_hook('source')
call dein#call_hook('post_source')
"------------------}}}

source ~/.vim/plugins/all.vim
source ~/.vim/terminal.vim
source ~/.vim/filetype.vim
source ~/.vim/mappings.vim
source ~/.vim/commands.vim

" vim: set foldmethod=marker ts=2 sw=2 tw=80 noet :
