return {
	{
		-- INFO: for nvim-autopairs
		"hrsh7th/nvim-cmp",
	},
	{
		-- INFO: barbar.nvim, nvim-tree, telescope, trouble.nvim
		"nvim-tree/nvim-web-devicons",
	},
	{
		--INFO: comment.nvim
		"JoosepAlviste/nvim-ts-context-commentstring",
	},
	{
		-- INFO: lazygit.nvim, telescope, todo-comments.nvim
		"nvim-lua/plenary.nvim",
	},
	{
		-- INFO: telescope
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
		},
	},
	{
		-- INFO: nvim-treesitter
		"windwp/nvim-ts-autotag",
	},
	{
		-- INFO: nvim-ufo
		"kevinhwang91/promise-async",
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 500
		end,
		opts = {},
	},
	{
		-- INFO: noice
		"MunifTanjim/nui.nvim",
	},
}
