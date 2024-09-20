
"---------------------------------------
"----------------OPTIONS----------------
"---------------------------------------
" set clipboard=unnamed

"---------------------------------------
"----------------KEYMAPS----------------
"---------------------------------------
" nnoremap <space>x :bd <cr>
" nnoremap <space>q :q <cr>
" nnoremap <C-q> :qa! <cr>
" nnoremap <space>w :w! <cr>
" nnoremap <space>h :nohl <cr>
" nnoremap <silent> <space>y :w !pbcopy <cr>
" vnoremap <silent> <space>y :w !pbcopy <cr>
" nnoremap <space>r :so $MYVIMRC <cr>
" nnoremap <up> <nop>
" nnoremap <down> <nop>
" nnoremap <left> <nop>
" nnoremap <right> <nop>
" vnoremap <up> <nop>
" vnoremap <down> <nop>
" vnoremap <left> <nop>
" vnoremap <right> <nop>
" inoremap <up> <nop>
" inoremap <down> <nop>
" inoremap <left> <nop>
" inoremap <right> <nop>
" nnoremap J mzJ`z
" nnoremap <C-d> <C-d>zz
" nnoremap <C-u> <C-u>zz
" nnoremap n nzzzv
" nnoremap N Nzzzv
" nnoremap <C-e> <END>
" nnoremap <C-a> <HOME>
" inoremap <C-e> <END>
" inoremap <C-a> <HOME>
" vnoremap <C-e> <END>
" vnoremap <C-a> <HOME>
" xnoremap <C-e> <END>
" xnoremap <C-a> <HOME>

" Go back and forward with Ctrl+O and Ctrl+I
" (make sure to remove default Obsidian shortcuts for these to work)
exmap back obcommand app:go-back
nmap <C-o> :back
exmap forward obcommand app:go-forward
nmap <C-i> :forward
