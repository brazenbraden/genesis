local lsp = require('lsp-zero').preset({})
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr})

  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
end)

require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())
-- TODO: Figure out how to get ruby lsp and completion working
-- require('lspconfig').ruby_ls.setup()

lsp.setup()

cmp.setup({
  mapping = {
    ['<Tab>'] = cmp.mapping.confirm({select = true}),

    -- Ctrl+Space to trigger completion menu
    ['<C-Space>'] = cmp.mapping.complete(),
  }
})
