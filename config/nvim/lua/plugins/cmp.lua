local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
  return
end
-- luasnip setup
local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
  return
end

local check_backspace = function() --for Tab
  local col = vim.fn.col "." - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end

local lspkind = require('lspkind')

-- https://www.nerdfonts.com/cheat-sheet

cmp.setup {
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      require 'luasnip'.lsp_expand(args.body) -- Luasnip expand
    end,
  },
  -- Клавиши, которые будут взаимодействовать в nvim-cmp
  mapping = {
    -- Вызов меню автодополнения
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    --['<CR>'] = cmp.config.disable,                      -- Я не люблю, когда вещи автодополняются на <Enter>
    --['<C-y>'] = cmp.mapping.confirm({ select = true }), -- А вот на <C-y> вполне ок
    ['<Return>'] = cmp.mapping.confirm({ select = true }),
    -- Используем <C-e> для того чтобы прервать автодополнение
    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(), -- Прерываем автодополнение
      c = cmp.mapping.close(), -- Закрываем автодополнение
    }),
    ['<C-k>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),
    ['<C-j>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
    ['<C-d>'] = cmp.mapping.scroll_docs(-1),
    ['<C-f>'] = cmp.mapping.scroll_docs(1),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expandable() then
        luasnip.expand()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif check_backspace() then
        fallback()
      else
        fallback()
      end
    end, { "i", "s", }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s", }),
  },
  sources = cmp.config.sources {
    { name = 'nvim_lsp' }, -- LSP 👄
		{ name = 'cmp_tabnine' }, -- AI
    { name = 'nvim_lsp_signature_help' }, -- Помощь при введении параметров в методах 🚁
    { name = 'cmp_nvim_r' },
    { name = 'luasnip' }, -- Luasnip 🐌
    { name = 'buffer' }, -- Буфферы 🐃
    { name = 'path' }, -- Пути 🪤
    --{ name = "emoji" },                   -- Эмодзи 😳
  },
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
	 		vim_item.kind = lspkind.symbolic(vim_item.kind, {mode = "symbol"})
      vim_item.menu = ({
        nvim_lsp = "[LSP]",
        cmp_tabnine = "[TN]",
        nvim_lua = "[NVIM_LUA]",
        cmp_nvim_r = "[R]",
        luasnip = "[Snippet]",
        buffer = "[Buffer]",
        path = "[Path]",
      })[entry.source.name]
	 		if entry.source.name == "cmp_tabnine" then
	 			local detail = (entry.completion_item.data or {}).detail
	 			vim_item.kind = ""
	 			if detail and detail:find('.*%%.*') then
	 				vim_item.kind = vim_item.kind .. ' ' .. detail
	 			end

	 			if (entry.completion_item.data or {}).multiline then
	 				vim_item.kind = vim_item.kind .. ' ' .. '[ML]'
	 			end
	 		end
	 		local maxwidth = 80
	 		vim_item.abbr = string.sub(vim_item.abbr, 1, maxwidth)
      return vim_item
    end,
  },

  window = {
    completion = cmp.config.window.bordered({
      side_padding = 0,
      col_offset = -1
    }),
    documentation = {
      border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
    }
  },
}


cmp.setup.filetype("gitcommit", {
  sources = cmp.config.sources({
    { name = "cmp_git" },
  }, {
    { name = "buffer" },
  }),
})

-- Command line completion
cmp.setup.cmdline("/", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = { { name = "buffer" } },
})

cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = "path" },
  }, {
    { name = "cmdline" },
  }),
})


