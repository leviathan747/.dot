" global properties
set number
set tabstop=2
set shiftwidth=2
set expandtab
 
" map leader
let mapleader=" "
 
" plugin setup
call plug#begin('~/.config/nvim/plugged')
" Plug 'prabirshrestha/async.vim'
" Plug 'prabirshrestha/vim-lsp'
" Plug 'mattn/vim-lsp-settings'
" Plug 'prabirshrestha/asyncomplete.vim'
" Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'preservim/nerdtree'
Plug 'leviathan747/twopage.vim'
call plug#end()

" split resizing/navigation
noremap J :5winc +<CR>
noremap K :5winc -<CR>
noremap H :vertical resize +5<CR>
noremap L :vertical resize -5<CR>
noremap <Tab> <C-w>w

" nerd tree toggle
noremap <leader>tn :NERDTreeToggle<CR>

" suspend vim
noremap <leader>zz <C-z>

" go to last location in jump list
noremap <leader>gl <C-O>

" visual search
vnoremap <leader>/ y/<C-R>"<CR>

" clear search highlight
nnoremap <silent> <leader>c :silent noh<Bar>echo<CR>

" two page editing
noremap <leader>tp :call EnableTwoPage()<CR>
autocmd VimEnter *.adoc,*.md :call EnableTwoPage()

" use esc to exit terminal mode
tnoremap <Esc> <C-\><C-n>

" LSP mappings
" noremap en :LspNextDiagnostic<CR>
" noremap ep :LspPreviousDiagnostic<CR>
" noremap ee :LspDocumentDiagnostics<CR>
" noremap cc :LspCodeAction<CR>
" noremap fd :LspDocumentFormat<CR>

" LSP tab completion
" inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"
" inoremap <C-Space> <Plug>(asyncomplete_force_refresh)
" inoremap <c-@> <Plug>(asyncomplete_force_refresh)
