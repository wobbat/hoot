return {
  "EdenEast/nightfox.nvim",
  config = function()
    local hostname = vim.fn.hostname()
    if hostname == "snorlax" then
       require('nightfox').setup({
         palettes = {
           carbonfox = {
             bg0 = "#000000",
             bg1 = "#000000",
             bg2 = "#000000",
             bg3 = "#000000",
             bg4 = "#000000",
             sel0 = "#000000",
             sel1 = "#000000",
           }
         }
       })
      vim.cmd('colorscheme carbonfox')
    else
      vim.cmd('colorscheme terafox')
    end
  end
}
