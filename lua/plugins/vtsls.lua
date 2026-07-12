return {
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				ts_ls = {
					init_options = {
						preferences = {
							importModuleSpecifierPreference = "non-relative",
						},
					},
				},
			},
		},
	},
}
