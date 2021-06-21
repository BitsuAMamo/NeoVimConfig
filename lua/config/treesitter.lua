require'nvim-treesitter.install'.compilers = { "clang", "gcc" }
require'nvim-treesitter.configs'.setup{
    ensure_installed = {"python", "cpp"},
    highlight = {
        enable = true,
    },
}
