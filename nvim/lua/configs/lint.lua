local lint = require "lint"

-- yamllint быстрый -> гоняем автоматически (конфиг .yamllint подхватится сам).
-- Для составного filetype yaml.ansible nvim-lint сам откатится к "yaml".
-- ansible-lint тяжёлый (питон, сканирует проект) -> только по запросу: :AnsibleLint
lint.linters_by_ft = {
  yaml = { "yamllint" },
}

vim.api.nvim_create_autocmd({ "BufWritePost", "InsertLeave" }, {
  callback = function() lint.try_lint() end,
})

-- запустить линтеры текущего буфера вручную
vim.api.nvim_create_user_command("Lint", function() lint.try_lint() end, {})

-- ansible-lint текущего файла по запросу
vim.api.nvim_create_user_command("AnsibleLint", function() lint.try_lint "ansible_lint" end, {})

vim.keymap.set("n", "<leader>al", function() lint.try_lint "ansible_lint" end, { desc = "ansible-lint current file" })
