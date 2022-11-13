return {
  on_setup = function(server)
    server:setup({
      capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
		})
  end
}
