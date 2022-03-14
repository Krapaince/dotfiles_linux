-- {{@@ header() @@}}

return function()
  local map = require('utils').map

  map('n', '<Space>/', ':Commentary<CR>')
  map('v', '<Space>/', ':Commentary<CR>')
end
