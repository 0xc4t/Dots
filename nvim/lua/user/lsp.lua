local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- C++
lspconfig.clangd.setup({
  capabilities = capabilities,
  cmd = { "clangd", "--query-driver=/usr/bin/x86_64-w64-mingw32-g++" },
  init_options = { compilationDatabasePath = "./" },
})

-- Lua
lspconfig.lua_ls.setup({ capabilities = capabilities })

-- Python
lspconfig.pyright.setup({ capabilities = capabilities })
