local packer = require("packer")

packer.startup(function(use)
	use("wbthomason/packer.nvim")
	-- use('ishan9299/nvim-solarized-lua')
	-- use 'folke/tokyonight.nvim'
	use("svrana/neosolarized.nvim")
	use("tjdevries/colorbuddy.nvim")
	use({ "kyazdani42/nvim-tree.lua", requires = "kyazdani42/nvim-web-devicons" })
	use({ "akinsho/bufferline.nvim", requires = { "kyazdani42/nvim-web-devicons", "moll/vim-bbye" } })
	use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons" } })
	use("arkav/lualine-lsp-progress")
	use({ "nvim-telescope/telescope.nvim", requires = { "nvim-lua/plenary.nvim" } })
	use("glepnir/dashboard-nvim")
	use("ahmedkhalf/project.nvim")
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use("williamboman/nvim-lsp-installer")
	use({ "neovim/nvim-lspconfig" })
	use("windwp/nvim-autopairs")
	use("windwp/nvim-ts-autotag")
	use("lewis6991/gitsigns.nvim")

	-- snippet 引擎
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/vim-vsnip")

	-- 补全源
	use("hrsh7th/cmp-vsnip")
	use("hrsh7th/cmp-nvim-lsp") -- { name = nvim_lsp }
	use("hrsh7th/cmp-buffer") -- { name = 'buffer' },
	use("hrsh7th/cmp-path") -- { name = 'path' }
	use("hrsh7th/cmp-cmdline") -- { name = 'cmdline' }

	-- 常见编程语言代码段
	use("rafamadriz/friendly-snippets")

	-- ui
	use("tami5/lspsaga.nvim")
	use("lukas-reineke/indent-blankline.nvim")
	use({ "jose-elias-alvarez/null-ls.nvim", requires = "nvim-lua/plenary.nvim" })
	use({ "jose-elias-alvarez/nvim-lsp-ts-utils", requires = "nvim-lua/plenary.nvim" })

	-- vimspecter
	use("puremourning/vimspector")

	-- astro support
	use("wuelnerdotexe/vim-astro")
end)

pcall(
	vim.cmd,
	[[
    augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
  ]]
)
