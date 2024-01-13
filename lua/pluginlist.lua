-- nvim/lua/pluginlist.lua

return {
	{
		'numToStr/Comment.nvim',
		config = function()
			require('Comment').setup()
		end
	},
	{
		'catppuccin/nvim',
		priority = 1000,
		name = 'catppuccin',
		config = function()
            require('catppuccin').setup({
                custom_highlights = function()
                    return {
                        Comment = { fg = 'red' }
                    }
                end
            })
		end
	},
    {
        'ellisonleao/gruvbox.nvim',
        priority = 1000,
        config = function()
            require('gruvbox').setup({
                overrides = {
                    Comment = { fg = 'red' }
                }
            })
        end
    },
    {
        'rebelot/kanagawa.nvim',
        priority = 1000,
        config = function()
            require('kanagawa').setup({
                overrides = function ()
                    return {
                        Comment = { fg = '#C34043' }
                    }
                end
            })
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
	{
		-- DAP
        -- 'nvim-lua/plenary.nvim',
        -- {
        --     'rcarriga/nvim-dap-ui',
        --     dependencies = {
        --         'mfussenegger/nvim-dap'
        --     }
        -- },
        -- 'simrat39/rust-tools.nvim',
        -- 'mfussenegger/nvim-dap'
        -- 'nvim-telescope/telescope-dap.nvim'
	},
    {
        'nathom/filetype.nvim'
    }
}
