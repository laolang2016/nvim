local packer = require("packer")

packer.startup(function(use)
    -- Packer 可以管理自己本身
    use 'wbthomason/packer.nvim'
    
    -- 颜色主题
    -- tokyonight
    use {
        "folke/tokyonight.nvim",
        tag = "v3.0.0"
    }

    -- nvim-tree
    use {
        "kyazdani42/nvim-tree.lua",
        requires = {
            "nvim-tree/nvim-web-devicons",
            tag = "v0.100"
        },
        tag = "v1.3.2"
    }

    -- bufferline
    use {
        "akinsho/bufferline.nvim",
        requires = {
            {
                "nvim-tree/nvim-web-devicons",
                tag = "v0.100"
            },
            {
                "moll/vim-bbye",
                tag = "v1.0.1"
            },
        },
        tag = "v4.5.3"
    }

    -- lualine
    use { 
        "nvim-lualine/lualine.nvim", 
        requires = { 
            "nvim-tree/nvim-web-devicons",
            tag = "v0.100"
        },
        tag = "compat-nvim-0.6"
    }
    use("arkav/lualine-lsp-progress")

    -- telescope
    use { 
        'nvim-telescope/telescope.nvim',
        requires = { 
            "nvim-lua/plenary.nvim",
            tag = "v0.1.4"
        },
        tag = "nvim-0.6"
    }

    -- treesitter （新增）
    use { 
        "nvim-treesitter/nvim-treesitter", 
        run = ":TSUpdate" 
    }

    --------------------- LSP --------------------
    use {
        "williamboman/mason.nvim",
        tag = "v1.10.0"
    }
    use {
        "williamboman/mason-lspconfig.nvim",
        tag = "v1.29.0"
    }
    use {
        "neovim/nvim-lspconfig",
        tag = "v0.1.7"
    }

    -- 补全引擎
    use("hrsh7th/nvim-cmp")
    -- snippet 引擎
    use("hrsh7th/vim-vsnip")
    -- 补全源
    use("hrsh7th/cmp-vsnip")
    use("hrsh7th/cmp-nvim-lsp") -- { name = nvim_lsp }
    use("hrsh7th/cmp-buffer") -- { name = 'buffer' },
    use("hrsh7th/cmp-path") -- { name = 'path' }
    use("hrsh7th/cmp-cmdline") -- { name = 'cmdline' }

    -- 常见编程语言代码段
    use("rafamadriz/friendly-snippets")

    -- 代码注释插件
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }

    use {
        "mfussenegger/nvim-lint"
    }

    -- 终端插件
    use {
        "akinsho/toggleterm.nvim",
        tag = "v2.11.0"
    }
end)