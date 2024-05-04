-- INFO: This file defines configuration for UI-related plugins in Neovim.
--       It manages plugins that enhance the user interface experience,
--       such as themes, fonts, statusline, and other visual elements.

-- INFO: --[[
-- Plugin           | Description                                                      |
--------------------|------------------------------------------------------------------|
--                  |                                                                  |
--                  |                                                                  |
--                  |                                                                  |
--_____________________________________________________________________________________|

local function colorscheme()
	local opt = {
		terminal_colors = true, -- add neovim terminal colors
		undercurl = true,
		underline = true,
		bold = true,
		italic = {
			strings = true,
			emphasis = true,
			comments = true,
			operators = false,
			folds = true,
		},
		strikethrough = true,
		invert_selection = false,
		invert_signs = false,
		invert_tabline = false,
		invert_intend_guides = false,
		inverse = true, -- invert background for search, diffs, statuslines and errors
		contrast = "hard", -- can be "hard", "soft" or empty string
		palette_overrides = {},
		overrides = {},
		dim_inactive = false,
		transparent_mode = false,
	}
	return {
		{
			"folke/tokyonight.nvim",
		},
		{
			"ellisonleao/gruvbox.nvim",
			config = function()
				require("gruvbox").setup(opt)
				vim.cmd("set background=dark")
				vim.cmd("colorscheme gruvbox")
			end,
		},
		{
			"oxfist/night-owl.nvim",
		},
	}
end

local function lualine()
	return {}
end

return {
	colorscheme(),
	lualine(),
}
