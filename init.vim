source $HOME/.config/nvim/arc.vim
source $HOME/.config/nvim/vim-plug/plugins.vim
source $HOME/.config/nvim/plug-config/coc.vim
source $HOME/.config/nvim/mappings.vim
source $HOME/.config/nvim/settings.vim
source $HOME/.config/nvim/commands.vim
source $HOME/.config/nvim/abbreviations.vim
source $HOME/.config/nvim/lualine.lua
source $HOME/.config/nvim/toggleterm.lua
source $HOME/.config/nvim/neoscroll.lua

filetype plugin on

" Enables syntax highlighing
syntax enable

" Height for MRU (most recently used) files window
let g:MRU_Window_Height=16

" Open MRU file in current tab
let MRU_Open_File_Use_Tabs = 0

" Disable Netrw
let loaded_netrwPlugin = 1

" Lua plugins setup
lua require('colorizer').setup()
lua require('neoscroll').setup()
lua require('which-key').setup()
