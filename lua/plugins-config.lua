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
