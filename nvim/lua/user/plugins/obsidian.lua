return {
    {
        "epwalsh/obsidian.nvim",
        lazy = true,
        cmd = {
            "ObsidianToday",
            "ObsidianYesterday",
            "ObsidianTomorrow",
            "ObsidianCheck",
            "ObsidianDailies",
        },
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        opts = {

            log_level = vim.log.levels.DEBUG,

            disable_frontmatter = false,

            workspaces = {
                {
                    name = "work",
                    path = "~/workspace/butryan-wiki/src/Butryan-Wiki",
                },
            },

            completion = {
                -- If using nvim-cmp, otherwise set to false
                nvim_cmp = true,
                -- Trigger completion at 2 chars
                min_chars = 2,
                -- Where to put new notes created from completion. Valid options are
                --  * "current_dir" - put new notes in same directory as the current buffer.
                --  * "notes_subdir" - put new notes in the default notes subdirectory.

                -- Whether to add the output of the node_id_func to new notes in autocompletion.
                -- E.g. "[[Foo" completes to "[[foo|Foo]]" assuming "foo" is the ID of the note.
                wiki_link_func = function(opts)
                    if opts.id == nil then
                        return string.format("[[%s]]", opts.label)
                    elseif opts.label ~= opts.id then
                        return string.format("[[%s|%s]]", opts.id, opts.label)
                    else
                        return string.format("[[%s]]", opts.id)
                    end
                end,
            },

            daily_notes = {
                folder = "src/Users/butryan/CHANGELOG",
                date_format = "%Y-%m-%d",
                alias_format = "%a %b %d %Y",
                template = "daily.md",
            },

            templates = {
                subdir = ".templates",
                date_format = "%Y-%m-%d",
                time_format = "%H:%M",
                substitutions = {
                    yesterday = function()
                        return os.date("%Y-%m-%d", os.time() - 86400)
                    end,
                    today = function()
                        return os.date("%Y-%m-%d")
                    end,
                    tomorrow = function()
                        return os.date("%Y-%m-%d", os.time() + 86400)
                    end,

                    day = function()
                        return os.date("%d")
                    end,
                    month = function()
                        return os.date("%m")
                    end,
                    week = function()
                        return os.date("%W")
                    end,
                    weekday = function()
                        return os.date("*t").wday
                    end,
                    weekdayname = function()
                        local daysoftheweek = {
                            "Sunday",
                            "Monday",
                            "Tuesday",
                            "Wednesday",
                            "Thursday",
                            "Friday",
                            "Saturday",
                        }
                        return daysoftheweek[os.date("*t").wday]
                    end,
                    year = function()
                        return os.date("%Y")
                    end,
                },
            },

            mappings = {
                -- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
                ["gf"] = {
                    action = function()
                        return require("obsidian").util.gf_passthrough()
                    end,
                    opts = { noremap = false, expr = true, buffer = true },
                },
                -- Toggle check-boxes.
                ["<leader>ch"] = {
                    action = function()
                        return require("obsidian").util.toggle_checkbox()
                    end,
                    opts = { buffer = true },
                },
            },

            follow_url_func = function(url)
                -- Open the URL in the default web browser.
                vim.fn.jobstart({ "open", url }) -- Mac OS
                -- vim.fn.jobstart({"xdg-open", url})  -- linux
            end,

            -- Optional, set to true if you use the Obsidian Advanced URI plugin.
            -- https://github.com/Vinzent03/obsidian-advanced-uri
            use_advanced_uri = true,

            -- Optional, set to true to force ':ObsidianOpen' to bring the app to the foreground.
            open_app_foreground = false,

            picker = {
                -- Set your preferred picker. Can be one of 'telescope.nvim', 'fzf-lua', or 'mini.pick'.
                name = "telescope.nvim",
                -- Optional, configure key mappings for the picker. These are the defaults.
                -- Not all pickers support all mappings.
                mappings = {
                    -- Create a new note from your query.
                    new = "<C-x>",
                    -- Insert a link to the selected note.
                    insert_link = "<C-l>",
                },
            },

            -- Optional, determines whether to open notes in a horizontal split, a vertical split,
            -- or replacing the current buffer (default)
            -- Accepted values are "current", "hsplit" and "vsplit"
            open_notes_in = "current",
            ui = {
                enable = false,
            },
        },
    },
}
