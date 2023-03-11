--[[
   _   _ ____        _   ___     ___
  | \ | |  _ \      | \ | \ \   / (_)_ __ ___
  |  \| | | | |_____|  \| |\ \ / /| | '_ ` _ \
  | |\  | |_| |_____| |\  | \ V / | | | | | | |
  |_| \_|____/      |_| \_|  \_/  |_|_| |_| |_|
  File: plugins.lua
  Desc: List of plugins 
--]]
return {
    -- Colourschemes
    { 'marko-cerovac/material.nvim', lazy = false, priority = 10,
        config = function() require 'config.colourschemes.material' end
    },
    {'sainnhe/edge', lazy = true , priority = 10,
        config = function() require 'config.colourschemes.edge' end
    },
    {'tiagovla/tokyodark.nvim', lazy = true, priority = 10,
        config = function() require 'config.colourschemes.tokyodark' end
    },
    { 'folke/tokyonight.nvim', lazy = true, priority = 10 },
    { 'navarasu/onedark.nvim',
    	lazy = true, priority = 10,
        config = function() require 'config.colourschemes.onedark' end
    },
    -- UI
    { 'nvim-zh/colorful-winsep.nvim', event = "VimEnter", config = true },
    { 'iamcco/markdown-preview.nvim', build = 'cd app && yarn install', lazy = true },
    { 'feline-nvim/feline.nvim', event = "BufWinEnter", ft = "!alpha",
        config = function() require 'config.plugins.feline' end
    },
    { 'goolord/alpha-nvim',
        dependencies = { 'kyazdani42/nvim-web-devicons' },
        config = function() require 'config.plugins.dashboard' end
    },
    { 'NvChad/nvim-colorizer.lua', event = "BufWinEnter", ft = { "!aerial", "!NvimTree", "!alpha" },
        config = function () require 'config.plugins.colorizer' end
    },
    { 'folke/todo-comments.nvim', event = "BufWinEnter",
        config = function() require 'config.plugins.todo' end,
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    { 'lewis6991/gitsigns.nvim',
        ft = "gitcommit", event = "BufWinEnter",
        config = true
    },
    { 'akinsho/bufferline.nvim', event = "BufWinEnter",
        config = function() require 'config.plugins.bufferline' end,
        dependencies = { 'kyazdani42/nvim-web-devicons' }
    },
    { 'kyazdani42/nvim-tree.lua', event = "UIEnter",
        config = function() require 'config.plugins.tree' end,
        dependencies = { 'kyazdani42/nvim-web-devicons', }
    },
    { 'rcarriga/nvim-notify', priority = 9,
        cmd = { 'AerialToggle', 'AerialClose', 'AerialCloseAll', 'AerialOpen', 'AerialOpenAll' },
        config = function() require 'config.plugins.notify' end
    },
    { 'stevearc/aerial.nvim', event = "BufWinEnter", priority = 7,
        config = function() require 'config.plugins.aerial' end
    },
    -- Utils
    { 'famiu/bufdelete.nvim', lazy = true},
    { 'mzlogin/vim-markdown-toc', lazy = false},
    { 'mrjones2014/smart-splits.nvim', },
    -- LSP
}