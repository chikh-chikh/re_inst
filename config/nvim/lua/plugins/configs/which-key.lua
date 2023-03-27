local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

local setup = {

  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "  ", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },

  popup_mappings = {
    scroll_down = "<c-d>", -- binding to scroll down inside the popup
    scroll_up = "<c-u>", -- binding to scroll up inside the popup
  },

  window = {
    border = "none", -- none/single/double/shadow
  },

  layout = {
    spacing = 6, -- spacing between columns
  },

  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " },

  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    i = { "j", "k" },
    v = { "j", "k" },
  },

}


local opts = {
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

-- hjknoyz

-- GENERAL MAPPINGS

local mappings = {

  -- ["r"] = { ""                                  , "reorder list" },
  -- [""] = { "<cmd>lua require('autolist').force_recalculate()<CR>" , "reorder list" },
  -- [""] = { "<cmd>lua require('autolist').invert_entry()<CR>"  , "checkmark" },
  -- ["q"] = { "<cmd>wqa!<CR>"                     , "quit" },
  -- ["w"] = { "<cmd>wa!<CR>"                      , "write" },
  ["e"] = { "<cmd>NvimTreeToggle<CR>"           , "explorer" },
  ["u"] = { "<cmd>UndotreeToggle<CR>"           , "undo" },
  ["d"] = { "<cmd>bdelete!<CR>"                 , "delete buffer" },
  ["x"] = { ""                                  , "checkmark" },

  l = {
    name = "LaTeX",
      b = { "<cmd>VimtexCompile<CR>"            , "build" },
      c = { "<cmd>VimtexCountWords!<CR>"        , "count" },
      i = { "<cmd>VimtexTocOpen<CR>"            , "index" },
      v = { "<cmd>VimtexView<CR>"               , "view" },
  },
  a = {
    name = "ACTIONS",
    a = { "<cmd>lua PdfAnnots()<CR>", "annotate"},
    b = { "<cmd>terminal bibexport -o %:p:r.bib %:p:r.aux<CR>", "bib export"},
    c = { "<cmd>VimtexClean<CR>"            , "clean aux" },
    g = { "<cmd>e ~/.config/nvim/templates/Glossary.tex<CR>", "edit glossary"},
    h = { "<cmd>lua _HTOP_TOGGLE()<CR>", "htop" },
    i = { "<cmd>IlluminateToggle<CR>"            , "illuminate" },
    k = {
      "<cmd>lua require('cmp').setup.buffer { enabled = false }<CR>",
      "kill LSP",
    },
    l = {
      "<cmd>lua require('cmp').setup.buffer { enabled = true }<CR>",
      "load LSP",
    },
    -- l = { '<cmd>lua toggle_cmp()<CR>', "LSP"},
    p = { '<cmd>lua require("nabla").popup()<CR>', "preview symbols"},
    r = { "<cmd>VimtexErrors<CR>"           , "report errors" },
    s = { "<cmd>e ~/.config/nvim/snippets/tex.snippets<CR>", "edit snippets"},
    v = { "<plug>(vimtex-context-menu)"            , "vimtex menu" },
  },
  f = {
    name = "FIND",
      b = {
        "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<CR>",
        "buffers",
      },
      c = { "<cmd>Telescope bibtex<CR>"       , "citations" },
      f = { "<cmd>Telescope live_grep theme=ivy<CR>", "project" },
      g = { "<cmd>Telescope git_branches<CR>", "branches" },
      h = { "<cmd>Telescope help_tags<CR>", "help" },
      k = { "<cmd>Telescope keymaps<CR>", "keymaps" },
      m = { "<cmd>Telescope man_pages<CR>", "man pages" },
      r = { "<cmd>Telescope registers<CR>", "registers" },
      t = { "<cmd>Telescope colorscheme<CR>", "theme" },
      y = { "<cmd>YankyRingHistory<CR>"       , "yanks" },
      -- c = { "<cmd>Telescope commands<CR>", "commands" },
      -- r = { "<cmd>Telescope oldfiles<CR>", "recent" },
  },
  g = {
    name = "GIT",
    g = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "lazygit" },
    j = { "<cmd>lua require 'gitsigns'.next_hunk()<CR>", "next hunk" },
    k = { "<cmd>lua require 'gitsigns'.prev_hunk()<CR>", "prev hunk" },
    l = { "<cmd>lua require 'gitsigns'.blame_line()<CR>", "blame" },
    p = { "<cmd>lua require 'gitsigns'.preview_hunk()<CR>", "preview hunk" },
    r = { "<cmd>lua require 'gitsigns'.reset_hunk()<CR>", "reset hunk" },
    s = { "<cmd>lua require 'gitsigns'.stage_hunk()<CR>", "stage hunk" },
    u = {
      "<cmd>lua require 'gitsigns'.undo_stage_hunk()<CR>", "unstage hunk" },
    o = { "<cmd>Telescope git_status<CR>", "open changed file" },
    b = { "<cmd>Telescope git_branches<CR>", "checkout branch" },
    c = { "<cmd>Telescope git_commits<CR>", "checkout commit" },
    d = { "<cmd>Gitsigns diffthis HEAD<CR>", "diff" },
  },
  m = {
    name = "MANAGE SESSIONS",
    s = { "<cmd>SessionManager save_current_session<CR>", "save" },
    d = { "<cmd>SessionManager delete_session<CR>", "delete" },
    l = { "<cmd>SessionManager load_session<CR>", "load" },
  },
  p = {
    name = "PANDOC",
    w = { "<cmd>TermExec cmd='pandoc %:p -o %:p:r.docx'<CR>" , "word"},
    m = { "<cmd>TermExec cmd='pandoc %:p -o %:p:r.md'<CR>"   , "markdown"},
    h = { "<cmd>TermExec cmd='pandoc %:p -o %:p:r.html'<CR>" , "html"},
    l = { "<cmd>TermExec cmd='pandoc %:p -o %:p:r.tex'<CR>"  , "latex"},
    p = { "<cmd>TermExec cmd='pandoc %:p -o %:p:r.pdf'<CR>"  , "pdf"},
    -- x = { "<cmd>echo "run: unoconv -f pdf path-to.docx""  , "word to pdf"},
  },
  s = {
    name = "SURROUND",
    s = { "<Plug>(nvim-surround-normal)", "surround" },
    d = { "<Plug>(nvim-surround-delete)", "delete" },
    c = { "<Plug>(nvim-surround-change)", "change" },
  },
  t = {
    name = "TEMPLATES",
    c = { "<cmd>PackerCompile<CR>", "Compile" },
    p = {
      "<cmd>read ~/.config/nvim/templates/PhilPaper.tex<CR>",
      "PhilPaper.tex",
    },
    l = {
      "<cmd>read ~/.config/nvim/templates/Letter.tex<CR>",
      "Letter.tex",
    },
    g = {
      "<cmd>read ~/.config/nvim/templates/Glossary.tex<CR>",
      "Glossary.tex",
    },
    h = {
      "<cmd>read ~/.config/nvim/templates/HandOut.tex<CR>",
      "HandOut.tex",
    },
    b = {
      "<cmd>read ~/.config/nvim/templates/PhilBeamer.tex<CR>",
      "PhilBeamer.tex",
    },
    s = {
      "<cmd>read ~/.config/nvim/templates/SubFile.tex<CR>",
      "SubFile.tex",
    },
    r = {
      "<cmd>read ~/.config/nvim/templates/Root.tex<CR>",
      "Root.tex",
    },
    m = {
      "<cmd>read ~/.config/nvim/templates/MultipleAnswer.tex<CR>",
      "MultipleAnswer.tex",
    },
  },
}


local register = {
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
  }
}

which_key.setup(setup)
-- which_key.register(mappings, opts)
which_key.register(register)
