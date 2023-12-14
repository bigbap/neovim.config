-- nvim/lua/pluginlist.lua

return {
	{
		'numToStr/Comment.nvim',
		config = function()
			require('Comment').setup(
				-- {
				-- 	toggler = {
				-- 		line = 'gcc',
				-- 		block = 'gbc'
				-- 	}
				-- }
			)
		end
	},
	{
		'catppuccin/nvim',
		priority = 1000,
		name = 'catppuccin',
		config = function()
			vim.cmd.colorscheme('catppuccin')

			vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
			vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
		end
	},
	{
		'nvim-lualine/lualine.nvim',
		dependencies = {
			'nvim-tree/nvim-web-devicons'
		},
		config = function()
			require('lualine').setup({
				icons_enabled = true,
				theme = 'catppuccin'
			})
		end
	},
	{
		-- lsp plugins
		'williamboman/mason.nvim',
		'williamboman/mason-lspconfig.nvim',
		'neovim/nvim-lspconfig',

		'folke/neodev.nvim',

		{
			'hrsh7th/nvim-cmp',
			dependencies = {
				'L3MON4D3/LuaSnip',
				'saadparwaiz1/cmp_luasnip',
				'rafamadriz/friendly-snippets',

				'hrsh7th/cmp-nvim-lsp'
			}
		}
	},
	{
		{
			'nvim-treesitter/nvim-treesitter',
			build = ':TSUpdate',
		},
		{
			'nvim-telescope/telescope.nvim',
			dependencies = { 'nvim-lua/plenary.nvim' }
		},
		{
			'nvim-telescope/telescope-fzf-native.nvim',
			build = 'make',
		}
	},
	{
		'folke/which-key.nvim',
		event = 'VeryLazy',
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		}
	},
    {
        'akinsho/toggleterm.nvim',
        version = "*",
        config = true
    },
	-- {
	-- 	-- DAP
	-- 	{
	-- 		'mfussenegger/nvim-dap',
	-- 		{
	-- 			'jay-babu/mason-nvim-dap.nvim',
	-- 			dependencies = {
	-- 				'williamboman/mason.nvim'
	-- 			}
	-- 		}
	-- 	}
	-- }
}
