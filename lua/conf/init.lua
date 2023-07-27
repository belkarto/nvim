require("conf.remap")
require("conf.set")


vim.cmd('colorscheme night-owl')

require("nvim-tree").setup()
require("mason").setup{
	providers = {
		"mason.providers.client",
		"mason.providers.registry-api",
	}
}
