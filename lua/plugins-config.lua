local configs = {
    ['mini.move'] = function()
        require('mini.move').setup({
            mappings = {
                left  = '<C-h>',
                right = '<C-l>',
                down  = '<C-j>',
                up    = '<C-k>',
                line_left  = '<C-h>',
                line_right = '<C-l>',
                line_down  = '<C-j>',
                line_up    = '<C-k>',
            },
        })
    end,
}

return {
    setup = function()
        for module_name, config_fn in pairs(configs) do
            local ok, _ = pcall(require, module_name)
            if ok then
                config_fn()
            end
        end
    end
}
