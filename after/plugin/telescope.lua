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
-- vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find files' })
-- vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Live grep' })
-- vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Buffers' })
-- vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Help tags' })

local wk = require('which-key')
wk.register({
	s = {
		name = '[s]earch',
		f = { builtin.find_files, 'Find Files' },
		g = { builtin.live_grep, 'Live Grep' },
		b = { builtin.buffers, 'Buffers' },
		h = { builtin.help_tags, 'Help Tags' }
	}
}, {
	prefix = '<leader>'
})

