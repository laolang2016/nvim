local root_dir = vim.fn.getcwd()
package.path = package.path .. ";" .. root_dir .. "/.neovim/?.lua"

local function read_ignore_file()
    local root_dir = vim.fn.getcwd()

    local ok, gns = pcall(require, "settings")
    if not ok then
        return {}  
    end

    local ignored_directories = gns.telescope_file_ignore_patterns()
    local ignore_patterns = gns.telescope_file_ignore_patterns()
    if type(ignored_directories) == "table" and next(ignored_directories) ~=nil then
        return ignored_directories
    end
    return {}
end

local status, telescope = pcall(require, "telescope")
if not status then
  vim.notify("没有找到 telescope")
  return
end

telescope.setup({
    defaults = {
        -- 打开弹窗后进入的初始模式，默认为 insert，也可以是 normal
        initial_mode = "insert",
        -- 窗口内快捷键
        -- mappings = require("keybindings").telescopeList,
        file_ignore_patterns = read_ignore_file()
    },
    pickers = {
    -- 内置 pickers 配置
    find_files = {
    -- 查找文件换皮肤，支持的参数有： dropdown, cursor, ivy
    -- theme = "dropdown", 
    }
    },
    extensions = {
    -- 扩展插件配置
    },
})

