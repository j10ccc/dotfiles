local status, null_ls = pcall(require, "null-ls")
if not status then
  vim.notify("没有找到 null-ls 捏👀")
  return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

null_ls.setup({
  debug = false,
  sources = {
    formatting.shfmt,
    formatting.stylua,
    formatting.clang_format,
    formatting.prettier.with({
      -- 只比默认配置少了 markdown
      filetypes = {
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "vue",
        "css",
        "scss",
        "less",
        "html",
        "json",
        "yaml",
        "graphql",
      },
      prefer_local = "node_modules/.bin",
    }),
    -- formatting.black.with({ extra_args = { "--fast" } }),
  },
  diagnostics.eslint.with({
    prefer_local = "node_modules/.bin",
  }),

  -- code actions ---------------------
  code_actions.gitsigns,
  code_actions.eslint.with({
    prefer_local = "node_modules/.bin",
  }),

  -- #{m}: message
  -- #{s}: source name (defaults to null-ls if not specified)
  -- #{c}: code (if available)
  -- 提示格式： [eslint] xxx
  diagnostics_format = "[#{s}] #{m}",

  -- 保存自动格式化
  -- on_attach = function(client)
  -- vim.cmd([[ command! Format execute 'lua vim.lsp.buf.format()']])
  -- if client.resolved_capabilities.document_formatting then
  -- vim.cmd("autocmd BufWritePre <buffer> Format")
  -- end
  -- end,
})
