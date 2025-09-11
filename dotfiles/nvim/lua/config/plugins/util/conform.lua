-- lua/plugins/conform.lua
return {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },

    opts = {
        format_on_save = {
            lsp_fallback = true,
            timeout_ms = 2000,
        },
        formatters_by_ft = {
            nim = { "nimpretty" },
            d   = { "dfmt" },
        },
        formatters = {
            nimpretty = {
                prepend_args = { "--indent:2", "--maxLineLen:100" },
            },
            dfmt = {
                command = "dfmt",
                args = {
                    "--brace_style", "otbs",
                    "--indent_style", "space",
                    "--indent_size", "4",
                },
                stdin = true,
            },
        },
    },

    config = function(_, opts)
        require("conform").setup(opts)

        -- Manual format keymap
        vim.keymap.set("n", "<leader>cf", function()
            require("conform").format({ async = true, lsp_fallback = true })
        end, { desc = "Format buffer" })
    end,
}
