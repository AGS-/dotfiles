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

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.wo.number = true
vim.o.backspace = "indent,eol,start"
vim.o.visualbell = true
vim.o.ruler = true
vim.o.hidden = true
vim.opt.wrap = true
vim.opt.textwidth = 0 
vim.opt.formatoptions = "tcqrn1"
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.shiftround = false

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    {"neanias/everforest-nvim", version = false, lazy = false, priority = 1000},
    'neovim/nvim-lspconfig',
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'nvim-lua/plenary.nvim',
    'jose-elias-alvarez/null-ls.nvim',
    {'nvim-treesitter/nvim-treesitter', build = ':TSUpdate'},
    {'nvim-telescope/telescope.nvim', tag = '0.1.5', dependencies = {'nvim-lua/plenary.nvim'}},
    'scrooloose/nerdtree',
    'mhinz/vim-signify',
    'scrooloose/nerdcommenter',
    'enricobacis/vim-airline-clock',
    {'nvim-lualine/lualine.nvim', dependencies = {'nvim-tree/nvim-web-devicons'}},
    {
      "greggh/claude-code.nvim",
      dependencies = {
        "nvim-lua/plenary.nvim", -- Already included above, but good to be explicit
      },
      config = function()
        require("claude-code").setup({
          -- Add any configuration options here if needed
        })
      end,
    },
  },
})

require("everforest").load()
require("lualine").setup({
  options = {
    theme = 'everforest',
    icons_enabled = 'false',
    }
})
