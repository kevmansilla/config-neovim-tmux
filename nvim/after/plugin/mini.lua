require('mini.comment').setup()
require('mini.ai').setup()
require('mini.cursorword').setup()
require('mini.pairs').setup()
require('mini.trailspace').setup()
require('mini.surround').setup()
require('mini.move').setup(
    {
        -- Module mappings. Use `''` (empty string) to disable one.
        mappings = {
            -- Move visual selection in Visual mode.
            left = '<C-j>',
            right = '<C-l>',
            down = '<C-k>',
            up = '<C-i>',

            -- Move current line in Normal mode
            line_left = '<C-j>',
            line_right = '<C-l>',
            line_down = '<C-k>',
            line_up = '<C-i>',
        },
    }
)

