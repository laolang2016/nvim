-- 基础设置
require('basic')
-- 快捷键
require('keybindings')
-- Packer 插件管理
require("plugins")
-- 主题设置
require("colorscheme")

-- 插件配置

-- nvim-tree
require("plugin-config.nvim-tree")
-- bufferline
require("plugin-config.bufferline")
-- lualine
require("plugin-config.lualine")
-- telescope
require("plugin-config.telescope")
-- nvim-treesitter
require("plugin-config.nvim-treesitter") 
-- lsp
require("plugin-config.lspconfig") 
