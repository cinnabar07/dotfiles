local null_ls = require("null-ls")

null_ls.setup({
    debounce = 150,
    sources = {
        null_ls.builtins.formatting.stylua,
        -- require("null-ls").builtins.diagnostics.eslint,
        -- require("null-ls").builtins.completion.spell,
        -- null_ls.builtins.formatting.stylish_haskell,
        -- null_ls.builtins.formatting.latexindent,
        -- null_ls.builtins.formatting.google_java_format,
        -- null_ls.builtins.formatting.htmlbeautifier,
        null_ls.builtins.formatting.clang_format,
        -- null_ls.builtins.formatting.biome,
        -- null_ls.builtins.code_actions.refactoring,
        null_ls.builtins.diagnostics.flake8,
        null_ls.builtins.formatting.autopep8,
        -- null_ls.builtins.formatting.asmfmt,
        -- null_ls.builtins.formatting.beautysh,
    },
})
