if dein#tap('lightline.vim')
	set laststatus=2
	let g:lightline = {
		\ 'component_function': {
		\ 	'gitbranch': 'gitbranch#name',
		\ 	'gitsummary': 'GitStatus',
		\ },
		\ }

	" Statusline
	let g:lightline.active = {
		\ 'left': [ [ 'mode', 'paste' ],
		\ 					[ 'modified', 'filename', 'gitbranch' ],
		\ 					[ 'gitsummary', 'readonly' ],
		\ 				],
		\ }
 	let g:lightline.inactive = {
		\ 	'left': [ [ 'modified', 'filename', 'gitbranch' ] ],
		\ }

	" Powerline style
	let g:lightline.separator = { 'left': '', 'right': '' }
	let g:lightline.subseparator = {'left': '', 'right': '' }
endif

" vim: set foldmethod=indent ts=2 sw=2 tw=80 noet :
