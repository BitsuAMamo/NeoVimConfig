call plug#begin('~/AppData/Local/nvim/plugged')
	" LSP
	Plug 'neovim/nvim-lspconfig'
	Plug 'hrsh7th/nvim-compe'
	Plug 'glepnir/lspsaga.nvim'
	Plug 'simrat39/symbols-outline.nvim'

	" Tree Sitter
	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

	" Others
	Plug 'mbbill/undotree'
	Plug 'gruvbox-community/gruvbox'

	" Telescope and requirements
	Plug 'nvim-lua/popup.nvim'
	Plug 'nvim-lua/plenary.nvim'
	Plug 'nvim-telescope/telescope.nvim'
	Plug 'nvim-telescope/telescope-fzy-native.nvim'

call plug#end()

lua require("config.treesitter")

let mapleader = " "

" Copy to clipboard
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y gg"+yG

" Undotree
nnoremap <leader>u :UndotreeShow

" Remap ESC for insert and terminal
inoremap jj <Esc>
inoremap kk <Esc>
tnoremap jj <C-\><C-n>
tnoremap kk <C-\><C-n>

" Better tab
vnoremap < <gv
vnoremap > >gv

" Window Navigation
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

" Window Resize
nnoremap <silent> <M-j> :resize -2<CR>
nnoremap <silent> <M-k> :resize +2<CR>
nnoremap <silent> <M-h> :vertical resize -2<CR>
nnoremap <silent> <M-l> :vertical resize +2<CR>
" nnoremap <silent> <leader>m :MaximizerToggle<CR>

" Functions
fun! TrimWhiteSpace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup WhiteSpaceTrimmer
    autocmd!
    autocmd BufWritePre * :call TrimWhiteSpace()
augroup END

augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 200})
augroup END


