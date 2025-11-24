-- 放在 lua/plugins/none-ls.lua
return {
    "nvimtools/none-ls.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "mason-org/mason.nvim",
        -- 【新增】专门用来自动安装工具的插件，比手写 function 更稳
        "whoissethdaniel/mason-tool-installer.nvim",
    },
    event = "VeryLazy",
    config = function()
        -- 1. 先配置 mason-tool-installer 负责安装
        require("mason-tool-installer").setup({
            ensure_installed = {
                "stylua",
                "goimports", -- 这里声明，它会自动帮你装
                "black",
                "prettierd",
                "clang-format",
            },
            auto_update = true,
            run_on_start = true,
        })

        -- 2. 再配置 null-ls
        local null_ls = require("null-ls")
        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.stylua,
                null_ls.builtins.formatting.black,
                null_ls.builtins.formatting.prettierd,
                null_ls.builtins.formatting.goimports,
                null_ls.builtins.formatting.clang_format,
            },
        })
    end,
    keys = {
        {
            "<leader>lf",
            function()
                vim.lsp.buf.format({ async = true })
            end,
            desc = "Format buffer (null-ls)",
        },
    },
}
