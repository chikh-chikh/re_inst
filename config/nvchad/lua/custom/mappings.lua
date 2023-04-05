local M = {}

M.general = {
	n = {
		[";"] = { ":", "enter command mode", opts = { nowait = true } },

		-- Personal normal keybindings
		-- ['<C-h>'] = { "<C-w>h", "", opts = {nowait = true} },
		-- ['<C-j>'] = { "<C-w>j", "", opts = {nowait = true} },
		-- ['<C-k>'] = { "<C-w>k", "", opts = {nowait = true} },
		-- ['<C-l>'] = { "<C-w>l", "", opts = {nowait = true} },
		["ww"] = { ":w<cr>", "write" },
		["wq"] = { ":wq<cr>", "write and quit" },
		["qq"] = { ":q<cr>", "quit" },
		-- Bdelete
		["<leader>d"] = { ":bd!<CR>", "close buffer" },
		-- Navigate buffers
		["<S-l>"] = { ":bnext<CR>", "buffer next" },
		["<S-h>"] = { ":bprevious<CR>", "buffer prev" },
		-- Move text up and down
		["<A-j>"] = { "<Esc>:m .+1<CR>==gi", "change with down string" },
		["<A-k>"] = { "<Esc>:m .-2<CR>==gi", "change with up string" },
		-- Resize with arrows
		["<C-Up>"] = { ":resize -2<CR>", "resize up" },
		["<C-Down>"] = { ":resize +2<CR>", "resize down" },
		["<C-Left>"] = { ":vertical resize +2<CR>", "resize left" },
		["<C-Right>"] = { ":vertical resize -2<CR>", "resize right" },
		-- lists navigation
		-- ["<leader>j"] = { ":cnext<CR>zz", "", opts = {nowait = true} },
		-- ["<leader>k"] = { ":cprev<CR>zz", "", opts = {nowait = true} },
		-- ["<leader>i"] = { ":lnext<CR>zz", "", opts = {nowait = true} },
		-- ["<leader>o"] = { ":lprev<CR>zz", "", opts = {nowait = true} },
		-- ["<leader>cc"] = { ":cclose<CR>", "", opts = {nowait = true} },
		-- quick split
		-- ["<leader>wsv"] = { ":vsp<CR>", "", opts = {nowait = true} },
		-- search result focus
		["n"] = { "nzzzv", "replace search result" },
		["N"] = { "Nzzzv", "replace srarch result" },
		-- join lines focus
		["J"] = { "mzJ`z", "concatenate string" },
		--- quick env file edit
		-- ["<leader>ee"] = { ":vsp .env<CR>", "", opts = {nowait = true} },
	},
	-- Insert --
	i = {
		-- Press jk fast to enter
		["jk"] = { "<escape>", "quit insert mode" },
		["kj"] = { "<escape>", "quit insert mode" },

		["ww"] = { "<escape>:ww<cr>", "write" },
		["wq"] = { "<escape>:wq<cr>", "write and quit" },
		["qq"] = { "<escape>:q<cr>", "quite" },
	},
	-- Visual --
	v = {
		-- tabulation
		["<"] = { "<gv", "tab del" },
		[">"] = { ">gv", "tab add" },
		-- Move text up and down
		["<A-j>"] = { ":m .+1<CR>==", "move down string" },
		["<A-k>"] = { ":m .-2<CR>==", "move up string" },

		["P"] = { '"_dP', "" },
		["p"] = { '"_dp', "" },
	},
	-- Terminal --
	t = {
		["<Esc><Esc>"] = { "<C-\\><C-n>", "" },
		["<C-h>"] = { "<c-\\><c-n><c-w>h", "" },
		["<C-j>"] = { "<c-\\><c-n><c-w>j", "" },
		["<C-k>"] = { "<c-\\><c-n><c-w>k", "" },
		["<C-l>"] = { "<c-\\><c-n><c-w>l", "" },
	},
	--Visual Block --
	x = {
		--Move text up and down
		["J"] = { ":move '>+1<CR>gv-gv", "" },
		["K"] = { ":move '<-2<CR>gv-gv", "" },
		["<A-j>"] = { ":move '>+1<CR>gv-gv", "move down" },
		["<A-k>"] = { ":move '<-2<CR>gv-gv", "move up" },
	},
}

M.nvimtree = {
	plugin = true,
	n = {},
}

M.nvimtree = {
	plugin = true,
	n = {},
}


M.rnvimr = {
	-- plugin = true,
	n = {
		["<leader>r"] = { "<cmd> RnvimrToggle <CR>", "ranger" },
	},
}

M.undotree = {
	n = {
		["<leader>u"] = { "<cmd> UndotreeToggle <CR>", "toggle undotree" },
	},
}

-- more keybinds!

return M
