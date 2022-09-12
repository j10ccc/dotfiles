local status, nvim_tree = pcall(require, "nvim-tree")

if not status then
    vim.notify("没有找到 nvim-tree 捏👀")
  return
end

local list_keys = require('keybindings').nvimTreeList
nvim_tree.setup({
    git = {
        enable = true,
    },
    -- project plugin 需要这样设置
    update_cwd = true,
    update_focused_file = {
        enable = true,
        update_cwd = true,
    },
    -- 隐藏 .文件 和 node_modules 文件夹
    filters = {
        dotfiles = false,
        custom = { 'node_modules' },
    },
    view = {
        width = 25,
        side = 'left',
        hide_root_folder = false,
        mappings = {
            custom_only = false,
            list = list_keys,
        },
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

-- 自动关闭
vim.cmd([[
  autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
]])
