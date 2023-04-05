-- {{{ Global definitions

Customize = require("config.customize")
Functions = require("config.functions")
Keymap = Functions.keymap
Is_Enabled = Functions.is_enabled
{
-- ------------------------------------------------------------------------- }}}
-- {{{ Folding commands.

-- Author: Karl Yngve Lervåg
--    See: https://github.com/lervag/dotnvim

-- Close all fold except the current one.
["zv"] = { "zMzvzz", "" },
-- Close current fold when open. Always open next fold.
["zj"] = { "zcjzOzz", "" },
-- Close current fold when open. Always open previous fold.
["zk"] = { "zckzOzz", "" },

-- ------------------------------------------------------------------------- }}}
-- {{{ L - LSP

-- TODO: Finish implementing LSP keybindings.  Some plugins are not installed.

-- LSP
["<leader>LF"] = { "<cmd>LspToggleAutoFormat<cr>", "" },
["<leader>Li"] = { "<cmd>LspInfo<cr>", "" },

-- LuaSnipUnlinkCurrent
["<leader>Lu"] = { "<cmd>LuaSnipUnlinkCurrent<cr>", "" },

-- SymoblsOutline
["<leader>Lo"] = { "<cmd>SymbolsOutline<cr>", "" },

--Telescope
["<leader>LS"] = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "" },
["<leader>Ls"] = { "<cmd>Telescope lsp_document_symbols<cr>", "" },

-- Trouble
["<leader>LR"] = { "<cmd>TroubleToggle lsp_references<cr>", "" },
["<leader>Ld"] = { "<cmd>TroubleToggle<cr>", "" },

-- vim.diagnostic
["<leader>Lj"] = { "<cmd>lua vim.diagnostic.goto_next({buffer=0})cr>, "" },
["<leader>Lk"] = { "<cmd>lua vim.diagnostic.goto_prev({buffer=0})cr>, "" },

-- vim.lsp
["<leader>Ll"] = { "<cmd>lua vim.lsp.codelens.run()<cr>", "" },
["<leader>Lq"] = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "" },

-- vim.lsp.buf
["<leader>La"] = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "" },
["<leader>Lf"] = { "<cmd>lua vim.lsp.buf.format({ async = true })<cr>", "" },
["<leader>Lr"] = { "<cmd>lua vim.lsp.buf.rename()<cr>", "" },

-- ------------------------------------------------------------------------- }}}
-- {{{ V - 

-- ------------------------------------------------------------------------- }}}
-- {{{ S - Gitsigns

if Is_Enabled("gitsigns.nvim") then
  ["<leader>SR"] = { "<cmd>lua require "gitsigns".reset_hunk()<cr>", "" },
  ["<leader>SS"] = { "<cmd>lua require "gitsigns".stage_hunk()<cr>", "" },
  ["<leader>Sd"] = { "<cmd>Gitsigns diffthis HEAD<cr>", "" },
  ["<leader>Sh"] = { "<cmd>lua require "gitsigns".undo_stage_hunk()<cr>", "" },
  ["<leader>Sj"] = { "<cmd>lua require "gitsigns".next_hunk()<cr>", "" },
  ["<leader>Sk"] = { "<cmd>lua require "gitsigns".prev_hunk()<cr>", "" },
  ["<leader>Sp"] = { "<cmd>lua require "gitsigns".preview_hunk()<cr>", "" },
  ["<leader>Sr"] = { "<cmd>lua require "gitsigns".reset_buffer()<cr>", "" },
end

-- ------------------------------------------------------------------------- }}}
-- {{{ a -


-- ------------------------------------------------------------------------- }}}
-- {{{ b 


-- ------------------------------------------------------------------------- }}}
-- {{{ c - Copy & Paste & tmux

["<leader>cc"] = { 'ggVGg_"+y', '' },
["<leader>cv"] = { '"+p', '' },

if Is_Enabled("vim-tmux-runner") then
  ["<leader>cr"] = { "<cmd>VtrClearRunner<cr>", "" },
end

-- ------------------------------------------------------------------------- }}}
-- {{{ D/d - 

-- ------------------------------------------------------------------------- }}}
-- {{{ f - Find &zo tmux

if Is_Enabled("telescope.nvim") then
  ["<leader>fC"] = { "<cmd>Telescope commands<cr>", "" },
  ["<leader>fF"] = { "<cmd>Telescope media_files<cr>", "" },
  ["<leader>fM"] = { "<cmd>Telescope man_pages<cr>", "" },
  ["<leader>fO"] = { "<cmd>Telescope oldfiles<cr>", "" },
  ["<leader>fR"] = { "<cmd>Telescope registers<cr>", "" },
  ["<leader>fS"] = { "<cmd>Telescope colorscheme<cr>", "" },
  ["<leader>fb"] = { "<cmd>Telescope buffers<cr>", "" },
  ["<leader>fd"] = { "<cmd>Telescope diagnostics<cr>", "" },
  ["<leader>ff"] = { "<cmd>Telescope find_files<cr>", "" },
  ["<leader>fg"] = { "<cmd>Telescope live_grep<cr>", "" },
  ["<leader>fh"] = { "<cmd>Telescope help_tags<cr>", "" },
  Keymap(
    "n",
    "<leader>fi",
    "<cmd>lua require('telescope').extensions.media_files.media_files()<cr>"
  )
  ["<leader>fk"] = { "<cmd>Telescope keymaps<cr>", "" },
  ["<leader>fl"] = { "<cmd>Telescope resume<cr>", "" },
  ["<leader>fo"] = { "<cmd>Telescope oldfiles<cr>", "" },
  ["<leader>fw"] = { "<cmd>Telescope grep_string<cr>", "" },
end

if Is_Enabled("todo-comments.nvim") then
  ["<leader>fy"] = { "<cmd>TodoTelescope keywords=Youtube,URL<cr>", "" },
end

if Is_Enabled("vim-tmux-runner") then
  ["<leader>fc"] = { "<cmd>VtrFlushCommand<cr>", "" },
  ["<leader>fr"] = { "<cmd>VtrFocusRunner<cr>", "" },
end

-- TODO: Write the implementations.
Keymap("v"] = { "<leader>f"] = { "<cmd>lua Functions.surround_selected_text()<cr>", "" },
Keymap("v"] = { "<leader>t"] = { "<cmd>lua Functions.hello_world()<cr>", "" },

-- ------------------------------------------------------------------------- }}}
-- {{{ g - git

if Is_Enabled("telescope.nvim") then
  ["<leader>gC"] = { "<cmd>Telescope git_commits<cr>", "" },
  ["<leader>gb"] = { "<cmd>Telescope git_branches<cr>", "" },
  ["<leader>go"] = { "<cmd>Telescope git_status<cr>", "" },
end

if Is_Enabled("vim-fugitive") then
  ["<leader>gP"] = { "<cmd>G pull<cr>", "" },
  ["<leader>gc"] = { "<cmd>G commmit<cr>", "" },
  ["<leader>gd"] = { "<cmd>G diff<cr>", "" },
  ["<leader>gl"] = { "<cmd>G log<cr>", "" },
  ["<leader>gh"] = { "<cmd>vert bo help fugitive<cr>", "" },
  ["<leader>gp"] = { "<cmd>G push<cr>", "" },
  ["<leader>gs"] = { "<cmd>G<cr>", "" },
end

-- ------------------------------------------------------------------------- }}}
-- {{{ k - kill runner

if Is_Enabled("vim-tmux-runner") then
  ["<leader>kr"] = { "<cmd>VtrKillRunner<cr>", "" },
end

-- ------------------------------------------------------------------------- }}}
-- {{{ l - VimTex

if Is_Enabled("vimtex") then
  ["<leader>lC"] = { "<Plug>(vimtex-clean-full)", "" },
  ["<leader>lG"] = { "<Plug>(vimtex-status-all)", "" },
  ["<leader>lI"] = { "<Plug>(vimtex-info-full)", "" },
  ["<leader>lK"] = { "<Plug>(vimtex-stop-all)", "" },
  ["<leader>lL"] = { "<Plug>(vimtex-compile-selected)", "" },
  ["<leader>lT"] = { "<Plug>(vimtex-toc-toggle)", "" },
  ["<leader>lX"] = { "<Plug>(vimtex-reload-state)", "" },
  ["<leader>la"] = { "<Plug>(vimtex-context-menu)", "" },
  ["<leader>lc"] = { "<Plug>(vimtex-clean-full)", "" },
  ["<leader>le"] = { "<Plug>(vimtex-error)", "" },
  ["<leader>lg"] = { "<Plug>(vimtex-status)", "" },
  ["<leader>li"] = { "<Plug>(vimtex-info)", "" },
  ["<leader>lk"] = { "<Plug>(vimtex-stop)", "" },
  ["<leader>ll"] = { "<Plug>(vimtex-compile)", "" },
  ["<leader>lm"] = { "<Plug>(vimtex-impas-list)", "" },
  ["<leader>lo"] = { "<Plug>(vimtex-compile-output)", "" },
  ["<leader>lq"] = { "<Plug>(vimtex-log)", "" },
  ["<leader>ls"] = { "<Plug>(vimtex-toggle-main)", "" },
  ["<leader>lt"] = { "<Plug>(vimtex-toc_open)", "" },
  ["<leader>lv"] = { "<Plug>(vimtex-view)", "" },
  ["<leader>lx"] = { "<Plug>(vimtex-reload)", "" },
end

-- ------------------------------------------------------------------------- }}}
-- {{{ e - File explorers

if Is_Enabled("neo-tree.nvim") or Is_Enabled("nvim-tree") then
  -- nvim_tree takes precedence when both are true.
  if Is_Enabled("nvim-tree") then
    -- ["<c-e>"] = { "<cmd>NvimTreeToggle<cr>", "" },
    ["<leader>e"] = { "<cmd>NvimTreeToggle<cr>", "" },
    ["<leader>ef"] = { "<cmd>NvimTreeFindFile<cr>", "" },
    ["<leader>er"] = { "<cmd>NvimTreeRefresh<cr>", "" },
  else
    -- ["<c-e>"] = { "<cmd>Neotree toggle<cr>", "" },
    ["<leader>e"] = { "<cmd>Neotree toggle<cr>", "" },
    ["<leader>ef"] = { "<cmd>Neotree focus<cr>", "" },
    ["<leader>er"] = { "<cmd>Neotree show<cr>", "" },
  end
end

if Is_Enabled("noice.nvim") then
  ["<leader>eh"] = { "<cmd>NoiceHistory<cr>", "" },
end

-- ------------------------------------------------------------------------- }}}
-- {{{ o - Options

["<leader>oh"] = { "<cmd>checkhealth<cr>", "" },
["<leader>oo"] = { "<cmd>only<cr>", "" },

if Is_Enabled("vim-tmux-runner") then
  ["<leader>or"] = { [[<cmd>VtrOpenRunner {'orientation': 'h', 'percentage': 50}<cr>]], "" },
end

if Is_Enabled("zen-mode.nvim") then
  ["<leader>oz"] = { [[<cmd>lua require("zen-mode").toggle()<cr>]], "" },
end

-- ------------------------------------------------------------------------- }}}
-- {{{ p - Package manager

["<leader>ph"] = { "<cmd>Lazy home<cr>", "" },
["<leader>pl"] = { "<cmd>Lazy log<cr>", "" },
["<leader>pp"] = { "<cmd>Lazy profile<cr>", "" },
["<leader>ps"] = { "<cmd>Lazy sync<cr>", "" },
["<leader>pu"] = { "<cmd>Lazy update<cr>", "" },

-- ------------------------------------------------------------------------- }}}
-- {{{ r - Runners

-- if Is_Enabled("vim-tmux-runner") then
--   ["<leader>ra"] = { "<cmd>VtrReattachRunner<cr>", "" },
--   ["<leader>rr"] = { "<cmd>VtrResizeRunner<cr>", "" },
--   ["<leader>rR"] = { "<cmd>VtrReorientRunner<cr>", "" },
-- end

-- ------------------------------------------------------------------------- }}}
-- {{{ s - Split & Sorts

if Is_Enabled("vim-tmux-runner") then
  ["<leader>sc"] = { "<cmd>VtrSendCommandToRunner<cr>", "" },
  ["<leader>sf"] = { "<cmd>VtrSendFile<cr>", "" },
  ["<leader>sl"] = { "<cmd>VtrSendLinesToRunner<cr>", "" },
  Keymap("v"] = { "<leader>sl"] = { "<cmd>VtrSendLinesToRunner<cr>", "" },
end

["<leader>sh"] = { "<cmd>split<cr>", "" },
["<leader>sv"] = { "<cmd>vsplit<cr>", "" },
["<leader>ss"] = { "0v)k$:sort<cr>", "" },

-- ------------------------------------------------------------------------- }}}
-- {{{ t - Terminals

-- TODO:  Decide whether or not to keep these duplicate commands.
if Is_Enabled("vim-tmux-runner") then
  ["<leader>tC"] = { "<cmd>VtrClearRunner<cr>", "" },
  ["<leader>tF"] = { "<cmd>VtrFocusRunner<cr>", "" },
  ["<leader>tR"] = { "<cmd>VtrReorientRunner<cr>", "" },
  ["<leader>tr"] = { "<cmd>VtrResizeRunner<cr>", "" },
  ["<leader>ta"] = { "<cmd>VtrReattachRunner<cr>", "" },
  ["<leader>tc"] = { "<cmd>VtrFlushCommand<cr>", "" },
  ["<leader>tf"] = { "<cmd>VtrSendFile!<cr>", "" },
  ["<leader>tk"] = { "<cmd>VtrKillRunner<cr>", "" },
  ["<leader>tl"] = { "<cmd>VtrSendLinesToRunner<cr>", "" },
  ["<leader>to"] = { "<cmd>VtrOpenRunner<cr>", "" },
  ["<leader>ts"] = { "<cmd>VtrSendCommandToRunner<cr>", "" },
end

if Is_Enabled("toggleterm.nvim") then
  ["<Bslash><Bslash>"] = { [[<cmd>lua Customize.toggleterm.float()<cr>]], "New terminal" },
  ["<leader>Tf"] = { [[<cmd>lua Customize.toggleterm.float()<cr>]], "" },
  ["<leader>Tl"] = { [[<cmd>lua Customize.toggleterm.lazygit()<cr>]], "" },
  ["<leader>Tm"] = { [[<cmd>lua Customize.toggleterm.neomutt()<cr>]], "" },
  -- ["<leader>r"] = { [[<cmd>lua Customize.toggleterm.ranger()<cr>]], "ranger" },
  ----!!
  ["<leader>r"] = { "<cmd>RnvimrToggle<CR>", "ranger" },
  -- ["<A-r>"] = { "<cmd>RnvimrToggle<CR>", "ranger" },
end

-- ------------------------------------------------------------------------- }}}
-- {{{ w - Wiki &  Whitespace

["<leader>wa"] = { "<cmd>edit $HOME/git/wiki/journal/A.md<cr>", "" },
["<leader>wb"] = { "<cmd>edit $HOME/git/wiki/journal/B.md<cr>", "" },

["<leader>we"] = { "<cmd>WikiExport<cr>", "" },
["<leader>wi"] = { "<cmd>WikiIndex<cr>", "" },
["<leader>wp"] = { "<cmd>WikiFzfPages<cr>", "" },
["<leader>wr"] = { "<cmd>%s/\r//g<cr>", "" },
["<leader>wt"] = { "mz<cmd>%s/\t/  /g<cr><cmd>let @/=''<cr>`z", "" },
["<leader>ww"] = { [[mz<cmd>%s//\\s\\+$////<cr><cmd>let @/=''<cr>`z]], "" },
["<leader>wZ"] = { "<cmd>WikiFzfTags<cr>", "" },

-- ------------------------------------------------------------------------- }}}
-- {{{ u - Undotree

["<leader>u", "<cmd>UndotreeToggle<cr>")

M.rnvimr = {
  plugin = true,
  n = {
    ["<leader>r"] = { "<cmd> RnvimrToggle <CR>", "ranger" },
  },
}
-- ------------------------------------------------------------------------- }}}

-- local mappings = {
  {


M.vimtex = {
  plugin = true,
  n = {
    ["<leader>lb"] = 	{ "<cmd>VimtexCompile<CR>", "build" },
    ["<leader>lc"] = 	{ "<cmd>VimtexCountWords!<CR>", "count" },
    ["<leader>li"] = 	{ "<cmd>VimtexTocOpen<CR>", "index" },
    ["<leader>lv"] = 	{ "<cmd>VimtexView<CR>", "view" },
  },
}

M.ACTIONS = {
  plugin = true,
  n = {
		["<leader>aa"] = { "<cmd>lua PdfAnnots()<CR>", "annotate" },
		["<leader>ab"] = { "<cmd>terminal bibexport -o %:p:r.bib %:p:r.aux<CR>", "bib export" },
		["<leader>ac"] = { "<cmd>VimtexClean<CR>", "clean aux" },
		["<leader>ag"] = { "<cmd>e ~/.config/nvim/templates/Glossary.tex<CR>", "edit glossary" },
		["<leader>ah"] = { "<cmd>lua _HTOP_TOGGLE()<CR>", "htop" },
		["<leader>ai"] = { "<cmd>IlluminateToggle<CR>", "illuminate" },
		["<leader>ak"] = {
			"<cmd>lua require('cmp').setup.buffer { enabled = false }<CR>",
			"kill LSP",
		},
		["<leader>al"] = {
			"<cmd>lua require('cmp').setup.buffer { enabled = true }<CR>",
			"load LSP",
		},
		-- ["<leader>al"] = { '<cmd>lua toggle_cmp()<CR>', "LSP"},
		["<leader>ap"] = { '<cmd>lua require("nabla").popup()<CR>', "preview symbols" },
		["<leader>ar"] = { "<cmd>VimtexErrors<CR>", "report errors" },
		["<leader>as"] = { "<cmd>e ~/.config/nvim/snippets/tex.snippets<CR>", "edit snippets" },
		["<leader>av"] = { "<plug>(vimtex-context-menu)", "vimtex menu" },

  }
}
M.Find= {
  plugin = true,
  n = {
		["<leader>fb"] = {
			"<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewe["<leader>fr"] = false})<CR>",
			"buffers"
		},
		["<leader>fc"] = { "<cmd>Telescope bibtex<CR>", "citations" },
		["<leader>ff"] = { "<cmd>Telescope live_grep theme=ivy<CR>", "project" },
		["<leader>fg"] = { "<cmd>Telescope git_branches<CR>", "branches" },
		["<leader>fh"] = { "<cmd>Telescope help_tags<CR>", "help" },
		["<leader>fk"] = { "<cmd>Telescope keymaps<CR>", "keymaps" },
		["<leader>fm"] = { "<cmd>Telescope man_pages<CR>", "man pages" },
		["<leader>fr"] = { "<cmd>Telescope registers<CR>", "registers" },
		["<leader>ft"] = { "<cmd>Telescope colorscheme<CR>", "theme" },
		["<leader>fy"] = { "<cmd>YankyRingHistory<CR>", "yanks" },
		-- ["<leader>fc"] = { "<cmd>Telescope commands<CR>", "commands" },
		-- ["<leader>fr"] = { "<cmd>Telescope oldfiles<CR>", "recent" },
  }
}
M.Git= {
  plugin = true,
  n = {
		["<leader>gg"] = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "lazygit" },
		["<leader>gj"] = { "<cmd>lua require 'gitsigns'.next_hunk()<CR>", "next hunk" },
		["<leader>gk"] = { "<cmd>lua require 'gitsigns'.prev_hunk()<CR>", "prev hunk" },
		["<leader>gl"] = { "<cmd>lua require 'gitsigns'.blame_line()<CR>", "blame" },
		["<leader>gp"] = { "<cmd>lua require 'gitsigns'.preview_hunk()<CR>", "preview hunk" },
		["<leader>gr"] = { "<cmd>lua require 'gitsigns'.reset_hunk()<CR>", "reset hunk" },
		["<leader>gs"] = { "<cmd>lua require 'gitsigns'.stage_hunk()<CR>", "stage hunk" },
		["<leader>gu"] = {
			"<cmd>lua require 'gitsigns'.undo_stage_hunk()<CR>",
			"unstage hunk",
		},
		["<leader>go"] = { "<cmd>Telescope git_status<CR>", "open changed file" },
		["<leader>gb"] = { "<cmd>Telescope git_branches<CR>", "checkout branch" },
		["<leader>gc"] = { "<cmd>Telescope git_commits<CR>", "checkout commit" },
		["<leader>gd"] = { "<cmd>Gitsigns diffthis HEAD<CR>", "diff" },

  }
}
M.SessionManager= {
  plugin = true,
  n = {
		["<leader>ms"] = { "<cmd>SessionManager save_current_session<CR>", "save" },
		["<leader>md"] = { "<cmd>SessionManager delete_session<CR>", "delete" },
		["<leader>ml"] = { "<cmd>SessionManager load_session<CR>", "load" },

  }
}
M.Pandoc= {
  plugin = true,
  n = {
		["<leader>pw"] = { "<cmd>TermExec cmd='pandoc %:p -o %:p:r.docx'<CR>", "word" },
		["<leader>pm"] = { "<cmd>TermExec cmd='pandoc %:p -o %:p:r.md'<CR>", "markdown" },
		["<leader>ph"] = { "<cmd>TermExec cmd='pandoc %:p -o %:p:r.html'<CR>", "html" },
		["<leader>pl"] = { "<cmd>TermExec cmd='pandoc %:p -o %:p:r.tex'<CR>", "latex" },
		["<leader>pp"] = { "<cmd>TermExec cmd='pandoc %:p -o %:p:r.pdf'<CR>", "pdf" },
		-- x = { "<cmd>echo "run: unoconv -f pdf path-to.docx""  , "word to pdf"},
  }
}
M.Surround= {
  plugin = true,
  n = {
		["<leader>ss"] = { "<Plug>(nvim-surround-normal)", "surround" },
		["<leader>sd"] = { "<Plug>(nvim-surround-delete)", "delete" },
		["<leader>sc"] = { "<Plug>(nvim-surround-change)", "change" },
  }
}

M.Templates = {
  plugin = true,
  n = {
		name = "TEMPLATES",
		["<leader>tc"] = { "<cmd>PackerCompile<CR>", "Compile" },
		["<leader>tp"] = {
			"<cmd>read ~/.config/nvim/templates/PhilPaper.tex<CR>",
			"PhilPaper.tex",
		},
		["<leader>tl"] = {
			"<cmd>read ~/.config/nvim/templates/Letter.tex<CR>",
			"Letter.tex",
		},
		["<leader>tg"] = {
			"<cmd>read ~/.config/nvim/templates/Glossary.tex<CR>",
			"Glossary.tex",
		},
		["<leader>th"] = {
			"<cmd>read ~/.config/nvim/templates/HandOut.tex<CR>",
			"HandOut.tex",
		},
		["<leader>tb"] = {
			"<cmd>read ~/.config/nvim/templates/PhilBeamer.tex<CR>",
			"PhilBeamer.tex",
		},
		["<leader>ts"] = {
			"<cmd>read ~/.config/nvim/templates/SubFile.tex<CR>",
			"SubFile.tex",
		},
		["<leader>tr"] = {
			"<cmd>read ~/.config/nvim/templates/Root.tex<CR>",
			"Root.tex",
		},
		["<leader>tm"] = {
			"<cmd>read ~/.config/nvim/templates/MultipleAnswer.tex<CR>",
			"MultipleAnswer.tex",
		},
  }
}

M.= {
  plugin = true,
  n = {

  }
}



