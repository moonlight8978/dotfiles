local lspconfig = require("lspconfig")
local utils = require("utils")
local capabilities = require('cmp_nvim_lsp').default_capabilities()

if utils.executable("bash-language-server") then
    lspconfig.bashls.setup {
        capabilities = capabilities
    }
end

if utils.executable("vtsls") then
    lspconfig.vtsls.setup {
        capabilities = capabilities
    }
end
