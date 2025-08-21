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
vim.opt.termguicolors = true

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    {"neanias/everforest-nvim", version = false, lazy = false, priority = 1000},
    {
      'neovim/nvim-lspconfig',
      dependencies = {
        'hrsh7th/nvim-cmp',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
      },
      config = function()
        -- Setup nvim-cmp (minimal)
        local cmp = require('cmp')
        cmp.setup({
          mapping = cmp.mapping.preset.insert({
            ['<C-Space>'] = cmp.mapping.complete(),
            ['<C-e>'] = cmp.mapping.abort(),
            ['<CR>'] = cmp.mapping.confirm({ select = true }),
            ['<Tab>'] = cmp.mapping.select_next_item(),
            ['<S-Tab>'] = cmp.mapping.select_prev_item(),
          }),
          sources = cmp.config.sources({
            { name = 'nvim_lsp' },
            { name = 'buffer' },
          }),
        })

        -- Setup LSP capabilities for autocomplete
        local capabilities = require('cmp_nvim_lsp').default_capabilities()
        local lspconfig = require('lspconfig')

        -- Common on_attach function for all LSPs
        local on_attach = function(client, bufnr)
          local opts = { noremap = true, silent = true, buffer = bufnr }
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
          vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
          vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
          vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
          vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
          vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        end

        -- Rust (rust-analyzer)
        lspconfig.rust_analyzer.setup({
          capabilities = capabilities,
          on_attach = on_attach,
          settings = {
            ["rust-analyzer"] = {
              checkOnSave = {
                command = "clippy"
              },
            }
          }
        })

        -- Python (pyright)
        lspconfig.pyright.setup({
          capabilities = capabilities,
          on_attach = on_attach,
        })

        -- TypeScript/JavaScript (ts_ls)
        lspconfig.ts_ls.setup({
          capabilities = capabilities,
          on_attach = on_attach,
        })
      end,
    },
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
        "nvim-lua/plenary.nvim",
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
