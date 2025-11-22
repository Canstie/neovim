return {
    "mason-org/mason.nvim",
    dependencies = {
        "mason-org/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
        "saghen/blink.cmp",
        "nvimtools/none-ls.nvim",
    },
    config = function()
        -- 1. 初始化 Mason
        require("mason").setup()

        -- 2. 准备配置
        local lspconfig = require("lspconfig")
        -- 获取 Blink 的补全能力
        local capabilities = require("blink.cmp").get_lsp_capabilities()

        -- 定义禁用格式化的通用 on_attach
        local on_attach = function(client, bufnr)
            if client.server_capabilities then
                client.server_capabilities.documentFormattingProvider = false
                client.server_capabilities.documentRangeFormattingProvider = false
            end
        end

        -- 3. 定义服务器列表 (键名为 lspconfig 的标准名称)
        local servers = {
            lua_ls = {
                settings = {
                    Lua = {
                        diagnostics = { globals = { "vim" } },
                        format = { enable = false },
                    },
                },
            },
            gopls = {},
            pyright = {},
            html = {},
            cssls = {}, -- 只要装了 npm，这个就能成功
            ts_ls = {}, -- 注意：TypeScript 的新名称通常是 ts_ls
            emmet_ls = {},
            rust_analyzer = {},
            clangd = {},
        }

        -- 4. 配置 mason-lspconfig (Mason v2.0 适配版)
        require("mason-lspconfig").setup({
            -- 确保安装列表中的所有服务器
            ensure_installed = vim.tbl_keys(servers),

            -- ⚠️ 关键：禁用 v2.0 的自动启动功能
            -- 因为我们要手动 setup 以便注入 blink 的 capabilities 和 on_attach
            automatic_installation = false,
            handlers = nil, -- 显式置空以防万一
        })

        -- 5. 手动遍历并启动服务器 (替代旧版的 setup_handlers)
        for name, config in pairs(servers) do
            -- 合并 capabilities 和 on_attach 到配置中
            config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
            config.on_attach = on_attach

            -- 启动服务
            lspconfig[name].setup(config)
        end
    end,
}
