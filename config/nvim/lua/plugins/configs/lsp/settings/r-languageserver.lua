return {
  settings = {
    R = {
     cmd = {
      'R',
      '--slave',
      '-e',
      [[
      .libPaths(new = "~/.local/share/nvim/mason/.packages/r-languageserver");
      langserver <- languageserver:::LanguageServer$new("localhost", NULL);
      .libPaths(new = Sys.getenv("R_LIBS_USER"));
      langserver$run()
      ]]
     }
    },
  },
}
