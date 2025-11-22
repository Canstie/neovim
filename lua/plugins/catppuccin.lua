return {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {},
    config = function (_,opts)
        require("catppuccin").setup(opts)
        --vim.cmd("colorscheme catppuccin")
    end
}
