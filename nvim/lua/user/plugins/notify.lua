return {
    "rcarriga/nvim-notify",
    config = function()
        require("notify").setup({
			timeout = 1000,
            background_colour = "#000000",
			render = "wrapped-compact",
			stages = "static",
        })
    end,
}
