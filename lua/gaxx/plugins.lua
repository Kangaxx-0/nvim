local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	-- My plugins here
	use("wbthomason/packer.nvim") -- Have packer manage itself
	use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
	use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins
	use("windwp/nvim-autopairs") -- autopairs
	-- Themes plugins
	use("folke/tokyonight.nvim")
	use("rafamadriz/neon")
	use("bluz71/vim-nightfly-guicolors")
	-- Which keys
	use({
		"folke/which-key.nvim",
		config = function()
			require("which-key").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	})
	use("nvim-telescope/telescope.nvim") -- Telescope
	use("nvim-telescope/telescope-media-files.nvim")
	use("L3MON4D3/LuaSnip") --snippet engine
	use("rafamadriz/friendly-snippets") -- a bunch of snippets to use
	use("kyazdani42/nvim-tree.lua") -- NvimTree
	use("akinsho/bufferline.nvim")
	use("moll/vim-bbye")
	use("goolord/alpha-nvim") -- Aplha
	use("antoinemadec/FixCursorHold.nvim") -- This is needed to fix lsp doc highlight
	use("lewis6991/impatient.nvim") -- Spped up loading
	use("lukas-reineke/indent-blankline.nvim") -- Indentation
	use("lewis6991/spellsitter.nvim") -- Spell check
	use("phaazon/hop.nvim") -- Easymotion with Lua!

	-- Dev
	use("hrsh7th/nvim-cmp") -- The completion plugin
	use("hrsh7th/cmp-buffer") -- buffer completions
	use("hrsh7th/cmp-path") -- path completions
	use("hrsh7th/cmp-cmdline") -- cmdline completions
	use("saadparwaiz1/cmp_luasnip") -- snippet completions
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-nvim-lua")
	use("neovim/nvim-lspconfig") -- enable LSP
	use("williamboman/nvim-lsp-installer") -- simple to use language server installer
	use("p00f/nvim-ts-rainbow")
	use("numToStr/Comment.nvim") -- Comment
	use("JoosepAlviste/nvim-ts-context-commentstring")
	use({ "TimUntersberger/neogit", requires = "nvim-lua/plenary.nvim" }) -- Git
	use("lewis6991/gitsigns.nvim")
	use("f-person/git-blame.nvim")
	use("jose-elias-alvarez/null-ls.nvim") -- Linkters
	use("ahmedkhalf/project.nvim") -- project
	use("ray-x/go.nvim") -- go neovim
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	}) -- Statusline
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	}) ---- TreeSitter
	use({
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("trouble").setup({})
		end,
	}) ---- Trouble

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
