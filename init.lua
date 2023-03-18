--[[
 _   _               ____                        ___
| \ | | _____      _|  _ \  __ ___      ___ __  / _ \
|  \| |/ _ \ \ /\ / / | | |/ _` \ \ /\ / / '_ \| | | |
| |\  |  __/\ V  V /| |_| | (_| |\ V  V /| | | | |_| |
|_| \_|\___| \_/\_/ |____/ \__,_| \_/\_/ |_| |_|\___/
-----------  https://github.com/NewDawn0  -----------
--]]

-- Set termguicolors
vim.opt.termguicolors = true
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.cmd('set tabstop=4')

-- Packages
require('bootstrap')
require('lazy').setup(require('plugins'), { ui = { border = "rounded" } })

-- Improve speed
require('impatient')

-- Settings, commands, autocmds & mappings
require('autocmds')
require('settings')
require('mappings')
require('commands')

-- vars
local g = vim.g

-- Setup lsp
require('config.lsp')

-- Colourscheme
vim.cmd('colorscheme tokyonight-night')

-- Open nvim tree on startup
local function open_nvim_tree(data)
    local directory = vim.fn.isdirectory(data.file) == 1
    if not directory then
        return
    end
    vim.cmd.cd(data.file)
    require("nvim-tree.api").tree.open()
end
vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

-- neovide options
if vim.g.neovide then
    g.neovide_confirm_quit = false
    g.neovide_input_macos_alt_is_meta = true
    g.neovide_cursor_animation_length = 0.05
    g.neovide_cursor_trail_size = 0.5
end
