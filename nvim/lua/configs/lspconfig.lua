require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls" }
vim.lsp.enable(servers)

vim.lsp.config("yamlls", {
  settings = {
    yaml = {
      format = {
        enable = true,
      },
      schemas = {
        kubernetes = "*.yaml",
      },
    },
    validate = true,
  },
})

local servers = { "html", "cssls", "yamlls" }
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers
