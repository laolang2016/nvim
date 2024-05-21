-- 默认项目配置
local default_config = require("projectinfo.conf")

-- 项目根目录配置
local function read_project_info(filename)
    local root_dir = vim.fn.getcwd()
    package.path = package.path .. ";" .. root_dir .. "/.neovim/?.lua"
    local ok, gns = pcall(require, filename)
    if not ok then
        return {}
    end

    local gns_settings = gns.settings
    if type(gns_settings) == "table" and next(gns_settings) ~=nil then
        return gns_settings
    end
    return {}
end

local gns_settings = read_project_info("settings")

local M = {}

M.conf = default_config

function M.setup()
    -- vim.print(default_config)
    -- vim.print(gns_settings)
    -- vim.print("----------")

    -- local conf = vim.tbl_deep_extend("force", default_config, gns_settings or {})
    -- vim.print(conf)
    M.conf = vim.tbl_deep_extend("force", default_config, gns_settings or {})
    
end

return M
