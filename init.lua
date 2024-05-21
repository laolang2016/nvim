-- 项目级别配置
gns = require("plugin-config.projectinfo")



-- 基础设置
require('basic')
-- 快捷键
require('keybindings')
-- Packer 插件管理
require("plugins")
-- 主题设置
require("colorscheme")

-- 插件配置

-- nvim-tree 目录树
require("plugin-config.nvim-tree")
-- bufferline 状态栏
require("plugin-config.bufferline")
-- lualine tab 文件文件导航
require("plugin-config.lualine")
-- telescope 文件搜索
require("plugin-config.telescope")
-- nvim-treesitter 代码高亮
require("plugin-config.nvim-treesitter")
-- lsp 
require("plugin-config.lspconfig")
-- toggleterm 终端
require("plugin-config.toggleterm")




