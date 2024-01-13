-- nvim/after/plugins/lsp.lua

local on_attach = function(_, bufnr)
	local bufmap = function(keys, func, desc)
		vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
    end

	bufmap('<leader>r', vim.lsp.buf.rename, 'Rename')
	bufmap('<leader>a', vim.lsp.buf.code_action, 'Code Action')

	bufmap('gd', vim.lsp.buf.definition)
	bufmap('gD', vim.lsp.buf.declaration)
	bufmap('gI', vim.lsp.buf.implementation)
	bufmap('<leader>D', vim.lsp.buf.type_definition, 'Type Definition')
    bufmap('<leader>e', vim.diagnostic.open_float, 'Expand Diagnostics');

    bufmap('gr', require('telescope.builtin').lsp_reference)
	bufmap('<leader>s', require('telescope.builtin').lsp_document_symbols, 'Document Symbols')
	bufmap('<leader>S', require('telescope.builtin').lsp_dynamic_workspace_symbols, 'Dynamic Workspace Symbols')

	bufmap('K', vim.lsp.buf.hover)

	vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
		vim.lsp.buf.format()
	end, {})
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

--local lspconfig = require('lspconfig')
-- lspconfig.lua_ls.setup {
-- 	on_attach = on_attach,
-- 	capabilities = capabilities,
-- 	Lua = {
-- 		workspace = { checkThirdParty = false },
-- 		telemetry = { enable = false }
-- 	}
-- }

require('mason').setup()
require('mason-lspconfig').setup({
	ensure_installed = {
		'lua_ls',
		'tsserver',
		'rust_analyzer',
	}
})
require('mason-lspconfig').setup_handlers({
	function(server_name)
		require('lspconfig')[server_name].setup {
			on_attach = on_attach,
			capabilities = capabilities,
		}
	end,

	['lua_ls'] = function()
		require('neodev').setup()
		require('lspconfig').lua_ls.setup {
			on_attach = on_attach,
			capabilities = capabilities,
			Lua = {
				workspace = { checkThirdParty = false },
				telemetry = { enable = false }
			}
		}
	end,

    ['rust_analyzer'] = function()
        require('lspconfig').rust_analyzer.setup {
            on_attach = on_attach,
            capabilities = capabilities,
            settings = {
                ['rust-analyzer'] = {
                    check = { command = 'clippy' }
                }
            }
        }
    end,
})

-- require('lspconfig').glsl_analyzer.setup {
--     filetypes = { 'glsl', 'vert', 'tesc', 'tese', 'frag', 'geom', 'comp' }
-- }
