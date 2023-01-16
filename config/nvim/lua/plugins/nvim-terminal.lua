vim.o.hidden = true

require('nvim-terminal').setup({
    window = {
        -- Do `:h :botright` for more information
        -- NOTE: width or height may not be applied in some "pos"
        position = 'botright',
        -- Do `:h split` for more information
        split = 'sp',
        -- Width of the terminal
        width = 50,
        -- Height of the terminal
        height = 15,
    },

    -- ключевая карта для отключения всех ключевых карт по умолчанию = false,

    -- ключевая карта для переключения открытия и закрытия окна терминала
    toggle_keymap = '<leader>;',
    -- увеличьте высоту окна, когда вы нажмете на ключ
    window_height_change_amount = 2,
    -- увеличьте ширину окна, когда вы нажмете на ключ
    window_width_change_amount = 2,
    -- keymap для увеличения ширины
    increase_width_keymap = '<leader><leader>+',
    -- keymap для уменьшения ширины
    decrease_width_keymap = '<leader><leader>-',
    -- keymap для увеличения высоты окна 
    increase_height_keymap = '<leader>+',
    -- keymap для уменьшения высоты окна
    decrease_height_keymap = '<leader>-',
    terminals = {
      -- ключевые карты для открытия n-го терминала  
        {keymap = '<leader>1'},
        {keymap = '<leader>2'},
        {keymap = '<leader>3'},
        {keymap = '<leader>4'},
        {keymap = '<leader>5'},
    },
})
