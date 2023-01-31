require('lualine').setup {
	option = {
		icons_enable = true,
		theme = 'nightfly',
	},
	section = {
		lualine_a = {
			{
				'filename',
				path = 1,
			}
		}
	}
}
