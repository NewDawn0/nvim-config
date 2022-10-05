--[[
 _   _               ____                        ___
| \ | | _____      _|  _ \  __ ___      ___ __  / _ \
|  \| |/ _ \ \ /\ / / | | |/ _` \ \ /\ / / '_ \| | | |
| |\  |  __/\ V  V /| |_| | (_| |\ V  V /| | | | |_| |
|_| \_|\___| \_/\_/ |____/ \__,_| \_/\_/ |_| |_|\___/
-----------  https://github.com/NewDawn0  -----------
--]]

-- Aliases
local cmd = vim.cmd
local g = vim.g

-- //////// Load modules ////////
require('settings')
require('colourschemes')
require('mappings')
require('plugins')
require('autocmd')

-- /////// Setup ////////
cmd("colorscheme onedark")



-- //////// Info ////////
-- Colourschemes
--      nightfox    solarized dark
--      terafox     solarized dark
--      dayfox      lightmode
--      dawnfox     lightmode
--      duskfox     dracula
--      dracula     dracula
--      nordfox     nord
--      carbonfox   darkmode
--      doom-one    doom-one
--      onedark     onedark
