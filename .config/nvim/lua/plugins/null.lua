local vim = vim
local nls = require("null-ls")

local diagnostics = nls.builtins.diagnostics
local formatting = nls.builtins.formatting

nls.setup({
    sources = {
        diagnostics.actionlint, diagnostics.codespell, diagnostics.jsonlint,
        formatting.jq, diagnostics.luacheck, formatting.lua_format,
        diagnostics.rubocop.with({command = {"bundle", "exec", "rubocop"}}),
        formatting.rubocop.with({command = {"bundle", "exec", "rubocop"}}),
        diagnostics.sqlfluff.with({extra_args = {"--dialect", "postgres"}}),
        formatting.sqlfluff.with({extra_args = {"--dialect", "postgres"}}),
        diagnostics.shellcheck, formatting.shfmt, diagnostics.eslint_d,
        formatting.prettier, diagnostics.revive, formatting.gofmt,
        formatting.rustfmt
    },

    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({group = augroup, buffer = bufnr})
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format({bufnr = bufnr, timeout_ms = 2000})
                end
            })
        end
    end
})
