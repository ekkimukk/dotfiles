require("nvchad.configs.lspconfig").defaults()

-- Схемы для yaml: каталог SchemaStore уже содержит все ansible-схемы
-- (playbook, tasks, vars, meta, requirements, galaxy, .ansible-lint, ansible-navigator),
-- а также gitlab-ci, docker-compose, github actions и т.д.
-- Ручной способ для нестандартного файла (работает и на чужом компе с yamlls):
--   # yaml-language-server: $schema=https://raw.githubusercontent.com/.../schema.json
local schemas = require("schemastore").yaml.schemas {
  extra = {
    {
      name = "Kubernetes",
      description = "Kubernetes manifests",
      -- у k8s-манифестов нет соглашения об именах, поэтому мапим на свои каталоги;
      -- поправь globs под структуру своих репозиториев
      fileMatch = { "k8s/**/*.yaml", "k8s/**/*.yml", "deploy/**/*.yaml", "deploy/**/*.yml" },
      url = "https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.33.1-standalone-strict/all.json",
    },
  },
}

vim.lsp.config("yamlls", {
  -- yaml.ansible ставит плагин nvim-ansible для плейбуков/ролей;
  -- по умолчанию yamlls на составной filetype не цепляется
  filetypes = { "yaml", "yaml.ansible" },
  settings = {
    yaml = {
      -- встроенный каталог схем yamlls устарел, отдаём приоритет schemastore.nvim
      schemaStore = { enable = false, url = "" },
      schemas = schemas,
      validate = true,
      completion = true,
      hover = true,
      customTags = { "!vault", "!unsafe" }, -- специфичные для ansible теги
      format = { enable = false }, -- форматирование делает conform.nvim (yamlfmt)
      keyOrdering = false, -- ansible не требует сортировки ключей
    },
  },
})

local servers = { "html", "cssls", "yamlls" }
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers
