local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

vim.opt.runtimepath:prepend(lazypath)
-- vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

vim.g.mapleader = " "
-- vim.g.maplocalleader = "<Bslash>"

-- require('lazy').setup('plugins')
require("lazy").setup({
	spec = {
		-- { "LazyVim/LazyVim", import = "lazyvim.plugins" },
		{ import = "plugins" },
	},
	defaults = {
		lazy = true,
		version = false,
	},
	checker = { enabled = true, notify = false },
	-- dev = {
	--   path = "~/code/plugins",
	--   fallback = true,
	--   patterns = { "adalessa" },
	-- },
	performance = {
		rtp = {
			disabled_plugins = {
				"gzip",
				-- "matchit",
				-- "matchparen",
				"netrwPlugin",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
})

