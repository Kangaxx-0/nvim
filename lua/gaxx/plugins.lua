local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use "wbthomason/packer.nvim"                                -- Have packer manage itself
  use "nvim-lua/popup.nvim"                                   -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim"                                 -- Useful lua functions used ny lots of plugins
  use "windwp/nvim-autopairs"                                 -- A minimalist autopairs
  use 'folke/tokyonight.nvim'                                 -- Themes plugins
  use "bluz71/vim-nightfly-guicolors"                             
  use "rebelot/kanagawa.nvim"
  use "Mofiqul/dracula.nvim"
  use 'EdenEast/nightfox.nvim'
  use 'marko-cerovac/material.nvim'
  use "folke/which-key.nvim"                                  -- Key binding
  use "nvim-telescope/telescope.nvim"                         -- Telescope -> fuzzy finder
  use 'nvim-telescope/telescope-media-files.nvim'
  use "L3MON4D3/LuaSnip"                                      -- Snippet engine
  use "rafamadriz/friendly-snippets"                          -- A bunch of snippets to use
  use 'kyazdani42/nvim-tree.lua'                              -- nvimTree, a file explorer
  use "akinsho/bufferline.nvim"
  use "moll/vim-bbye"
  use 'goolord/alpha-nvim'                                    -- Dashboard
  use "antoinemadec/FixCursorHold.nvim"                       -- This is needed to fix lsp doc highlight
  use "lewis6991/impatient.nvim"                              -- Speed up loading
  use "lukas-reineke/indent-blankline.nvim"                   -- Indentation
  use "lewis6991/spellsitter.nvim"                            -- Spell check
  use "phaazon/hop.nvim"                                      -- Easy motion with Lua!
  use "akinsho/toggleterm.nvim"                               -- Toggle Terminal
  use "rmagatti/auto-session"                                 -- Session Manager
  use "kyazdani42/nvim-web-devicons"                          -- Icons for other plugins
  use {                                                       -- Neovim Treesitter configurations and abstraction layer
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }

  -- Dev
  use "hrsh7th/nvim-cmp"                                      -- The completion plugin
  use "hrsh7th/cmp-buffer"                                    -- Buffer completions
  use "hrsh7th/cmp-path"                                      -- Path completions
  use "hrsh7th/cmp-cmdline"                                   -- Cmdline completions
  use "saadparwaiz1/cmp_luasnip"                              -- Snippet completions
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-nvim-lua"
  use "j-hui/fidget.nvim"                                     -- LSP progress
  use "simrat39/symbols-outline.nvim"                         -- A tree like view for symbols in Neovim using the Language Server Protocol. Supports all your favourite languages.
  use "neovim/nvim-lspconfig"                                 -- Quickstart configurations for the Neovim LSP client
  use "williamboman/nvim-lsp-installer"                       -- Simple to use language server installer
  use "p00f/nvim-ts-rainbow"                                  -- Rainbow 🌈 parentheses for Neovim using tree-sitter 🌈.
  use "numToStr/Comment.nvim"                                 -- Smart and Powerful comment plugin for Neovim. Supports commentstring, motions, dot-repeat and more.
  use "JoosepAlviste/nvim-ts-context-commentstring"
  use "jose-elias-alvarez/null-ls.nvim"                       -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua.
  use "ahmedkhalf/project.nvim"                               -- An all in one Neovim plugin that provides superior project management
  use "nvim-lualine/lualine.nvim"                             -- A blazing fast and easy to configure Neovim statusline
  use "folke/trouble.nvim"                                    -- Diagnostic list
  use "anuvyklack/pretty-fold.nvim"                           -- Folding preview
  use "mfussenegger/nvim-dap"                                 -- Debug Adapter Protocol for neovim
  use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
  use "braxtons12/blame_line.nvim"                            -- Git blame current line
  use "github/copilot.vim"                                    -- Git copilot

  -- Go
  use "fatih/vim-go"                                          -- Go language support

  -- Rust
  use "simrat39/rust-tools.nvim"

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
