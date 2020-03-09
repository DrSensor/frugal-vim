if dein#tap('vim-gitgutter')
	command -nargs=1 Glines call GlobalChangedLines(<q-args>)
endif

" vim: set foldmethod=indent ts=2 sw=2 tw=80 noet :
