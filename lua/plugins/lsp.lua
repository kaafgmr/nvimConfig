return {
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        config = function()
            local lsp = require('lsp-zero')

            lsp.on_attach(function(_, bufnr)
                local opts = {buffer = bufnr, remap = false}

                vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
                vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
                vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
                vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
                vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
                vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
                vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
                vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
                vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
                vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
            end)
        end
    },
    {
        'williamboman/mason.nvim',
        config = function()
            require('mason').setup()
        end
    },
    {
        'williamboman/mason-lspconfig.nvim',
        config = function ()
            require('mason-lspconfig').setup({
                ensure_installed = { "lua_ls" },
                handlers = {
                    function(server_name)
                        require('lspconfig')[server_name].setup({})
                    end,
                },
            })
        end
    },
    {
        'neovim/nvim-lspconfig',
        config = function ()
            require'lspconfig'.lua_ls.setup({})
        end
    },
    {
        "L3MON4D3/LuaSnip",
        dependencies = { "rafamadriz/friendly-snippets" },
        config = function()

            require("luasnip.loaders.from_vscode").lazy_load()

            local cmp = require('cmp')
            local cmp_select = {behavior = cmp.SelectBehavior.Select}
            local cmp_mappings = cmp.mapping.preset.insert({
                ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<Tab>'] = cmp.mapping.select_next_item(cmp_select),
                ['<Enter>'] = cmp.mapping.confirm({select = false}),
                ["<C-Space>"] = cmp.mapping.complete()
            })

            cmp.setup({
                sources = {
                    {name = 'path'},
                    {name = 'nvim_lsp'},
                    {name = 'luasnip', keyword_length = 2},
                    {name = 'buffer', keyword_length = 3},
                },
                mapping = cmp_mappings,
                snippet = {
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body)
                    end,
                },
            })
        end
    },
    {
        'hrsh7th/cmp-nvim-lsp'
    },
    {
        'hrsh7th/nvim-cmp'
    },
    {
        'saadparwaiz1/cmp_luasnip'
    }
}
