local status, nvim_tree = pcall(require, "nvim-tree")

if not status then
    vim.notify("没有找到 nvim-tree 捏👀")
  return
end

local function on_attach(bufnr)
  local api = require('nvim-tree.api')

  local function opts(desc)
    return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  vim.keymap.set('n', '<CR>', api.node.open.edit, opts('Open'))
  vim.keymap.set('n', 'o', api.node.open.edit, opts('Open'))
  vim.keymap.set('n', '<2-LeftMouse>', api.node.open.edit, opts('Open'))
  vim.keymap.set('n', 'v', api.node.open.vertical, opts('Open: Vertical Split'))
  vim.keymap.set('n', 'h', api.node.open.horizontal, opts('Open: Horizontal Split'))
  vim.keymap.set('n', 'i', api.tree.toggle_custom_filter, opts('Toggle Hidden'))
  vim.keymap.set('n', '.', api.tree.toggle_hidden_filter, opts('Toggle Dotfiles'))
  vim.keymap.set('n', '<F5>', api.tree.reload, opts('Refresh'))
  vim.keymap.set('n', 'a', api.fs.create, opts('Create'))
  vim.keymap.set('n', 'd', api.fs.remove, opts('Delete'))
  vim.keymap.set('n', 'r', api.fs.rename, opts('Rename'))
  vim.keymap.set('n', 'x', api.fs.cut, opts('Cut'))
  vim.keymap.set('n', 'c', api.fs.copy.node, opts('Copy'))
  vim.keymap.set('n', 'p', api.fs.paste, opts('Paste'))

end

nvim_tree.setup({
    on_attach = on_attach,
    git = {
        enable = true,
    },
    -- 显示 .文件 和 隐藏 node_modules 文件夹
    filters = {
        dotfiles = false,
        custom = { 'node_modules', ".git" },
    },
    view = {
        width = 25,
        side = 'left',
        hide_root_folder = false,
        number = false,
        relativenumber = false,
        signcolumn = 'yes',
    },
    actions = {
        open_file = {
            -- 首次打开大小适配
            resize_window = true,
            -- 打开文件时关闭
            quit_on_open = false,
        },
    },
    -- wsl install -g wsl-open
    -- https://github.com/4U6U57/wsl-open/
    system_open = {
        -- cmd = 'wsl-open', -- mac 直接设置为 open
        cmd = 'open',
    },

    -- 支持切换目录
		update_cwd = true,
		update_focused_file = {
      enable = true,
			update_cwd = true
		}

})

