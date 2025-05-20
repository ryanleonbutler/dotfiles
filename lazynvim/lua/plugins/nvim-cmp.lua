return {
    -- {
    --     "hrsh7th/nvim-cmp",
    --     lazy = false,
    --     dependencies = {
    --         "L3MON4D3/LuaSnip",
    --         "saadparwaiz1/cmp_luasnip",
    --         "hrsh7th/cmp-path",
    --         "hrsh7th/cmp-emoji",
    --         "rafamadriz/friendly-snippets",
    --     },
    --     config = function()
    --         local cmp = require("cmp")
    --         local luasnip = require("luasnip")
    --
    --         luasnip.config.setup({})
    --
    --         cmp.setup({
    --             snippet = {
    --                 expand = function(args)
    --                     luasnip.lsp_expand(args.body)
    --                 end,
    --             },
    --             performance = {
    --                 fetching_timeout = 1500,
    --             },
    --             completion = { completeopt = "menu,menuone,noinsert" },
    --             sources = {
    --                 {
    --                     name = "buffer",
    --                     keyword_length = 3,
    --                     option = {
    --                         get_bufnrs = function()
    --                             return vim.api.nvim_list_bufs()
    --                         end,
    --                     },
    --                 },
    --                 { name = "luasnip", keyword_length = 3 },
    --                 { name = "nvim_lua" },
    --                 { name = "nvim_lsp" },
    --                 {
    --                     name = "cmdline",
    --                     option = {
    --                         ignore_cmds = { "Man", "!" },
    --                     },
    --                 },
    --                 { name = "path" },
    --                 { name = "emoji" },
    --                 { name = "amazonq", priority = 100, group_index = 1 },
    --             },
    --             mapping = cmp.mapping.preset.insert({
    --                 ["<C-c>"] = cmp.mapping.complete(),
    --                 ["<C-p>"] = cmp.mapping.complete({}),
    --                 ["<TAB>"] = cmp.mapping.select_next_item(),
    --                 ["<S-tab>"] = cmp.mapping.select_prev_item(),
    --                 ["<CR>"] = cmp.mapping.confirm({ select = true }),
    --             }),
    --         })
    --     end,
    -- },
    {
        "hrsh7th/nvim-cmp",
        version = false, -- last release is way too old
        event = "InsertEnter",
        dependencies = {
            "L3MON4D3/LuaSnip",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-emoji",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-path",
            "rafamadriz/friendly-snippets",
            "saadparwaiz1/cmp_luasnip",
        },
        -- Not all LSP servers add brackets when completing a function.
        -- To better deal with this, LazyVim adds a custom option to cmp,
        -- that you can configure. For example:
        --
        -- ```lua
        -- opts = {
        --   auto_brackets = { "python" }
        -- }
        -- ```
        opts = function()
            vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
            local cmp = require("cmp")
            local defaults = require("cmp.config.default")()
            local auto_select = true
            return {
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },
                auto_brackets = {}, -- configure any filetype to auto add brackets
                completion = {
                    completeopt = "menu,menuone,noinsert" .. (auto_select and "" or ",noselect"),
                },
                preselect = auto_select and cmp.PreselectMode.Item or cmp.PreselectMode.None,
                mapping = cmp.mapping.preset.insert({
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<TAB>"] = cmp.mapping.select_next_item({
                        behavior = cmp.SelectBehavior.Insert,
                    }),
                    ["<S-Tab>"] = cmp.mapping.select_prev_item({
                        behavior = cmp.SelectBehavior.Insert,
                    }),
                    ["<C-p>"] = cmp.mapping.complete(),
                    ["<CR>"] = LazyVim.cmp.confirm({ select = true }),
                    ["<S-CR>"] = LazyVim.cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                    ["<C-c>"] = function(fallback)
                        cmp.abort()
                        fallback()
                    end,
                    ["<C-TAB>"] = function(fallback)
                        return LazyVim.cmp.map({ "snippet_forward", "ai_accept" }, fallback)()
                    end,
                }),
                sources = cmp.config.sources({
                    { name = "amazonq", priority = 1000, group_index = 1, keyword_length = 5 },
                    { name = "luasnip", keyword_length = 2 },
                    { name = "nvim_lsp" },
                    { name = "lazydev" },
                    { name = "path" },
                    {
                        name = "buffer",
                        keyword_length = 3,
                        option = {
                            get_bufnrs = function()
                                return vim.api.nvim_list_bufs()
                            end,
                        },
                    },
                    { name = "emoji" },
                }),
                keys = {
                    {
                        "<tab>",
                        function()
                            require("luasnip").jump(1)
                        end,
                        mode = "s",
                    },
                    {
                        "<s-tab>",
                        function()
                            require("luasnip").jump(-1)
                        end,
                        mode = { "i", "s" },
                    },
                },
                formatting = {
                    format = function(entry, item)
                        local icons = LazyVim.config.icons.kinds
                        if icons[item.kind] then
                            item.kind = icons[item.kind] .. item.kind
                        end

                        local widths = {
                            abbr = vim.g.cmp_widths and vim.g.cmp_widths.abbr or 40,
                            menu = vim.g.cmp_widths and vim.g.cmp_widths.menu or 30,
                        }

                        for key, width in pairs(widths) do
                            if item[key] and vim.fn.strdisplaywidth(item[key]) > width then
                                item[key] = vim.fn.strcharpart(item[key], 0, width - 1) .. "…"
                            end
                        end

                        return item
                    end,
                },
                experimental = {
                    -- only show ghost text when we show ai completions
                    ghost_text = vim.g.ai_cmp and {
                        hl_group = "CmpGhostText",
                    } or false,
                },
                sorting = defaults.sorting,
            }
        end,
        main = "lazyvim.util.cmp",
    },
}
