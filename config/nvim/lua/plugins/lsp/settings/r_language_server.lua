return {
	settings = {
    R = {
      cmd = {
        "R",
        "--slave",
        "-e",
        [[
          .libPaths(new = "~/.local/share/nvim/mason/packages/r-languageserver/languageserver");
          langserver <- languageserver:::LanguageServer$new("localhost", NULL);
          .libPaths(new = Sys.getenv("R_LIBS_USER"));
          langserver$run()
        ]]
      },
      filetypes = { "r", "rmd" },
      -- log_level = 2,
      -- root_dir = root_pattern(".git") or os_homedir,


			-- workspace = {
			-- 	library = {
			--           -- [vim.fn.expand("$R_HOME")] = true,
			-- 		-- [vim.fn.expand("$VIMRUNTIME/mason/packages")] = true,
			-- 	},
			-- },
    },
	},
}
