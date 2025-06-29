return {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
        'L3MON4D3/LuaSnip',
        'saadparwaiz1/cmp_luasnip',
        'hrsh7th/cmp-nvim-lsp',
        'rafamadriz/friendly-snippets',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
    },
    config = function()
        local cmp = require('cmp')
        local luasnip = require('luasnip')
        require('luasnip.loaders.from_vscode').lazy_load()
        luasnip.config.setup({})

        vim.o.completeopt = "menu,menuone,noselect"

        cmp.setup({
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            mapping = {
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<Tab>'] = cmp.mapping(function(fallback)
                    if luasnip.expand_or_jumpable() then
                        luasnip.expand_or_jump()  -- Mergi la următorul câmp al snippet-ului
                    elseif cmp.visible() then
                        cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })  -- Mergi la următoarea sugestie
                    else
                        fallback()
                    end
                end, { 'i', 's' }),
                ['<S-Tab>'] = cmp.mapping(function(fallback)
                    if luasnip.jumpable(-1) then
                        luasnip.jump(-1)  -- Mergi la câmpul anterior al snippet-ului
                    elseif cmp.visible() then
                        cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })  -- Mergi la sugestia anterioară
                    else
                        fallback()
                    end
                end, { 'i', 's' }),
                ['<Down>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
                ['<Up>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
                ['<CR>'] = cmp.mapping(function(fallback)
                    if cmp.visible() and cmp.get_selected_entry() then
                        cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
                    else
                        fallback()  -- Dacă nu există completări, face un newline
                    end
                end, { 'i', 's' }),
            },

            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "luasnip" },
                { name = "buffer" },
                { name = "path" },
            }),
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
        })
    end,
}

