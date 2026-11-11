return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "b0o/schemastore.nvim",
    lazy = true, -- используется только конфигом yamlls
  },

  -- Ansible: filetype yaml.ansible, K -> ansible-doc, gf -> files/ роли,
  -- запуск плейбука/роли: <leader>ar (или на visual-выделенных тасках)
  {
    "mfussenegger/nvim-ansible",
    lazy = false, -- нужен рано: регистрирует ftdetect для yaml.ansible
    keys = {
      {
        "<leader>ar",
        function() require("ansible").run() end,
        mode = { "n", "v" },
        desc = "Ansible run playbook/role",
      },
    },
  },

  -- линтеры (yamllint на сохранение, ansible-lint по запросу: :AnsibleLint)
  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = function() require "configs.lint" end,
  },

  -- автоустановка внешних инструментов через mason;
  -- PATH=prepend: бинари mason доступны внутри nvim (в т.ч. ansible-lint, которого нет в системе)
  {
    "mason-org/mason.nvim",
    opts = { PATH = "prepend" },
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "mason-org/mason.nvim" },
    event = "VeryLazy",
    opts = {
      ensure_installed = { "yaml-language-server", "yamllint", "ansible-lint", "yamlfmt" },
    },
  },

  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  -- парсеры для DevOps-файлов (массив заменяется целиком, поэтому продублированы дефолты NvChad)
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "lua", "luadoc", "printf", "vim", "vimdoc",
        "yaml", "ini", "dockerfile", "bash", "hcl",
      },
    },
  },
}
