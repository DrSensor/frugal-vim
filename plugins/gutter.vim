
if dein#tap('vim-gitgutter')
	set updatetime=100
	let g:gitgutter_grep = 'rg'
	let g:gitgutter_sign_allow_clobber = 0
	let g:gitgutter_preview_win_floating = 1
	let g:gitgutter_use_location_list = 1

	function! GitStatus()
		let [a,m,r] = GitGutterGetHunkSummary()
		return printf('+%d ~%d -%d', a, m, r)
	endfunction

	function! CleanUp(...)
		if a:0  " opfunc
			let [first, last] = [line("'["), line("']")]
		else
			let [first, last] = [line("'<"), line("'>")]
		endif
		for lnum in range(first, last)
			let line = getline(lnum)
			let line = substitute(line, '\s\+$', '', '') " clean up the text, e.g.:
			call setline(lnum, line)
		endfor
	endfunction

	function! GlobalChangedLines(ex_cmd)
		for hunk in GitGutterGetHunks()
			for lnum in range(hunk[2], hunk[2]+hunk[3]-1)
				let cursor = getcurpos()
				silent! execute lnum.a:ex_cmd
				call setpos('.', cursor)
			endfor
		endfor
	endfunction

	function! GitGutterNextHunkCycle()
		let line = line('.')
		silent! GitGutterNextHunk
		if line('.') == line
			1
			GitGutterNextHunk
		endif
	endfunction

	function! NextHunkAllBuffers()
		let line = line('.')
		GitGutterNextHunk
		if line('.') != line
			return
		endif

		let bufnr = bufnr('')
		while 1
			bnext
			if bufnr('') == bufnr
				return
			endif
			if !empty(GitGutterGetHunks())
				1
				GitGutterNextHunk
				return
			endif
		endwhile
	endfunction

	function! PrevHunkAllBuffers()
		let line = line('.')
		GitGutterPrevHunk
		if line('.') != line
			return
		endif

		let bufnr = bufnr('')
		while 1
			bprevious
			if bufnr('') == bufnr
				return
			endif
			if !empty(GitGutterGetHunks())
				normal! G
				GitGutterPrevHunk
				return
			endif
		endwhile
	endfunction
endif

" vim: set foldmethod=indent ts=2 sw=2 tw=80 noet :
