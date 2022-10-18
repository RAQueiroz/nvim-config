local carbon_ok, carbon = pcall(require, 'carbon')
if not carbon_ok then
    return
end

carbon.setup {
    setting = 'value',
}
