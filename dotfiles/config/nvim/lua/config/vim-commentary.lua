-- {{@@ header() @@}}

return function ()
    local map = require('utils').map

    map('n', '<space>/', ':Commentary<CR>')
    map('v', '<space>/', ':Commentary<CR>')
end
