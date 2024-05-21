local status, toggleterm = pcall(require, "toggleterm")
if not status then
  vim.notify("没有找到 toggleterm")
  return
end


toggleterm.setup({
    -- 打开关闭
    open_mapping = [[<c-\>]],
    -- 打开是进入 insert 模式
    start_in_insert = true,
    -- 在 当前 buffer 下方打开
    direction = 'horizontal'
})


