require("mason").setup()
require("mason-lspconfig").setup({
  ensure_install = {
    "eslint"
  }
})

require("lsp.config.ts")
require("lsp.config.lua")

