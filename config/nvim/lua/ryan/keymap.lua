### KEYMAP ###
local nmap = function(lhs, rhs)
    vim.api.nvim_set_keymap('n', lhs, rhs, { noremap = true, silent = true })
end
local imap = function(lhs, rhs)
    vim.api.nvim_set_keymap('i', lhs, rhs, { noremap = true, silent = true })
end
local vmap = function(lhs, rhs)
    vim.api.nvim_set_keymap('v', lhs, rhs, { noremap = true, silent = true })
end
local xmap = function(lhs, rhs)
    vim.api.nvim_set_keymap('x', lhs, rhs, { noremap = true, silent = true })
end

nmap("<Leader>w", ":write<CR>")
nmap("<Leader>e", ":Explore<CR>")
nmap("<Leader>r", ":% so<CR>")
nmap("<Leader>q", ":qa!<CR>")
nmap("<Leader>c", ":bd<CR>")
nmap("<Leader>h", ":nohlsearch<CR>")
