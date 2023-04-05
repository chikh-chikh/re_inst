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
	prefix = { "<leader>", "<Bslash>" },
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
}

-- hjknoyz

-- GENERAL MAPPINGS


local register = {
	["<leader>"] = {
		-- H = {
		--   name = '+Help',
		-- },
		L = {
			name = "+LSP",
		},
		V = {
			name = "+Linewise reselection of what you just pasted",
		},
		S = {
			name = "+Gitsigns",
		},
		a = {
			name = "+Alpha",
		},
		b = {
			name = "+Buffer adjustments",
		},
		c = {
			name = "+Copy & Paste & tmux",
		},
		D = {
			name = "+Debug Adapter Protocol",
		},
		d = {
			name = "+DAP)",
		},
		f = {
			name = "+Find & tmux",
		},
		g = {
			name = "+git",
		},
		k = {
			name = "+kill runner",
		},
		l = {
			name = "+VimTex",
		},
		e = {
			name = "+File explorers",
		},
		o = {
			name = "+Options",
		},
		p = {
			name = "+Package manager",
		},
		r = {
			name = "+Runners",
		},
		s = {
			name = "+Split & Sort",
		},
		t = {
			name = "+Terminals",
		},
		w = {
			name = "+Wiki & WhiteSpace",
		},
		u = {
			name = "+Undotree",
		},
		A = {
			name = "ACTIONS",
		},
		M = {
			name = "+MANAGE SESSION",
		},
		P = {
			name = "+PANDOC",
		},
		R = {
			name = "+SURROUND",
		},
		T = {
			name = "+TEMPLATES",
		},
	},
	["<BSlash>"] = {
		r = {
			name = "+",
		},
	},
}

which_key.setup(setup)
-- which_key.register(mappings, opts)
which_key.register(register)
