local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", 
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "

require("lazy").setup("plugins", {
    change_detection = {
        enabled = true,
        notify = false, 
    },
})

require("core.settings")
require("core.keybinds")
-- Disable LSP status messages
vim.lsp.handlers["$/progress"] = function() end

vim.opt.laststatus = 0
vim.api.nvim_command('hi! link StatusLine Normal')
vim.api.nvim_command('hi! link StatusLineNC Normal')
vim.opt.statusline = "%{repeat('─',winwidth('.'))}"

require("oil").setup({})
