command Relativenumber let &relativenumber = &relativenumber ? 0 : 1
command Rn Relativenumber

if dein#tap('vim-gitgutter')
	command -nargs=1 Glines call GlobalChangedLines(<q-args>)
endif

if dein#tap('vim-cursorword')
	let cursorword = 0
	let b:cursorword = cursorword
	command Cursorword let b:cursorword = b:cursorword ? 0 : 1
	command Cw Cursorword
endif

if dein#tap('goyo.vim')
	command Zen Goyo 100%x90%
endif

" vim: set foldmethod=indent ts=2 sw=2 tw=80 noet :
