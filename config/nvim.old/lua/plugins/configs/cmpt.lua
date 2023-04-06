Constants = require("config.constants")

---[[
    -- {{{ opts function overfides LazyVim default behavior.

    -- opts = function(_, opts)
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      -- ------------------------------------------------------------------- }}}
      -- {{{ has_words_before function
      --     Determines when words are present before the cursor.
      --     <Tab> and <S-Tab> m

      local has_words_before = function()
        -- Deprecated. (Defined in Lua 5.1/LuaJIT, current is Lua 5.4.)
        -- But, the next line does not work without pack statement.
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0
          and vim.api
              .nvim_buf_get_lines(0, line - 1, line, true)[1]
              :sub(col, col)
              :match("%s")
            == nil
      end

      local check_backspace = function() --for Tab
        local col = vim.fn.col "." - 1
        return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
      end

      -- local compare = require('cmp.config.compare')
      -- ------------------------------------------------------------------- }}}
      -- {{{ Completion length and keywords.
    cmp.setup {
      completion = {
        completeopt = "menu,nenuone,noinsert",
        keyword_length = 1,
      },

      -- ------------------------------------------------------------------- }}}
      -- {{{ Formatting fileds, icons, and source_mapping

      formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(entry, vim_item)
          vim_item.kind =
            string.format("%s", Constants.icons.lsp_kinds[vim_item.kind])
          vim_item.menu = (Constants.completion.source_mapping)[entry.source.name]
          local maxwidth = 80
          vim_item.abbr = string.sub(vim_item.abbr, 1, maxwidth)
          return vim_item
        end,
      },

      snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        require 'luasnip'.lsp_expand(args.body) -- Luasnip expand
      end,
      },

      -- ------------------------------------------------------------------- }}}
      -- {{{ Confirmaiton option
--[[--
      confirm_opts = {
        behavior = cmp.ConfirmBehavior.Replace,
        select = false,
      },
--]]--
      -- ------------------------------------------------------------------- }}}
      -- {{{ keybind mappings

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
--[[--
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
  --]]--
      -- ------------------------------------------------------------------- }}}
      -- {{{ Add boarders to completion windows.

      window = {
        completion = cmp.config.window.bordered{
          border = Constants.display_border.border,
        },
        documentation = cmp.config.window.bordered{
          border = Constants.display_border.border,
        },
      },

      sources = cmp.config.sources {
        Constants.completion.sources,
      },

  }
      -- ------------------------------------------------------------------- }}}
      -- {{{ Setup filetype and cmdline preferences.

      cmp.setup.filetype("gitcommit", {
        sources = cmp.config.sources({
          { name = "cmp_git" },
        }, {
          { name = "buffer" },
        }),
      })

      cmp.setup.cmdline({ "/", "?" }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" },
        },
      })

      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" },
        }, {
          { name = "cmdline" },
        }),
      })

      -- ------------------------------------------------------------------- }}}
      -- {{{ Update the function argument opts with local choices made.

      -- opts.completion = completion
      -- opts.confirm_opts = confirm_opts
      -- opts.formatting = formatting
      -- opts.mapping = mapping
      -- opts.sources = Constants.completion.sources
      -- opts.window = window
      -- opts.sorting = sorting
      -- opts.snippet = snippet

      -- ------------------------------------------------------------------- }}}
    -- end

--]]
