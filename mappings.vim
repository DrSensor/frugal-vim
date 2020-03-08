" VSCode keymap for Visual Block
noremap <A-LeftMouse>	<A-RightMouse>
noremap <A-LeftDrag>	<A-RightDrag>
noremap <A-LeftRelease>	<A-RightRelease>

" Ctrl-S for save
noremap  <C-S> :update<CR>
vnoremap <C-S> <C-C>:update<CR>gv
inoremap <C-S> <ESC>:update<CR><right>

" backspace and cursor keys wrap to previous/next line
set backspace=indent,eol,start whichwrap+=<,>,[,]
vnoremap <BS> d 

" Auto-close bracket
" inoremap " ""<left> " conflict with vimscript comment
" inoremap ' ''<left> " conflict with rust lifetime annotation
inoremap < <><left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O
