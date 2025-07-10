local lspconfig = require('lspconfig')

-- Configurare Bash Language Server
lspconfig.bashls.setup {
  cmd = { "bash-language-server", "start" },
  filetypes = { "sh", "bash" },
  settings = {
    bashIde = {
      globPattern = "*@(.sh|.inc|.bash|.command)",
      diagnosticsEnabled = true, -- Activează diagnostice!
    }
  },
  flags = {
    debounce_text_changes = 150,
  }
}
