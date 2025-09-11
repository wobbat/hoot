return {
    "folke/snacks.nvim",
    ---@type snacks.Config
    opts = {
        picker = {
            -- your picker configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
            prompt = " # ",
            icons = {
                files = { enabled = false }, -- no devicons in results
            },
            sources = {
                explorer = {
                    diagnostics = false,
                    icons = {
                        files = { enabled = false }, -- list icons
                        git = { enabled = false },   -- git status glyphs in list
                    },
                },
            },
            layout = {
                preview = "main",
                layout = {
                    box = "vertical",
                    backdrop = false,
                    width = 0,
                    height = 0.4,
                    position = "bottom",
                    border = "none",
                    title = "",
                    title_pos = "left",
                    { win = "input", height = 1, border = "none" },
                    {
                        box = "horizontal",
                        { win = "list",    border = "none" },
                        { win = "preview", title = "{preview}", width = 0.6, border = "left" },
                    },
                },
            }
        }
    },
    keys = {
        -- Top Pickers & Explorer
        { "<leader>ff", function() Snacks.picker.smart() end, desc = "Smart Find Files" },
        { "<leader>mg", function() Snacks.picker.grep() end,  desc = "Grep" },
        {
            "<leader>fe",
            function()
                Snacks.explorer({
                    layout = {
                        preview = "main",
                        layout = {
                            backdrop = false,
                            width = 40,
                            min_width = 40,
                            height = 0,
                            position = "left",
                            border = "none",
                            box = "vertical",
                            {
                                win = "input",
                                height = 1,
                                border = "none",
                                title = "",
                                title_pos = "center",
                            },
                            { win = "list",    border = "none" },
                            { win = "preview", title = "{preview}", height = 0.4, border = "top" },
                        },
                    }
                })
            end,
            desc = "File Explorer"
        },
        { "<leader>bl", function() Snacks.picker.buffers() end,               desc = "Buffers" },

        -- lsp
        { "gd",         function() Snacks.picker.lsp_definitions() end,       desc = "Goto Definition" },
        { "gD",         function() Snacks.picker.lsp_declarations() end,      desc = "Goto Declaration" },
        { "gr",         function() Snacks.picker.lsp_references() end,        nowait = true,                  desc = "References" },
        { "gI",         function() Snacks.picker.lsp_implementations() end,   desc = "Goto Implementation" },
        { "gy",         function() Snacks.picker.lsp_type_definitions() end,  desc = "Goto T[y]pe Definition" },
        { "<leader>ss", function() Snacks.picker.lsp_symbols() end,           desc = "LSP Symbols" },
        { "<leader>sS", function() Snacks.picker.lsp_workspace_symbols() end, desc = "LSP Workspace Symbols" },
    },
}
