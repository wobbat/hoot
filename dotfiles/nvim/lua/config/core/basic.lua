-- line numbers
-- test
vim.opt.nu = true
vim.opt.relativenumber = true
-- Formatting
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.list = true


-- pretty whitespace and git chars
vim.opt.listchars = {
    space = " ",
    eol = " ",
    tab = "|·",
    trail = "•",
    extends = "❯",
    precedes = "❮",
    nbsp = ""
}

vim.opt.fillchars = {
    fold = " ",
    foldsep = " ",
    foldopen = "",
    foldclose = "",
    diff = "╱"
}

vim.opt.cursorline = false

vim.api.nvim_set_hl(0, "WinSeparator", {
    fg = "#44475a", -- darker gray (adjust to your liking)
    bg = "NONE",
    bold = true
})

vim.opt.fillchars:append { vert = " " } -- or "┃", "▌"

vim.opt.background = "dark"             -- set this to dark or light
--vim.cmd('colorscheme rasmus')


-- Add local bun bin to PATH for LSPs
local bun_local_bin = vim.fn.expand("~/.bun/bin")
if vim.fn.isdirectory(bun_local_bin) == 1 then
    if not string.find(vim.env.PATH or "", bun_local_bin, 1, true) then
        vim.env.PATH = bun_local_bin .. ":" .. vim.env.PATH
    end
end

vim.highlight.priorities.semantic_tokens = 95
