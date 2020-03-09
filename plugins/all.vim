if dein#tap('base16-vim')
	let base16colorspace=256
	if filereadable(expand("~/.vimrc_background"))
	  source ~/.vimrc_background
	endif
	highlight LineNr 				ctermbg=NONE guibg=NONE guifg=YellowGreen
	highlight CursorLineNr 	cterm=bold
endif

if dein#tap('context.vim')
	let g:context_border_char = '─'
endif

source ~/.vim/plugins/lightline.vim
source ~/.vim/plugins/gitgutter.vim
source ~/.vim/plugins/language.vim

" vim: set foldmethod=syntax ts=2 sw=2 tw=80 noet :
