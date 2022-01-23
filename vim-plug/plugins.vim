call plug#begin('~/.config/nvim/autoload/plugged')

    " Custom starting screen
    Plug 'mhinz/vim-startify'

    " Better Syntax Support
    Plug 'sheerun/vim-polyglot'

    " Auto pairs for '(' '[' '{'
    Plug 'jiangmiao/auto-pairs'

    " Instant increment completion, increment buffer sync using buffer update events
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    " Most recently used files
    Plug 'yegappan/mru'

    " Fuzzy search
    Plug 'junegunn/fzf', {'dir': '~/.fzf','do': './install --all'}
    Plug 'junegunn/fzf.vim'
    Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
    Plug 'antoinemadec/coc-fzf'

    " Ack search tool
    Plug 'mileszs/ack.vim'

    " Comments
    Plug 'tpope/vim-commentary'

    " Emmet
    Plug 'mattn/emmet-vim'

    " Surroundings: parentheses, brackets, quotes, XML tags
    Plug 'tpope/vim-surround'

    " Color highlighing
    Plug 'norcalli/nvim-colorizer.lua'

    " Neovim statusline written in Lua
    Plug 'nvim-lualine/lualine.nvim'

    " Icons
    Plug 'kyazdani42/nvim-web-devicons'

    " Material color scheme
    Plug 'kaicataldo/material.vim', { 'branch': 'main' }

    " Smooth scrolling
    Plug 'karb94/neoscroll.nvim'

    " Terminal
    Plug 'akinsho/toggleterm.nvim'

    " Displays a popup with possible key bindings of the command you started typing.
    Plug 'folke/which-key.nvim'

    " Image viewer
    Plug 'edluffy/hologram.nvim'

    " Easy motion
    Plug 'easymotion/vim-easymotion'

    " VCS plugin
    if has('nvim') || has('patch-8.0.902')
        Plug 'mhinz/vim-signify'
    else
        Plug 'mhinz/vim-signify', { 'branch': 'legacy' }
    endif

call plug#end()
