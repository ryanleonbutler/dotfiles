return {
	{ "tpope/vim-surround" },
	{ "tpope/vim-repeat" },
	{
		"stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        ["python"] = { "black" },
        ["javascript"] = { "prettier" },
        ["typescript"] = { "prettier" },
      },
    },
  },
}
