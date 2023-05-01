local lsp = require('lsp-zero').preset({})
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

local servers = { "lua_ls", "ruby_ls" }
require("mason-lspconfig").setup({
  ensure_installed = servers,
})

local on_attach = function(_, bufnr)
  local keymap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  keymap('<leader>hn', vim.lsp.buf.rename, '[R]e[n]ame') -- this isnt working?

  keymap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
  keymap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
  keymap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')

  keymap('<leader>k', vim.lsp.buf.hover, 'Hover Documentation')

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, { desc = 'Format current buffer with LSP' })
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

for _, lsp in ipairs(servers) do
  require("lspconfig")[lsp].setup({
    on_attach = on_attach,
    capabilities = capabilities,
  })
end

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
