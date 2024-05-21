require("mason").setup()
require("mason-lspconfig").setup {
    ensure_installed = { "clangd", "cmake" , "lua_ls"},
}

local my_on_attach = function(_,bufnr)
  vim.keymap.set('n', '<leader>rn',vim.lsp.buf.rename, {})
  vim.keymap.set('n', '<leader>ca',vim.lsp.buf.code_action,{})

  vim.keymap.set('n', 'gd',vim.lsp.buf.definition, {})
  vim.keymap.set('n', 'gi',vim.lsp.buf.implementation, {})
  vim.keymap.set('n', 'gr',require('telescope.builtin').lsp_references,{})
  vim.keymap.set('n', 'K',vim.lsp.buf.hover,{})
end

-- vim.print(gns)

local lspconfig = require("lspconfig")

lspconfig.clangd.setup {
  on_attach = my_on_attach
}

lspconfig.lua_ls.setup {
  on_attach = my_on_attach,
  cmd = {
    "clangd",
    "--std=c++14",
    "--background-index",
    --同时开启的任务数
    "-j=12",
    -- "--folding-ranges",
    -- "--query-driver=/usr/bin/clang++", --mac上需要配置
    --启用clang-tidy以提供静态检查
    "--clang-tidy",
    --当 clangd 准备就绪时，用它来分析建议
    "--completion-parse=auto",
    --建议风格
    "--completion-style=detailed",
    --补全函数时，给参数提供占位符，可以使用 Tab 切换下一个占位符，知道函数末尾
    "--function-arg-placeholders",
    --默认格式化风格: 可用的有 LLVM, Google, Chromium, Mozilla, Webkit, Microsoft, GNU
    --也可以编写 .clang-format 自定义风格
    "--fallback-style=Webkit",
    --pch 优化的位置(Memory 或 Disk,前者会增加内存开销，但会提升性能)
    "--pch-storage=Memory",
    --让clangd生成更详细的日志
    "--log=verbose",
    -- 输出的 JSON 文件更加美观
    "--pretty",
    --建议中，已包含头文件的项与还未包含头文件的项会以圆点加以区分
    "--header-insertion-decorators",
    --插入建议时自动引入头文件
    "--header-insertion=iwyu",
    --全局补全，例如没有#include <iostream>时，也会给出std::cout建议
    --建议配合"--header-insertion=iwyu"使用
    "--all-scopes-completion",
    -- 建议的排序方案：hueristics (启发式), decision_forest (决策树)
    "--ranking-model=decision_forest",
  }
}


require('lint').linters_by_ft = {
  cpp = {'clangtidy'}
}


local cmp = require("cmp")

cmp.setup({
  -- 指定 snippet 引擎
  snippet = {
    expand = function(args)
      -- For `vsnip` users.
      vim.fn["vsnip#anonymous"](args.body)

      -- For `luasnip` users.
      -- require('luasnip').lsp_expand(args.body)

      -- For `ultisnips` users.
      -- vim.fn["UltiSnips#Anon"](args.body)

      -- For `snippy` users.
      -- require'snippy'.expand_snippet(args.body)
    end,
  },
  -- 补全源
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    -- For vsnip users.
    { name = "vsnip" },

    -- For luasnip users.
    -- { name = 'luasnip' },

    --For ultisnips users.
    -- { name = 'ultisnips' },

    -- -- For snippy users.
    -- { name = 'snippy' },
  }, { { name = "buffer" }, { name = "path" } }),

  -- 快捷键设置
  mapping = require("keybindings").cmp(cmp),
})

-- / 查找模式使用 buffer 源
cmp.setup.cmdline("/", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = "buffer" },
  },
})

-- : 命令行模式中使用 path 和 cmdline 源.
cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = "path" },
  }, {
    { name = "cmdline" },
  }),
})

