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
--[[
local tabnine = require('cmp_tabnine.config')
tabnine:setup({
  max_lines = 1000,
  max_num_results = 20,
  sort = true,
  run_on_every_keystroke = true,
  snippet_placeholder = '..',
  ignored_file_types = {
    -- default is not to ignore
    -- uncomment to ignore in lua:
    -- lua = true
  },
  --show_prediction_strength = false
})
--]]
--local lspkind = require('lspkind')
---[[--
--   פּ ﯟ   some other good icons

local compare = require('cmp.config.compare')

local kind_icons = {
  Text = "",
  Method = "m",
  Function = "",
  Constructor = "",
  Field = "",
  Variable = "",
  Class = "",
  Interface = "",
  Module = "",
  Property = "",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "",
  Event = "",
  Operator = "",
  TypeParameter = "",
}
--]]--
-- find more here: https://www.nerdfonts.com/cheat-sheet
-- https://www.nerdfonts.com/cheat-sheet

cmp.setup {
  	-- preselect = cmp.PreselectMode.None,
  completion = {
    -- autocomplete = {
    --   cmp.TriggerEvent.TextChanged,
    --   cmp.TriggerEvent.InsertEnter,
    -- },
    completeopt = "menu,noselect",
    -- completeopt = "menuone,noinsert,noselect",
    keyword_length = 1,
  },

    sources = Constants.completion.sources,
  --[[--
  sources = cmp.config.sources {
    { name = 'nvim_lsp', group_index = 2  }, -- LSP
    -- { name = 'cmp_tabnine' }, -- AI
    { name = 'nvim_lsp_signature_help', group_index = 2  }, -- Помощь при введении параметров в методах 🚁
    { name = 'cmp_nvim_r',
      filetype = { "r" },
    },
    { name = "omni" },
    { name = 'luasnip' }, -- Luasnip
    { name = 'buffer',
      keyword_length = 3 }, -- Буфферы
    { name = "spell",
      keyword_length = 5,
      option = {
        keep_all_entries = false,
        enable_in_context = function()
          return true
        end
      },
    },
    { name = "latex_symbols",
      filetype = { "tex", "latex" },
      option = { cache = true }, -- avoids reloading each time
    },
    { name = 'path' }, -- Пути
    --{ name = "emoji" },  -- Эмодзи 😳
  },
--]]--

  sorting = {
    priority_weight = 2,
    comparators = {
      -- require("copilot_cmp.comparators").prioritize,
      -- require("copilot_cmp.comparators").score,
      compare.offset,
      compare.exact,
      -- compare.scopes,
      compare.score,
      compare.recently_used,
      compare.locality,
      -- compare.kind,
      compare.sort_text,
      compare.length,
      compare.order,
      -- require("copilot_cmp.comparators").prioritize,
      -- require("copilot_cmp.comparators").score,
    },
  },
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
      vim_item.kind =
       string.format("%s", Constants.icons.lsp_kinds[vim_item.kind])
      vim_item.menu = (Constants.completion.source_mapping)[entry.source.name]

      --[[--
      vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
      -- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
      -- vim_item.kind = lspkind.symbolic(vim_item.kind, { mode = "symbol" })
      vim_item.menu = ({
            -- omni = "[VimTex]",
            omni = (vim.inspect(vim_item.menu):gsub('%"', "")),
            nvim_lsp = "[LSP]",
            -- cmp_tabnine = "[TN]",
            nvim_lua = "[NVIM_LUA]",
            cmp_nvim_r = "[R]",
            spell = "[Spell]",
            latex_symbols = "[Symbols]",
            cmdline = "[CMD]",
            luasnip = "[Snippet]",
            buffer = "[Buffer]",
            path = "[Path]",
          })[entry.source.name]
      --]]--
      --[[ or
      if entry.source.name == 'cmp_tabnine' then
        if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
          vim.item.menu = entry.completion_item.data.detail
        end
        vim_item.kind = ""
      end
      --]]
      --[[ or
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
      if entry.source.name == "cmp_tabnine" or entry.source.name == "nvim_lsp" then
        vim_item.dup = 0
      end
      --]]
      local maxwidth = 80
      vim_item.abbr = string.sub(vim_item.abbr, 1, maxwidth)
      --vim_item.abbr = vim_item.abbr:match("[^(]+")
      return vim_item
    end,
  },

  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      require 'luasnip'.lsp_expand(args.body) -- Luasnip expand
    end,
  },
  -- Клавиши, которые будут взаимодействовать в nvim-cmp
  mapping = {
    -- Вызов меню автодополнения
    -- ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    --['<CR>'] = cmp.config.disable,                      -- Я не люблю, когда вещи автодополняются на <Enter>
    --['<C-y>'] = cmp.mapping.confirm({ select = true }), -- А вот на <C-y> вполне ок
    ['<Return>'] = cmp.mapping.confirm({ select = true }),
    -- Используем <C-e> для того чтобы прервать автодополнение
    -- ['<C-e>'] = cmp.mapping({
    --   i = cmp.mapping.abort(), -- Прерываем автодополнение
    --   c = cmp.mapping.close(), -- Закрываем автодополнение
    -- }),
    ['<C-k>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),
    ['<C-j>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
    ['<C-d>'] = cmp.mapping.scroll_docs( -1),
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
      elseif luasnip.jumpable( -1) then
        luasnip.jump( -1)
      else
        fallback()
      end
    end, { "i", "s", }),
  },

  confirm_opts = {
    behavior = cmp.ConfirmBehavior.Replace,
    select = false,
  },
  view = {
    entries = 'custom',
  },
  window = {
    completion = cmp.config.window.bordered({
      side_padding = 0,
      col_offset = -1,
      -- border = 'rounded',
      border = Constants.display_border.border,
      -- winhighlight = 'NormalFloat:Pmenu,NormalFloat:Pmenu,CursorLine:PmenuSel,Search:None',
    }),
    documentation = {
      -- border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
      -- border = 'rounded',
      border = Constants.display_border.border,
      -- winhighlight = 'NormalFloat:Pmenu,NormalFloat:Pmenu,CursorLine:PmenuSel,Search:None',
    }
  },
  experimental = {
    ghost_text = true,
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
  sources = { { name = "buffer" } }
})
---[[
cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(),
  -- sources = cmp.config.sources({
  sources = ({
    { name = "path" },
    { name = "cmdline" },
  }),
})
--]]
