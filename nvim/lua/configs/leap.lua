  local leap = require('leap')
    
    -- Disable default mappings
    leap.opts.default_keymaps = false
    
    -- Set custom keymaps, excluding 'gs'
    vim.keymap.set({'n', 'x', 'o'}, 's', '<Plug>(leap-forward-to)')
    vim.keymap.set({'n', 'x', 'o'}, 'S', '<Plug>(leap-backward-to)')
    
    -- The below settings make Leap's highlighting closer to what you've been
    -- used to in Lightspeed.
    vim.api.nvim_set_hl(0, 'LeapBackdrop', { link = 'Comment' }) -- or some grey
    vim.api.nvim_set_hl(0, 'LeapMatch', {
      -- For light themes, set to 'black' or similar.
      fg = 'white',
      bold = true,
      nocombine = true,
    })
    -- Deprecated option. Try it without this setting first, you might find
    -- you don't even miss it.
    leap.opts.highlight_unlabeled_phase_one_targets = true
