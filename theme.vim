highlight LineNr				ctermbg=NONE guibg=NONE guifg=YellowGreen
highlight CursorLineNr	cterm=bold
highlight CursorLine		ctermbg=Black guibg=#262626

if dein#tap('vim-gitgutter')
	"let g:gitgutter_highlight_lines = 1
	let g:gitgutter_highlight_linenrs = 1
	let g:gitgutter_override_sign_column_highlight = 0
	highlight SignColumn			ctermbg=NONE guibg=NONE
	highlight GitGutterAdd		ctermbg=NONE guibg=NONE
	highlight GitGutterChange ctermbg=NONE guibg=NONE
	highlight GitGutterDelete ctermbg=NONE guibg=NONE
	highlight link GitGutterChangeLine DiffText
	highlight link GitGutterChangeLineNr Underlined
endif

if dein#tap('vim-lsc') " :help lsc-configure-highlight
	highlight lscDiagnosticHint guibg=SteelBlue ctermbg=67
endif

" vim: set foldmethod=syntax ts=2 sw=2 tw=80 noet :
