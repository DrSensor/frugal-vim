if dein#tap('vim-lsc')
	autocmd CompleteDone * silent! pclose

	" https://github.com/natebosch/vim-lsc/wiki/Language-Servers
	" and all of them installed via `yay` except vim
	let g:lsc_server_commands = {
				\ 'rust': {
				\ 	'command': 'rls',
				\ 	'log_level': 'Warning',
				\ 	'suppress_stderr': v:true,
				\ 	'workspace_config': {
				\ 		'clippy_preference': 'on',
				\ 	},
				\  },
				\ 'python': 'pyls',
				\ 'typescript': 'typescript-language-server --stdio',
				\ 'javascript': 'typescript-language-server --stdio',
				\ 'html': 'html-languageserver --stdio',
				\ 'css': 'css-languageserver --stdio',
				\ 'sh': 'bash-language-server start',
				\ 'vim': {
				\		'command': 'vim-language-server --stdio',
				\		'message_hooks': {
				\			'initialize': {
				\				'initializationOptions': { 'vimruntime': $VIMRUNTIME, 'runtimepath': &rtp },
				\			},
				\		},
				\ },
				\ 'go': {
				\		'command': 'gopls serve',
				\		'log_level': 'Warning',
				\		'suppress_stderr': v:true,
				\ },
				\ }

	" To prevent signcolumn will appear each time Clangd sends a warning or
	" provides a diagnostic and the text will be shifted by one column each time
	" signcolumn is triggered.
	set signcolumn=yes
	let g:lsc_server_commands.c = 'clangd'
	let g:lsc_server_commands.cpp = 'clangd'

	" From vim-lsc-dart
	" -----------------
	function! s:SkipYamlRequests(method, params) abort
		return a:params.textDocument.uri =~? '\v\.yaml$' ?
					\ lsc#config#skip() : a:params
	endfunction
	function! s:HandleStatus(method, params) abort
		let g:dart_analyzer_status = a:params.isAnalyzing
	endfunction
	let g:lsc_server_commands.dart = {
				\ 'command': 'dart /opt/dart-sdk/bin/snapshots/analysis_server.dart.snapshot --lsp',
				\ 'message_hooks': {
				\   'initialize': {
				\     'initializationOptions': {
				\       'onlyAnalyzeProjectsWithOpenFiles': v:true
				\     },
				\   },
				\   'textDocument/documentHighlight': function('<SID>SkipYamlRequests'),
				\   'textDocument/completion': function('<SID>SkipYamlRequests'),
				\ },
				\ 'notifications': {
				\   '$/analyzerStatus': function('<SID>HandleStatus'),
				\ },
				\ }
endif

if dein#tap('echodoc.vim')
	let g:echodoc#enable_at_startup = 1
	let g:echodoc#type = 'popup'
	" To use a custom highlight for the popup window,
	" change Pmenu to your highlight group
	highlight link EchoDocPopup Pmenu
endif

if dein#tap('neoformat')
	let g:neoformat_try_formatprg = 1
	let g:neoformat_basic_format_align = 1	" Enable alignment
	let g:neoformat_basic_format_retab = 1	" Enable tab to spaces conversion
	let g:neoformat_basic_format_trim = 1		" Enable trimmming of trailing whitespace

	" augroup fmt " Autoformat on save
	"		autocmd!
	"		autocmd BufWritePre * silent! undojoin | Neoformat
	" augroup END
endif

" vim: set foldmethod=syntax ts=2 sw=2 tw=80 noet :
