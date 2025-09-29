-----------------------------------------------------------
-- Netrw configuration file
----------------------------------------------------------
local g = vim.g
local autocmd = vim.api.nvim_create_autocmd -- Create autocommand

local options_append = {
    netrw_winsize = "17",          -- 17% size
    -- Always open netrw in the current window
    netrw_browse_split = 0,        -- 0 = reuse the current window
    netrw_altv = 1,                -- prefer opening splits to the right (if you ever do)
    netrw_winsize = 25,            -- ignored if split=0, but you can leave it
    netrw_banner = "0",            -- hide banner
    netrw_localmkdir = "mkdir -p", -- change mkdir cmd
    netrw_localcopycmd = "cp -r",  -- change copy command
    netrw_localrmdir = "rm -r",    -- change delete command
    netrw_list_hide = [['\(^\|\s\s\)\zs\.\S\+']],
    netrw_chdir = 0,
    netrw_localcopydir = 0

}

for k, v in pairs(options_append) do g[k] = v end

-- Always center netrw when opening a directory at startup
autocmd("VimEnter", {
    callback = function()
        local argv = vim.fn.argv()
        if #argv == 1 and vim.fn.isdirectory(argv[1]) == 1 then
            vim.cmd("Explore " .. vim.fn.fnamemodify(argv[1], ":p"))
        end
    end,
})


-- Always center netrw when later editing a directory
autocmd("BufEnter", {
    callback = function(args)
        local name = vim.api.nvim_buf_get_name(args.buf)
        if name ~= "" and vim.fn.isdirectory(name) == 1 then
            vim.cmd("Explore " .. name)
        end
    end,
})

autocmd("filetype", {
    pattern = "netrw",
    desc = "Better mappings for netrw",
    callback = function()
        local bind = function(lhs, rhs)
            vim.keymap.set("n", lhs, rhs, { remap = true, buffer = true })
        end

        -- Navigation
        bind("H", "u")    -- preview dir
        bind("h", "-^")   -- go up
        bind("l", "<CR>") -- open file or dir
        bind(".", "gh")   -- toggle dotfiles
    end
})
