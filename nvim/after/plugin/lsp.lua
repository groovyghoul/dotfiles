vim.opt.completeopt = { "menu", "menuone", "noselect" }

local cmp = require 'cmp'
cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        end,
    },

    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' }, -- For luasnip users.
    }, {
        { name = 'buffer' },
    })
})

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

local on_attach = function(client, bufnr)
    -- Mappings
    local opts = { noremap = true, silent = true }

    -- show help in a floating window
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = 0, desc = "LSP,debugging - show help" })

    -- go to definition
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = 0, desc = "LSP,debugging - goto definition" })

    -- go to type definition
    vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, { buffer = 0, desc = "LSP,debugging - goto type definition" })

    -- go to implementation
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { buffer = 0, desc = "LSP,debugging - goto implementation)" })

    -- diagnostic next
    vim.keymap.set('n', '<leader>dj', vim.diagnostic.goto_next, { buffer = 0 })

    -- diagnostic previous
    vim.keymap.set('n', '<leader>dk', vim.diagnostic.goto_prev, { buffer = 0 })

    -- diagnostic list (with telescope)
    vim.keymap.set('n', '<leader>dl', '<cmd>Telescope diagnostics<cr>', { buffer = 0, desc = "LSP,debugging - diagnostic list (Telescope)" })

    -- rename symbol
    vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, { buffer = 0, desc = "LSP,debugging - rename symbol" })

    -- suggestions
    vim.keymap.set('n', '<leader>s', vim.lsp.buf.code_action, { buffer = 0, desc = "LSP,debugging - open code actions" })
    --[[ vim.keymap.set('n', '<leader>s', vim.lsp.buf.code_action, { buffer = 0 }) ]]

    -- format
    vim.keymap.set('n', '<M-f>', vim.lsp.buf.format, { buffer = 0, desc = "LSP,debugging - format code" })
end

-- golang
require("lspconfig").gopls.setup({
    on_attach = on_attach,
    capabilities = capabilities
})

-- lua
require("lspconfig").sumneko_lua.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' },
            }
        }
    }
})

-- rust
require("lspconfig").rust_analyzer.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = { "rustup", "run", "stable", "rust-analyzer" },
})

-- c#
local pid = vim.fn.getpid()

local omnisharp_bin = "C:/Users/richard/AppData/Local/nvim-data/mason/packages/omnisharp/OmniSharp.dll"

require("lspconfig").omnisharp.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = { "dotnet", omnisharp_bin, "--languageserver", "--hostPID", tostring(pid) }
})

-- JS/TS
require("lspconfig").tsserver.setup({
    on_attach = on_attach,
    capabilities = capabilities
})

-- Vue
require("lspconfig").volar.setup({
    on_attach = on_attach,
    capabilities = capabilities
})
