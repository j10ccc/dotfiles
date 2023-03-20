vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.api.nvim_set_keymap
local opt = { noremap = true, silent = true }

-- split keybindings
map("n", "s", "", opt)
map("n", "sv", ":vsp<CR>", opt)
-- map("n", "sh", ":sp<CR>", opt)

map("n", "sc", "<C-w>c", opt)
map("n", "so", "<C-w>o", opt)

-- 移动光标
map("n", "<Up>", "4k", opt)
map("n", "<Down>", "4j", opt)
map("n", "<C-u>", "9k", opt)
map("n", "<C-d>", "9j", opt)

-- 移动焦点
map("n", "sh", "<C-w>h", opt)
map("n", "sl", "<C-w>l", opt)

-- plugin-key-mapping
local pluginKeys = {}

-- nvim-tree
map("n", "M", ":NvimTreeToggle<CR>", opt)
pluginKeys.nvimTreeList = {
	{ key = { "<CR>", "o", "<2-LeftMouse>" }, action = "edit" },
	{ key = "v", action = "vsplit" },
	{ key = "h", action = "split" },

	-- 对应 filters 中的 custom (node_modules)
	{ key = "i", action = "toggle_custom" },
	-- Hide (dotfiles)
	{ key = ".", action = "toggle_dotfiles" },

	-- 文件操作
	{ key = "<F5>", action = "refresh" },
	{ key = "a", action = "create" },
	{ key = "d", action = "remove" },
	{ key = "r", action = "rename" },
	{ key = "x", action = "cut" },
	{ key = "c", action = "copy" },
	{ key = "p", action = "paste" },
	{ key = "s", action = "" },
}

-- bufferline
-- 左右Tab切换
map("n", "<tab>h", ":BufferLineCyclePrev<CR>", opt)
map("n", "<tab>l", ":BufferLineCycleNext<CR>", opt)

-- 关闭
--"moll/vim-bbye"
map("n", "<C-q>", ":Bdelete!<CR>", opt)
map("n", "<leader>bl", ":BufferLineCloseRight<CR>", opt)
map("n", "<leader>bh", ":BufferLineCloseLeft<CR>", opt)
map("n", "<leader>bc", ":BufferLinePickClose<CR>", opt)

-- telescope
map("n", ";f", ":Telescope find_files<CR>", opt)
map("n", ";g", ":Telescope live_grep<CR>", opt)
pluginKeys.telescopeList = {
	i = {
		["<C-c>"] = "close",
		["<C-u>"] = "preview_scrolling_up",
		["<C-d>"] = "preview_scrolling_down",
	},
}

-- nvim-cmp

pluginKeys.cmp = function(cmp)
	return {
		-- 出现补全
		-- ["<A-.>"] = cmp.mapping(cmp.mapping.complete(), {"i", "c"}),
		-- 取消
		-- ["<A-,>"] = cmp.mapping({
		-- i = cmp.mapping.abort(),
		-- c = cmp.mapping.close()
		-- }),

		-- 上一个
		["<Up>"] = cmp.mapping.select_prev_item(),
		-- 下一个
		["<Down>"] = cmp.mapping.select_next_item(),
		-- 确认
		["<CR>"] = cmp.mapping.confirm({
			select = true,
			behavior = cmp.ConfirmBehavior.Replace,
		}),
		-- 如果窗口内容太多，可以滚动
		-- ["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), {"i", "c"}),
		-- ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), {"i", "c"}),
	}
end

-- lsp 回调函数快捷键设置
pluginKeys.mapLSP = function(mapbuf)
	-- rename
	--[[
  Lspsaga 替换 rn
  mapbuf("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opt)
  --]]
	mapbuf("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opt)
	-- code action
	--[[
  Lspsaga 替换 ca
  mapbuf("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opt)
  --]]
	mapbuf("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opt)
	-- go xx
	--[[
    mapbuf('n', 'gd', '<cmd>Lspsaga preview_definition<CR>', opt)
  --]]
	mapbuf("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opt)
	--[[
  Lspsaga 替换 gh
  mapbuf("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opt)
  --]]
	mapbuf("n", "gh", "<cmd>Lspsaga hover_doc<cr>", opt)
	--[[
  Lspsaga 替换 gr
  mapbuf("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opt)
  --]]
	mapbuf("n", "gr", "<cmd>Lspsaga lsp_finder<CR>", opt)
	--[[
  Lspsaga 替换 gp, gj, gk
  mapbuf("n", "gp", "<cmd>lua vim.diagnostic.open_float()<CR>", opt)
  mapbuf("n", "gj", "<cmd>lua vim.diagnostic.goto_next()<CR>", opt)
  mapbuf("n", "gk", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opt)
  --]]
	-- diagnostic
	mapbuf("n", "gp", "<cmd>Lspsaga show_line_diagnostics<CR>", opt)
	mapbuf("n", "gj", "<cmd>Lspsaga diagnostic_jump_next<cr>", opt)
	mapbuf("n", "gk", "<cmd>Lspsaga diagnostic_jump_prev<cr>", opt)
	mapbuf("n", "<leader>f", "<cmd>lua vim.lsp.buf.format()<CR>", opt)
	-- 未用
	-- mapbuf("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opt)
	-- mapbuf("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opt)
	-- mapbuf('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opt)
	-- mapbuf("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opt)
	-- mapbuf('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opt)
	-- mapbuf('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opt)
	-- mapbuf('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opt)
	-- mapbuf('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opt)
end

pluginKeys.mapTsLSP = function(mapbuf)
	mapbuf("n", "gs", ":TSLspOrganize<CR>", opt)
	mapbuf("n", "gr", ":TSLspRenameFile<CR>", opt)
	mapbuf("n", "gi", ":TSLspImportAll<CR>", opt)
end

pluginKeys.mapHop = function(mapbuf)
	mapbuf("n", "\\w", ":HopWord<CR>", opt)
end

return pluginKeys

