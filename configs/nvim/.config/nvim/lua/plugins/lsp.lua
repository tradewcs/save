return {
  {
    "williamboman/mason.nvim",
    config = function() require("mason").setup() end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "neovim/nvim-lspconfig" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "ruff" },
      })

      local caps = require("cmp_nvim_lsp").default_capabilities()

      vim.lsp.config("pyright", { capabilities = caps })
      vim.lsp.config("ruff", { capabilities = caps })

      vim.lsp.enable({ "pyright", "ruff" })
    end,
  },
}
