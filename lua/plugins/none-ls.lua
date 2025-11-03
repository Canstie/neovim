-- 放在 lua/plugins/none-ls.lua
return {
    "nvimtools/none-ls.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "mason-org/mason.nvim", -- 需要 mason 来安装工具
    },
    event = "VeryLazy",
    config = function()
        local registry = require("mason-registry")

        -- 自动安装 none-ls 需要的工具
        local function install(name)
            local success, package = pcall(registry.get_package, name)
            if success and not package:is_installed() then
                package:install()
            end
        end

        -- ######### 你需要安装的工具 #########
        install("stylua")    -- 你之前有的 Lua 格式化
        install("goimports") -- 【新增】Go 格式化工具
        -- ####################################

        local null_ls = require("null-ls")
        null_ls.setup({
            sources = {
                -- Lua
                null_ls.builtins.formatting.stylua,

                -- 【新增】Go 格式化
                null_ls.builtins.formatting.goimports,

            },
        })
    end,
    keys = {
        {
            "<leader>lf",
            function()
                vim.lsp.buf.format({
                    filter = function(client)
                        -- 只使用 null-ls 进行格式化
                        return client.name == "null-ls"
                    end,
                })
            end,
            desc = "Format buffer (null-ls)",
        },
    },
}