if dein#tap('base16-vim')
	let base16colorspace=256
	if filereadable(expand("~/.vimrc_background"))
	  source ~/.vimrc_background
	endif
endif

if dein#tap('goyo.vim')
	autocmd! User GoyoEnter nested call s:zen_mode()
	autocmd! User GoyoLeave nested call s:vim_mode()

	function! s:zen_mode()
		Limelight
		if dein#tap('vim-cursorword')
			let b:cursorword = 1
		endif
	endfunction

	function! s:vim_mode()
		source ~/.vim/theme.vim
		Limelight!
		if dein#tap('vim-cursorword')
			let b:cursorword = 0
		endif
	endfunction
endif

if dein#tap('context.vim')
	let g:context_border_char = '─'
endif

source ~/.vim/plugins/lightline.vim
source ~/.vim/plugins/gutter.vim
source ~/.vim/plugins/language.vim

" vim: set foldmethod=syntax ts=2 sw=2 tw=80 noet :
