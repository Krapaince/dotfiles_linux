-- {{@@ header() @@}}

return function ()
    local map = require('utils').map

    map('n', '<Up>',    ':call animate#window_delta_height(5)<CR>')
    map('n', '<Down>',  ':call animate#window_delta_height(-5)<CR>')
    map('n', '<Left>', ':call animate#window_delta_width(5)<CR>')
    map('n', '<Right>', ':call animate#window_delta_width(-5)<CR>')

end
