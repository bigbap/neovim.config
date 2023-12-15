-- nvim/after/plugin/telescope.lua

local telescope = require('telescope')

telescope.setup({
	extensions = {
		fzf = {
			fuzzy = true,
			override_generic_sorter = true,
			override_file_sorter = true,
			case_mode = 'smart_case'
		}
	}
})

telescope.load_extension('fzf')

local builtin = require('telescope.builtin')

local wk = require('which-key')
wk.register({
	s = {
		name = '[s]earch',
		f = { builtin.find_files, 'Find Files' },
		g = { builtin.live_grep, 'Live Grep' },
		h = { builtin.help_tags, 'Help Tags' }
	},
	['<Space>'] = { builtin.buffers, 'Buffer List' }
}, {
	prefix = '<leader>'
})

