require("brahim.remap")
require("brahim.set")
-- set colorscheme after options
vim.cmd('colorscheme nightfly')

require("nvim-tree").setup()
require("mason").setup{
	providers = {
		"mason.providers.client",
		"mason.providers.registry-api",
	}
}
