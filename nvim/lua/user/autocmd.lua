local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 100,
        })
    end,
})

vim.api.nvim_command([[
    function! YankFullPathToOsc()
        let @+ = expand('%:p')
        OSCYankRegister +
    endfunction

    function! YankRelativePathToOsc()
        let @+ = expand('%:.')
        OSCYankRegister +
    endfunction
]])

vim.api.nvim_set_keymap('n', '<leader>yr', ':call YankRelativePathToOsc()<CR>', { noremap = true, silent = false })
vim.api.nvim_set_keymap('n', '<leader>yf', ':call YankFullPathToOsc()<CR>', { noremap = true, silent = false })
