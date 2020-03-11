set errorbells 						" Trigger bell on error

set mouse=nv 							" Disable mouse in command-line mode
if has('mouse')
	if has('mouse_sgr')
		set ttymouse=sgr
	else
		set ttymouse=xterm2
	endif
endif

let &t_ut='' 							" kitty workaround on color theme
if !has('gui_running')
  set t_Co=256 						" Enable 256 color terminal
endif
if has('termguicolors') && $COLORTERM =~# 'truecolor\|24bit'
	set termguicolors 			" Enables 24-bit RGB color in the TUI
endif

" change cursor shape on different mode
let &t_SI = "\<Esc>[6 q" 	" IBeam shape in INSERT mode
let &t_SR = "\<Esc>[4 q" 	" underline shape in REPLACE mode
let &t_EI = "\<Esc>[2 q" 	" block shape in NORMAL mode

if exists('$TMUX')
	set ttyfast

	" Set Vim-specific sequences for RGB colors
	" Fixes 'termguicolors' usage in tmux
	" :h xterm-true-color
	let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
	let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
	
	let &t_SI = "\<Esc>Ptmux\<Esc>".&t_SI
	let &t_SR = "\<Esc>Ptmux\<Esc>".&t_SR
	let &t_EI = "\<Esc>Ptmux\<Esc>".&t_EI
endif

" make :terminal scrollable by entering normal mode on <ScrollWheelUp>
" exit normal mode on Right-Click or by pressing 'i'
function! ExitNormalMode()
    unmap <buffer> <silent> <RightMouse>
    call feedkeys("a")
endfunction
function! EnterNormalMode()
    if &buftype == 'terminal' && mode('') == 't'
        call feedkeys("\<c-w>N")
        call feedkeys("\<c-y>")
        map <buffer> <silent> <RightMouse> :call ExitNormalMode()<CR>
    endif
endfunction
tmap <silent> <ScrollWheelUp> <c-w>:call EnterNormalMode()<CR>

" vim: set ts=2 sw=2 tw=80 noet :
