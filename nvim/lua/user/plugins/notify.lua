return {
    "rcarriga/nvim-notify",
    config = function()
        require("notify").setup({
			timeout = 1500,
            background_colour = "#000000",
			render = "wrapped-compact",
			stages = "static",
        })
    end,
}
