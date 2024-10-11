vim.cmd("set number relativenumber")
vim.cmd("set termguicolors")

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- add your plugins here

	-- Themes
   { "rose-pine/neovim", name = "rose-pine", priority = 100 },

	-- Tools
   { "nvim-telescope/telescope.nvim", tag = '0.1.8',
	dependencies = { 'nvim-lua/plenary.nvim'} },
   { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
},

  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})

-- Setting up telescope
local builtin = require("telescope.builtin")
vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<C-h>', builtin.live_grep, {})

-- Setting up treesitter
local config = require("nvim-treesitter.configs")
config.setup({
	ensure_installed = {"c", "lua", "python"},
	highlight = { enable = true},
	indent = { enable = true}
})

-- Loading rose-pine
vim.cmd[[colorscheme rose-pine]]

vim.o.background = 'dark'

-- Transparent Nvim
function Transparent(color)
    color = color or "rose-pine"
    vim.cmd.colorscheme(color)

   vim.api.nvim_set_hl(0, "Normal", { bg = "none" })  
   vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end
Transparent()

