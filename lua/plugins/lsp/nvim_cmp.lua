return {
    {
        "hrsh7th/nvim-cmp",
        event = { "InsertEnter", "CmdlineEnter" },
        dependencies = {
            -- Sources for nvim-cmp
            {
                "hrsh7th/cmp-nvim-lsp",
                lazy = true,
                config = function()
                    local capabilities = require("cmp_nvim_lsp").default_capabilities()

                    vim.lsp.config("*", {
                        capabilities = capabilities
                    })
                end
            },

            -- Snippet engine
            {
                "L3MON4D3/LuaSnip",
                lazy = true,
                dependencies = {
                    { "rafamadriz/friendly-snippets" }
                },
                config = function()
                    require("luasnip.loaders.from_vscode").lazy_load()
                end
            },

            { "saadparwaiz1/cmp_luasnip", lazy = true },
        },
        config = function()
            local cmp = require("cmp")
            local luasnip = require("luasnip")
            local winhighlight = {
                winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel",
            }

            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                window = {
                    completion = cmp.config.window.bordered(winhighlight),
                    documentation = cmp.config.window.bordered(winhighlight),
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-n>"] = cmp.mapping.select_next_item(),
                    ["<C-p>"] = cmp.mapping.select_prev_item(),
                    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete {},
                    ["<CR>"] = cmp.mapping.confirm {
                        behavior = cmp.ConfirmBehavior.Replace,
                        select = true,
                    },
                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif luasnip.expand_or_locally_jumpable() then
                            luasnip.expand_or_jump()
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                    ["<S-Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.locally_jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                })
            })
        end
    }
}
