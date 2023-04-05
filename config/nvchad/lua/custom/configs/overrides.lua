local M = {}

M.treesitter = {
  ensure_installed = {
    "bash",
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "c",
    "markdown",
    "markdown_inline",
    "r",
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    "pyright",
    "r-languageserver",
    -- web dev stuff
    -- "css-lsp",
    -- "html-lsp",
    -- "typescript-language-server",
    -- "deno",
    -- "prettier"
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

M.whichkey = {
  opts = {
    prefix = {"<leader>", "<Bslash>"},
    nowait = true, -- use `nowait` when creating keymaps
  },
  mappings = {
    ["e"] = { "<cmd>NvimTreeToggle<CR>"  , "explorer" },
    ["u"] = { "<cmd>UndotreeToggle<CR>"  , "undo" },
    ["d"] = { "<cmd>bdelete!<CR>"        , "delete buffer" },
    ["x"] = { ""                         , "checkmark" },
  },
  register = {
    ['<leader>'] = {
      H = {
        name = '+Help',
      },
      L = {
        name = '+LSP',
      },
      V = {
        name = '+Linewise reselection of what you just pasted',
      },
      S = {
        name = '+Gitsigns',
      },
      a = {
        name = '+Alpha',
      },
      b = {
        name = '+Buffer adjustments',
      },
      c = {
        name = '+Copy & Paste & tmux',
      },
      D = {
        name = '+Debug Adapter Protocol',
      },
      d = {
        name = '+DAP)',
      },
      f = {
        name = '+Find & tmux',
      },
      g = {
        name = '+git',
      },
      k = {
        name = '+kill runner',
      },
      l = {
        name = '+VimTex',
      },
      e = {
        name = '+File explorers',
      },
      o = {
        name = '+Options',
      },
      p = {
        name = '+Package manager',
      },
      r = {
        name = '+Runners',
      },
      s = {
        name = '+Split & Sort',
      },
      t = {
        name = '+Terminals',
      },
      w = {
        name = '+Wiki & WhiteSpace',
      },
      u = {
        name = '+Undotree',
      },
      A = {
      name = "ACTIONS",
      },
      M = {
        name = '+MANAGE SESSION'
      },
      P = {
        name = '+PANDOC'
      },
      R = {
        name = '+SURROUND'
      },
      T = {
        name = '+TEMPLATES'
      },
    },
    ['<Bslash>'] = {
      r = {
        name = '+R'
      },
    },
  },
}

return M

