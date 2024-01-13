require('nvim-treesitter.configs').setup {
	ensure_installed = {
		'vim',
		'vimdoc',
		'lua',
		'cpp',
		'typescript',
		'javascript',
		'rust',
        'glsl'
	},

	auto_install = false,

	highlight = { enable = true },

	indent = { enable = true },
}

