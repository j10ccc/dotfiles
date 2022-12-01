require("mason").setup()
require("mason-lspconfig").setup({
  ensure_install = {
    "sumneko_lua", "eslint"
  }
})

require("lsp.config.ts")
require("lsp.config.lua")

