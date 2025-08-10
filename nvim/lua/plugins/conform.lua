return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      eruby = { "erb_format" },
      php = { "php_cs_fixer" },
      javascript = { "prettierd" },
      typescript = { "prettierd" },
      javascriptreact = { "prettierd" },
      typescriptreact = { "prettierd" },
      html = { "prettierd" },
      json = { "prettierd" },
      yaml = { "prettierd" },
      markdown = { "prettierd" },
      css = { "stylelint", "prettierd" },
      scss = { "stylelint", "prettierd" },
    },
    formatters = {
      stylelint = {
        args = { "--fix", "--stdin" },
        stdin = true,
      },
      prettierd = {
        env = {
          PRETTIERD_LOCAL_PRETTIER_ONLY = "1",
        },
      },
    },
  },
}
