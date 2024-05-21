vim.opt.runtimepath:append("~/.config/nvim/graverplugin/projectinfo")
local projectinfo = require("projectinfo")
projectinfo.setup()
return projectinfo.conf