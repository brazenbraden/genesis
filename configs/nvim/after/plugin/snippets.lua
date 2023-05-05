require("snippy").setup({
  scopes = {
    ruby = { "_" }
  },
  mappings = {
    is = {
      ['<Tab>'] = 'expand_or_advance',
      ["<S-Tab>"] = "previous",
    }
  }
})
