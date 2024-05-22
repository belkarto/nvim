-- INFO: This file defines configuration for UI-related plugins in Neovim.
--       It manages plugins that enhance the user interface experience,
--       such as themes, fonts, statusline, and other visual elements.

-- INFO:
-- Plugin           | Description                                                      |
--------------------|------------------------------------------------------------------|
-- gruvbox          | colorscheme                                                      |
-- tokyonight       | colorscheme                                                      |
-- night-owl        | colorscheme                                                      |
-- lualine          | fast and easy to configure Neovim statusline written in Lua      |
-- autopair         | powerful autopair plugin that supports multiple characters       |
-- barbar           | tabline plugin with re-orderable, auto-sizing, clickable tabs,...|
-- comment          | Smart and Powerful commenting plugin for neovim                  |
-- dressing         | improve the default vim.ui interfaces                            |
-- indent-blankline | adds indentation guides                                          |
-- mini.indentscope | ustomizable debounce delay, animation style                      |
-- nvim-tree        | A File Explorer For Neovim Written In Lua                        |
-- telescope        | Find, Filter, Preview, Pick. All lua, all the time.              |
-- web_devicons     | Adds file type icons                                             |
-- nvim-ufo         | make Neovim's fold look modern and keep high performance.        |
-- todo-comments    | Highlight, list and search todo comments in your projects        |
-- toggleterm       | lua plugin to help easily manage multiple terminal windows       |
-- treesitter       | Nvim Treesitter configurations and abstraction layer             |
-- notify           | A fancy, configurable, notification manager for NeoVim           |
-- noice_nvim       | replaces the UI for messages, cmdline and the popupmenu.         |
-- illuminate       | plugin for automatically highlighting other uses of the word     |
--                  | under the cursor                                                 |
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
	return {
		"nvim-lualine/lualine.nvim",
		config = function()
			require("lualine").setup({
				options = {
					icons_enabled = true,
					theme = "auto",
					component_separators = { left = "", right = "" },
					section_separators = { left = "", right = "" },
					disabled_filetypes = {
						statusline = {},
						winbar = {},
					},
					ignore_focus = {},
					always_divide_middle = true,
					globalstatus = false,
					refresh = {
						statusline = 1000,
						tabline = 1000,
						winbar = 1000,
					},
				},
				sections = {
					lualine_a = { "mode" },
					lualine_b = { "branch", "diff", "diagnostics" },
					lualine_c = { "filename" },
					lualine_x = { { "filesize" }, { "fileformat" }, { "filetype" } },
					lualine_y = { "progress" },
					lualine_z = { "selectioncount", "location" },
				},
				inactive_sections = {
					lualine_a = {},
					lualine_b = {},
					lualine_c = { "filename" },
					lualine_x = { "location" },
					lualine_y = { "filesize" },
					lualine_z = {},
				},
				winbar = {},
				inactive_winbar = {},
				extensions = {},
			})
		end,
	}
end

local function autopair()
	return {
		"windwp/nvim-autopairs",
		event = { "InsertEnter" },
		config = function()
			-- import nvim-autopairs
			local autopairs = require("nvim-autopairs")

			-- configure autopairs
			autopairs.setup({
				check_ts = true, -- enable treesitter
				ts_config = {
					lua = { "string" }, -- don't add pairs in lua string treesitter nodes
					javascript = { "template_string" }, -- don't add pairs in javscript template_string treesitter nodes
					java = false, -- don't check treesitter on java
				},
			})

			-- import nvim-autopairs completion functionality
			local cmp_autopairs = require("nvim-autopairs.completion.cmp")

			-- import nvim-cmp plugin (completions plugin)
			local cmp = require("cmp")

			-- make autopairs and completion work together
			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
		end,
	}
end

local function bufferline()
	return {
		"romgrk/barbar.nvim",
		config = function()
			vim.g.barbar_auto_setup = false

			require("barbar").setup({
				-- WARN: do not copy everything below into your config!
				--       It is just an example of what configuration options there are.
				--       The defaults are suitable for most people.

				-- Enable/disable animations
				animation = true,

				-- Automatically hide the tabline when there are this many buffers left.
				-- Set to any value >=0 to enable.
				auto_hide = false,

				-- Enable/disable current/total tabpages indicator (top right corner)
				tabpages = true,

				-- Enables/disable clickable tabs
				--  - left-click: go to buffer
				--  - middle-click: delete buffer
				clickable = true,

				-- Excludes buffers from the tabline
				-- exclude_ft = {'javascript'},
				-- exclude_name = {'package.json'},

				-- A buffer to this direction will be focused (if it exists) when closing the current buffer.
				-- Valid options are 'left' (the default), 'previous', and 'right'
				focus_on_close = "left",

				-- Hide inactive buffers and file extensions. Other options are `alternate`, `current`, and `visible`.
				hide = { extensions = true, inactive = false },

				-- Disable highlighting alternate buffers
				highlight_alternate = false,

				-- Disable highlighting file icons in inactive buffers
				highlight_inactive_file_icons = false,

				-- Enable highlighting visible buffers
				highlight_visible = true,

				icons = {
					-- Configure the base icons on the bufferline.
					-- Valid options to display the buffer index and -number are `true`, 'superscript' and 'subscript'
					buffer_index = false,
					buffer_number = false,
					button = "",
					-- Enables / disables diagnostic symbols
					diagnostics = {
						[vim.diagnostic.severity.ERROR] = { enabled = true, icon = "" },
						[vim.diagnostic.severity.WARN] = { enabled = false, icon = "" },
						[vim.diagnostic.severity.INFO] = { enabled = false, icon = "" },
						[vim.diagnostic.severity.HINT] = { enabled = true },
						icon = "",
					},
					gitsigns = {
						added = { enabled = false, icon = "+" },
						changed = { enabled = false, icon = "~" },
						deleted = { enabled = false, icon = "-" },
					},
					filetype = {
						-- Sets the icon's highlight group.
						-- If false, will use nvim-web-devicons colors
						custom_colors = false,

						-- Requires `nvim-web-devicons` if `true`
						enabled = true,
					},
					separator = { left = "▎", right = "" },

					-- If true, add an additional separator at the end of the buffer list
					separator_at_end = true,

					-- Configure the icons on the bufferline when modified or pinned.
					-- Supports all the base icon options.
					modified = { button = "●" },
					pinned = { button = "", filename = true },

					-- Use a preconfigured buffer appearance— can be 'default', 'powerline', or 'slanted'
					preset = "default",

					-- Configure the icons on the bufferline based on the visibility of a buffer.
					-- Supports all the base icon options, plus `modified` and `pinned`.
					alternate = { filetype = { enabled = false } },
					current = { buffer_index = true },
					inactive = { button = "×" },
					visible = { modified = { buffer_number = false } },
				},

				-- If true, new buffers will be inserted at the start/end of the list.
				-- Default is to insert after current buffer.
				insert_at_end = true,
				insert_at_start = false,

				-- Sets the maximum padding width with which to surround each tab
				maximum_padding = 1,

				-- Sets the minimum padding width with which to surround each tab
				minimum_padding = 1,

				-- Sets the maximum buffer name length.
				maximum_length = 30,

				-- Sets the minimum buffer name length.
				minimum_length = 0,

				-- If set, the letters for each buffer in buffer-pick mode will be
				-- assigned based on their name. Otherwise or in case all letters are
				-- already assigned, the behavior is to assign letters in order of
				-- usability (see order below)
				semantic_letters = true,

				-- Set the filetypes which barbar will offset itself for
				sidebar_filetypes = {
					-- Use the default values: {event = 'BufWinLeave', text = nil}
					NvimTree = true,
					-- Or, specify the text used for the offset:
					undotree = { text = "undotree" },
					-- Or, specify the event which the sidebar executes when leaving:
					["neo-tree"] = { event = "BufWipeout" },
					-- Or, specify both
					Outline = { event = "BufWinLeave", text = "symbols-outline" },
				},

				-- New buffer letters are assigned in this order. This order is
				-- optimal for the qwerty keyboard layout but might need adjustment
				-- for other layouts.
				letters = "asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP",

				-- Sets the name of unnamed buffers. By default format is "[Buffer X]"
				-- where X is the buffer number. But only a static string is accepted here.
				no_name_title = nil,
			})

			local keymap = vim.keymap.set
			local opts = { noremap = true, silent = true, desc = "move to next buffer" }
			-- Move to previous/next
			keymap("n", "<A-,>", "<Cmd>:BufferPrevious<CR>", opts)
			keymap("n", "<A-.>", "<Cmd>BufferNext<CR>", opts)
			-- Goto buffer in position...
			keymap("n", "<A-1>", "<Cmd>BufferGoto 1<CR>", opts)
			keymap("n", "<A-2>", "<Cmd>BufferGoto 2<CR>", opts)
			keymap("n", "<A-3>", "<Cmd>BufferGoto 3<CR>", opts)
			keymap("n", "<A-4>", "<Cmd>BufferGoto 4<CR>", opts)
			keymap("n", "<A-5>", "<Cmd>BufferGoto 5<CR>", opts)
			keymap("n", "<A-6>", "<Cmd>BufferGoto 6<CR>", opts)
			keymap("n", "<A-7>", "<Cmd>BufferGoto 7<CR>", opts)
			keymap("n", "<A-8>", "<Cmd>BufferGoto 8<CR>", opts)
			keymap("n", "<A-9>", "<Cmd>BufferGoto 9<CR>", opts)
			keymap("n", "<A-0>", "<Cmd>BufferLast<CR>", opts)
			-- Pin/unpin buffer
			keymap("n", "<A-p>", "<Cmd>BufferPin<CR>", opts)
			-- Close buffer
			keymap("n", "<A-c>", "<Cmd>BufferClose<CR>", opts)
		end,
	}
end

local function comment()
	return {
		"numToStr/Comment.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			-- import comment plugin safely
			local comment = require("Comment")

			local ts_context_commentstring = require("ts_context_commentstring.integrations.comment_nvim")

			-- enable comment
			comment.setup({
				-- for commenting tsx, jsx, svelte, html files
				pre_hook = ts_context_commentstring.create_pre_hook(),
			})
		end,
	}
end

local function dressing()
	return {
		"stevearc/dressing.nvim",
		event = "VeryLazy",
		config = function()
			require("dressing").setup({
				input = {
					-- Set to false to disable the vim.ui.input implementation
					enabled = true,

					-- Default prompt string
					default_prompt = "Input",

					-- Trim trailing `:` from prompt
					trim_prompt = true,

					-- Can be 'left', 'right', or 'center'
					title_pos = "left",

					-- When true, <Esc> will close the modal
					insert_only = true,

					-- When true, input will start in insert mode.
					start_in_insert = true,

					-- These are passed to nvim_open_win
					border = "rounded",
					-- 'editor' and 'win' will default to being centered
					relative = "cursor",

					-- These can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
					prefer_width = 40,
					width = nil,
					-- min_width and max_width can be a list of mixed types.
					-- min_width = {20, 0.2} means "the greater of 20 columns or 20% of total"
					max_width = { 140, 0.9 },
					min_width = { 20, 0.2 },

					buf_options = {},
					win_options = {
						-- Disable line wrapping
						wrap = false,
						-- Indicator for when text exceeds window
						list = true,
						listchars = "precedes:…,extends:…",
						-- Increase this for more context when text scrolls off the window
						sidescrolloff = 0,
					},

					-- Set to `false` to disable
					mappings = {
						n = {
							["<Esc>"] = "Close",
							["<CR>"] = "Confirm",
						},
						i = {
							["<C-c>"] = "Close",
							["<CR>"] = "Confirm",
							["<Up>"] = "HistoryPrev",
							["<Down>"] = "HistoryNext",
						},
					},

					override = function(conf)
						-- This is the config that will be passed to nvim_open_win.
						-- Change values here to customize the layout
						return conf
					end,

					-- see :help dressing_get_config
					get_config = nil,
				},
				select = {
					-- Set to false to disable the vim.ui.select implementation
					enabled = true,

					-- Priority list of preferred vim.select implementations
					backend = { "telescope", "fzf_lua", "fzf", "builtin", "nui" },

					-- Trim trailing `:` from prompt
					trim_prompt = true,

					-- Options for telescope selector
					-- These are passed into the telescope picker directly. Can be used like:
					-- telescope = require('telescope.themes').get_ivy({...})
					telescope = nil,

					-- Options for fzf selector
					fzf = {
						window = {
							width = 0.5,
							height = 0.4,
						},
					},

					-- Options for fzf-lua
					fzf_lua = {
						-- winopts = {
						--   height = 0.5,
						--   width = 0.5,
						-- },
					},

					-- Options for nui Menu
					nui = {
						position = "50%",
						size = nil,
						relative = "editor",
						border = {
							style = "rounded",
						},
						buf_options = {
							swapfile = false,
							filetype = "DressingSelect",
						},
						win_options = {
							winblend = 0,
						},
						max_width = 80,
						max_height = 40,
						min_width = 40,
						min_height = 10,
					},

					-- Options for built-in selector
					builtin = {
						-- Display numbers for options and set up keymaps
						show_numbers = true,
						-- These are passed to nvim_open_win
						border = "rounded",
						-- 'editor' and 'win' will default to being centered
						relative = "editor",

						buf_options = {},
						win_options = {
							cursorline = true,
							cursorlineopt = "both",
						},

						-- These can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
						-- the min_ and max_ options can be a list of mixed types.
						-- max_width = {140, 0.8} means "the lesser of 140 columns or 80% of total"
						width = nil,
						max_width = { 140, 0.8 },
						min_width = { 40, 0.2 },
						height = nil,
						max_height = 0.9,
						min_height = { 10, 0.2 },

						-- Set to `false` to disable
						mappings = {
							["<Esc>"] = "Close",
							["<C-c>"] = "Close",
							["<CR>"] = "Confirm",
						},

						override = function(conf)
							-- This is the config that will be passed to nvim_open_win.
							-- Change values here to customize the layout
							return conf
						end,
					},

					-- Used to override format_item. See :help dressing-format
					format_item_override = {},

					-- see :help dressing_get_config
					get_config = nil,
				},
			})
		end,
	}
end

local function indentation()
	return {
		-- indent guides for Neovim
		{
			"lukas-reineke/indent-blankline.nvim",
			event = { "BufReadPre", "BufNewFile" },
			main = "ibl",
			opts = {
				indent = {
					char = "│",
					tab_char = "│",
				},
				scope = { enabled = false },
				exclude = {
					filetypes = {
						"help",
						"alpha",
						"dashboard",
						"neo-tree",
						"Trouble",
						"trouble",
						"lazy",
						"mason",
						"notify",
						"toggleterm",
						"lazyterm",
					},
				},
			},
		},

		-- Active indent guide and indent text objects. When you're browsing
		-- code, this highlights the current level of indentation, and animates
		-- the highlighting.
		{
			"echasnovski/mini.indentscope",
			version = false, -- wait till new 0.7.0 release to put it back on semver
			opts = {
				-- symbol = "▏",
				symbol = "│",
				options = { try_as_border = true },
			},
			init = function()
				vim.api.nvim_create_autocmd("FileType", {
					pattern = {
						"help",
						"alpha",
						"dashboard",
						"neo-tree",
						"Trouble",
						"trouble",
						"lazy",
						"mason",
						"notify",
						"toggleterm",
						"lazyterm",
					},
					callback = function()
						vim.b.miniindentscope_disable = true
					end,
				})
			end,
		},
	}
end

local function nvimTree()
	return {
		"nvim-tree/nvim-tree.lua",
		config = function()
			local nvimtree = require("nvim-tree")

			-- recommended settings from nvim-tree documentation
			vim.g.loaded_netrw = 1
			vim.g.loaded_netrwPlugin = 1

			nvimtree.setup({
				view = {
					width = 30,
					relativenumber = true,
				},
				-- change folder arrow icons
				renderer = {
					indent_markers = {
						enable = true,
					},
					icons = {
						glyphs = {
							folder = {
								arrow_closed = "", -- arrow when folder is closed
								arrow_open = "", -- arrow when folder is open
							},
						},
					},
				},
				-- disable window_picker for
				-- explorer to work well with
				-- window splits
				actions = {
					open_file = {
						window_picker = {
							enable = false,
						},
					},
				},
				filters = {
					custom = { ".DS_Store" },
				},
				git = {
					ignore = false,
				},
			})

			-- set keymaps
			local keymap = vim.keymap -- for conciseness

			keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" }) -- toggle file explorer
			keymap.set(
				"n",
				"<leader>ef",
				"<cmd>NvimTreeFindFileToggle<CR>",
				{ desc = "Toggle file explorer on current file" }
			) -- toggle file explorer on current file
			keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" }) -- collapse file explorer
			keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" }) -- refresh file explorer
		end,
	}
end

local function telescope()
	return {
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		config = function()
			local telescope = require("telescope")
			local actions = require("telescope.actions")
			-- telescope.load_extension('media_files')

			telescope.setup({
				defaults = {

					prompt_prefix = " ",
					selection_caret = " ",
					path_display = { "smart" },

					mappings = {
						i = {
							["<C-n>"] = actions.cycle_history_next,
							["<C-p>"] = actions.cycle_history_prev,

							["<C-j>"] = actions.move_selection_next,
							["<C-k>"] = actions.move_selection_previous,

							["<C-c>"] = actions.close,

							["<Down>"] = actions.move_selection_next,
							["<Up>"] = actions.move_selection_previous,

							["<CR>"] = actions.select_default,
							["<C-x>"] = actions.select_horizontal,
							["<C-v>"] = actions.select_vertical,
							["<C-t>"] = actions.select_tab,

							["<C-u>"] = actions.preview_scrolling_up,
							["<C-d>"] = actions.preview_scrolling_down,

							["<PageUp>"] = actions.results_scrolling_up,
							["<PageDown>"] = actions.results_scrolling_down,

							["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
							["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
							["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
							["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
							["<C-l>"] = actions.complete_tag,
							["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
						},

						n = {
							["<esc>"] = actions.close,
							["<CR>"] = actions.select_default,
							["<C-x>"] = actions.select_horizontal,
							["<C-v>"] = actions.select_vertical,
							["<C-t>"] = actions.select_tab,

							["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
							["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
							["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
							["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

							["j"] = actions.move_selection_next,
							["k"] = actions.move_selection_previous,
							["H"] = actions.move_to_top,
							["M"] = actions.move_to_middle,
							["L"] = actions.move_to_bottom,

							["<Down>"] = actions.move_selection_next,
							["<Up>"] = actions.move_selection_previous,
							["gg"] = actions.move_to_top,
							["G"] = actions.move_to_bottom,

							["<C-u>"] = actions.preview_scrolling_up,
							["<C-d>"] = actions.preview_scrolling_down,

							["<PageUp>"] = actions.results_scrolling_up,
							["<PageDown>"] = actions.results_scrolling_down,

							["?"] = actions.which_key,
						},
					},
				},
				extensions = {
					media_files = {
						-- filetypes whitelist
						-- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
						filetypes = { "png", "webp", "jpg", "jpeg", "ttf" },
						find_cmd = "rg", -- find command (defaults to `fd`)
					},
				},
			})
		end,
	}
end

local function web_devicons()
	return {
		"nvim-tree/nvim-web-devicons",
		config = function()
			require("nvim-web-devicons").setup({
				-- your personnal icons can go here (to override)
				-- you can specify color or cterm_color instead of specifying both of them
				-- DevIcon will be appended to `name`
				override = {
					zsh = {
						icon = "",
						color = "#428850",
						cterm_color = "65",
						name = "Zsh",
					},
					[".config"] = {
						icon = "󱂀",
						color = "#f1502f",
						name = "Config",
					},
				},
				-- globally enable different highlight colors per icon (default to true)
				-- if set to false all icons will have the default icon's color
				color_icons = true,
				-- globally enable default icons (default to false)
				-- will get overriden by `get_icons` option
				default = true,
				-- globally enable "strict" selection of icons - icon will be looked up in
				-- different tables, first by filename, and if not found by extension; this
				-- prevents cases when file doesn't have any extension but still gets some icon
				-- because its name happened to match some extension (default to false)
				strict = true,
				-- same as `override` but specifically for overrides by filename
				-- takes effect when `strict` is true
				override_by_filename = {
					[".gitignore"] = {
						icon = "",
						color = "#f1502f",
						name = "Gitignore",
					},
					[".config/"] = {
						icon = "󱂀",
						color = "#f1502f",
						name = "src",
					},
				},
				-- same as `override` but specifically for overrides by extension
				-- takes effect when `strict` is true
				override_by_extension = {
					["log"] = {
						icon = "",
						color = "#81e043",
						name = "Log",
					},
					["js"] = {
						icon = "",
						color = "#cccc00",
						name = "JS",
					},
				},
				-- same as `override` but specifically for operating system
				-- takes effect when `strict` is true
				override_by_operating_system = {
					["apple"] = {
						icon = "",
						color = "#A2AAAD",
						cterm_color = "248",
						name = "Apple",
					},
				},
			})
		end,
	}
end

local function ufo()
	return {
		"kevinhwang91/nvim-ufo",
		config = function()
			vim.o.foldcolumn = "1" -- '0' is not bad
			vim.o.foldlevel = 1 -- Using ufo provider need a large value, feel free to decrease the value
			vim.o.foldlevelstart = 99
			vim.o.foldenable = true

			local status_ok, ufo = pcall(require, "ufo")
			if not status_ok then
				return
			end

			ufo.setup({})
			vim.keymap.set("n", "<leader>z", require("ufo").openAllFolds)
			vim.keymap.set("n", "<leader>m", require("ufo").closeAllFolds)
			vim.keymap.set("n", "L", function()
				local winid = require("ufo").peekFoldedLinesUnderCursor()
				if not winid then
					-- choose one of coc.nvim and nvim lsp
					vim.fn.CocActionAsync("definitionHover") -- coc.nvim
					vim.lsp.buf.hover()
				end
			end)
		end,
	}
end

local function todo_comments()
	return {
		"folke/todo-comments.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local todo_comments = require("todo-comments")

			local keymap = vim.keymap -- for conciseness

			keymap.set("n", "]t", function()
				todo_comments.jump_next()
			end, { desc = "Next todo comment" })

			keymap.set("n", "[t", function()
				todo_comments.jump_prev()
			end, { desc = "Previous todo comment" })

			keymap.set("n", "<leader>t", "<cmd>:TodoTelescope<cr>", { desc = "Previous todo comment" })
			todo_comments.setup()
		end,
	}
end

local function togleterm()
	return {
		"akinsho/toggleterm.nvim",
		config = function()
			require("toggleterm").setup({
				-- size can be a number or function which is passed the current terminal
				size = 10,
				open_mapping = [[<c-\>]],
				hide_numbers = true, -- hide the number column in toggleterm buffers
				shade_filetypes = {},
				autochdir = false, -- when neovim changes it current directory the terminal will change it's own when next it's opened
				shade_terminals = true, -- NOTE: this option takes priority over highlights specified so if you specify Normal highlights you should set this to false
				shading_factor = 1, -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
				start_in_insert = true,
				insert_mappings = true, -- whether or not the open mapping applies in insert mode
				persist_size = true,
				winblend = 0,
				direction = "horizontal", --'float', --'horizontal',
				close_on_exit = true, -- close the terminal window when the process exits
				shell = vim.o.shell, -- change the default shell
				auto_scroll = true, -- automatically scroll to the bottom on terminal output
				-- This field is only relevant if direction is set to 'float'
				float_opts = {
					border = "curved", -- other options supported by win open
					width = 50,
					height = 20,
					winblend = 0,
				},
				winbar = {
					enabled = false,
					name_formatter = function(term) --  term: Terminal
						return term.name
					end,
				},
			})
		end,
	}
end

local function treesitter()
	return {
		{

			"nvim-treesitter/nvim-treesitter",
			event = { "BufReadPre", "BufNewFile" },
			build = ":TSUpdate",
			config = function()
				-- import nvim-treesitter plugin
				local treesitter = require("nvim-treesitter.configs")

				-- configure treesitter
				treesitter.setup({ -- enable syntax highlighting
					highlight = {
						enable = true,
					},
					-- enable indentation
					indent = { enable = true },
					-- enable autotagging (w/ nvim-ts-autotag plugin)
					autotag = {
						enable = true,
					},
					-- ensure these language parsers are installed
					ensure_installed = {
						"json",
						"javascript",
						"typescript",
						"tsx",
						"yaml",
						"html",
						"css",
						"prisma",
						"markdown",
						"markdown_inline",
						"svelte",
						"graphql",
						"bash",
						"lua",
						"vim",
						"dockerfile",
						"gitignore",
						"query",
						"vimdoc",
						"c",
					},
					incremental_selection = {
						enable = true,
						keymaps = {
							init_selection = "<C-space>",
							node_incremental = "<C-space>",
							scope_incremental = false,
							node_decremental = "<bs>",
						},
					},
				})
			end,
		},

		-- Show context of the current function
		{
			"nvim-treesitter/nvim-treesitter-context",
			-- event = "LazyFile",
			enabled = true,
			opts = { mode = "cursor", max_lines = 3 },
		},
	}
end

local function notify()
	return {
		"rcarriga/nvim-notify",
		keys = {
			{
				"<leader>un",
				function()
					require("notify").dismiss({ silent = true, pending = true })
				end,
				desc = "",
			},
		},
		opts = {
			stages = "slide",
			timeout = 2000,
			render = "compact",
			max_height = function()
				return math.floor(vim.o.lines * 0.75)
			end,
			max_width = function()
				return math.floor(vim.o.columns * 0.3)
			end,
			on_open = function(win)
				vim.api.nvim_win_set_config(win, { zindex = 100 })
			end,
		},
		init = function()
			vim.notify = require("notify")
		end,
	}
end

local function noice_nvim()
	-- Highly experimental plugin that completely replaces the UI for messages, cmdline and the popupmenu.
	return {
		"folke/noice.nvim",
		event = "VeryLazy",
		config = function()
			require("noice").setup({
				lsp = {
					-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
					override = {
						["vim.lsp.util.convert_input_to_markdown_lines"] = true,
						["vim.lsp.util.stylize_markdown"] = true,
						["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
					},
				},
				-- you can enable a preset for easier configuration
				presets = {
					bottom_search = true, -- use a classic bottom cmdline for search
					command_palette = true, -- position the cmdline and popupmenu together
					long_message_to_split = true, -- long messages will be sent to a split
					inc_rename = false, -- enables an input dialog for inc-rename.nvim
					lsp_doc_border = false, -- add a border to hover docs and signature help
				},
			})
		end,
	}
end

local function illuminate()
	return {
		"RRethy/vim-illuminate",
		config = function()
			require("illuminate").configure({
				-- providers: provider used to get references in the buffer, ordered by priority
				providers = {
					"treesitter",
					"lsp",
				},
				-- delay: delay in milliseconds
				delay = 100,
				-- filetype_overrides: filetype specific overrides.
				-- The keys are strings to represent the filetype while the values are tables that
				-- supports the same keys passed to .configure except for filetypes_denylist and filetypes_allowlist
				filetype_overrides = {},
				-- filetypes_denylist: filetypes to not illuminate, this overrides filetypes_allowlist
				filetypes_denylist = {
					"dirbuf",
					"dirvish",
					"fugitive",
				},
				-- under_cursor: whether or not to illuminate under the cursor
				under_cursor = true,
				-- large_file_cutoff: number of lines at which to use large_file_config
				-- The `under_cursor` option is disabled when this cutoff is hit
				large_file_cutoff = 100,
				-- large_file_config: config to use for large files (based on large_file_cutoff).
				-- Supports the same keys passed to .configure
				-- If nil, vim-illuminate will be disabled for large files.
				large_file_overrides = nil,
				-- min_count_to_highlight: minimum number of matches required to perform highlighting
				min_count_to_highlight = 2,
				-- case_insensitive_regex: sets regex case sensitivity
				case_insensitive_regex = false,
			})
		end,
	}
end

local function trouble()
	return {
		"folke/trouble.nvim",
		keys = {
			{ "<leader>xx", "<cmd>TroubleToggle<CR>", desc = "Open/close trouble list" },
			{
				"<leader>xw",
				"<cmd>TroubleToggle workspace_diagnostics<CR>",
				desc = "Open trouble workspace diagnostics",
			},
			{ "<leader>xd", "<cmd>TroubleToggle document_diagnostics<CR>", desc = "Open trouble document diagnostics" },
			{ "<leader>xq", "<cmd>TroubleToggle quickfix<CR>", desc = "Open trouble quickfix list" },
			{ "<leader>xl", "<cmd>TroubleToggle loclist<CR>", desc = "Open trouble location list" },
			{ "<leader>xt", "<cmd>TodoTrouble<CR>", desc = "Open todos in trouble" },
		},
	}
end

local function undotree()
	return {
		"mbbill/undotree",
	}
end

return {
	colorscheme(),
	lualine(),
	autopair(),
	bufferline(),
	comment(),
	dressing(),
	indentation(),
	nvimTree(),
	telescope(),
	web_devicons(),
	ufo(),
	todo_comments(),
	togleterm(),
	treesitter(),
	notify(),
	noice_nvim(),
	illuminate(),
	trouble(),
	undotree(),
	{
		"RRethy/vim-hexokinase",
		build = "make hexokinase",
		config = function()
			vim.g.Hexokinase_highlighters = { "background" }
		end,
	},
}
