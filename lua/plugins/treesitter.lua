return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    configure =function ()
        require 'nvim-treesitter.install'.compilers = { vim.fn.getenv("CC"), "gcc, clang" }

        require'nvim-treesitter.configs'.setup {
            ensure_installed = {"c","cpp","rust", "lua", "vim", "vimdoc", "query" },
            sync_install = false,
            auto_install = true,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
        }
    end
}
