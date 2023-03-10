return {
	settings = {
    R = {
        -- "command": "/usr/bin/R",
        -- "args" : [ "--slave", "-e", "languageserver::run()"],
        -- "filetypes" : ["r"]

			workspace = {
				library = {
          -- [vim.fn.expand("$R_HOME")] = true,
					-- [vim.fn.expand("$VIMRUNTIME/mason/packages")] = true,
				},
			},
    },
	},
}
