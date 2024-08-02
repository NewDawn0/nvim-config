--  _   _ ____        _   _       _
-- | \ | |  _ \      | \ | |_   _(_)_ __ ___
-- |  \| | | | |_____|  \| \ \ / / | '_ ` _ \
-- | |\  | |_| |_____| |\  |\ V /| | | | | | |
-- |_| \_|____/      |_| \_| \_/ |_|_| |_| |_|
-- Copyright: 2024 NewDawn0
--
-- Author: NewDawn0 (https://github.com/NewDawn0)

-- Utility functions
local util = require "util.util"

-- Setup undotree
local undotree = require "undotree"
undotree.setup {}

-- Set keybinds
util.setkb { "<leader>u", undotree.toggle, "Toggle undotree", { "n" } }
