local keybindings = require("keybindings")

require("lspconfig").volar.setup ({
  on_attach = function(_, bufnr)

    local function buf_set_keymap(...)
      vim.api.nvim_buf_set_keymap(bufnr, ...)
    end

    keybindings.mapLSP(buf_set_keymap)
  end
})
