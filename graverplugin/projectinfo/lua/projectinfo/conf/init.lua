return {
    telescope = {
        file_ignore_patterns = {
            ".git/",
            "node_modules/"
        }
    },
    lsp_clangd = {
        cmd = {
            -- compile_commands.json目录位置
            "--compile-commands-dir=build",
          }
    }
}
