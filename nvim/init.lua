--  _   _ ____        _   _       _
-- | \ | |  _ \      | \ | |_   _(_)_ __ ___
-- |  \| | | | |_____|  \| \ \ / / | '_ ` _ \
-- | |\  | |_| |_____| |\  |\ V /| | | | | | |
-- |_| \_|____/      |_| \_| \_/ |_|_| |_| |_|
-- Copyright: 2024 NewDawn0
--
-- Author: NewDawn0 (https://github.com/NewDawn0)

-- Load utility stuff
require("util.startup")
require("util")

-- Import plugin loader
-- local loader = require "util.loader"
local plugins = {
	"plugins.alpha",
	"plugins.boole",
	"plugins.bufferline",
	"plugins.cmp",
	"plugins.colorizer",
	"plugins.comment",
	"plugins.conform",
	"plugins.dap",
	"plugins.flash",
	"plugins.gen",
	"plugins.gitsigns",
	"plugins.indent",
	"plugins.lint",
	"plugins.lsp-zero",
	"plugins.lualine",
	"plugins.notify",
	"plugins.nvim-autopairs",
	"plugins.oil",
	"plugins.surround",
	"plugins.telescope",
	"plugins.tmux",
	"plugins.todo-comments",
	"plugins.tokyonight",
	"plugins.treesitter",
	"plugins.trim",
	"plugins.winsep",
	"plugins.wrapping",
}

for _, path in ipairs(plugins) do
	require(path)
end
