highlight LineNr				ctermbg=NONE guibg=NONE guifg=YellowGreen
highlight CursorLineNr	cterm=bold

if dein#tap('vim-gitgutter')
	"let g:gitgutter_highlight_lines = 1
	let g:gitgutter_highlight_linenrs = 1
	let g:gitgutter_override_sign_column_highlight = 0
	highlight SignColumn 			ctermbg=NONE guibg=NONE
	highlight GitGutterAdd 		ctermbg=NONE guibg=NONE
	highlight GitGutterChange ctermbg=NONE guibg=NONE
	highlight GitGutterDelete ctermbg=NONE guibg=NONE
	highlight link GitGutterChangeLine DiffText
	highlight link GitGutterChangeLineNr Underlined
endif

" vim: set foldmethod=syntax ts=2 sw=2 tw=80 noet :
