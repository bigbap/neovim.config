require('filetype').setup({
    overrides = {
        function_extensions = {
            ['vert'] = function ()
                vim.cmd('set filetype=glsl')
            end,
            ['frag'] = function ()
                vim.cmd('set filetype=glsl')
            end
        }
    }
})
