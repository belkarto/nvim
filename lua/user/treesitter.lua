local configs = require("nvim-treesitter.configs")
configs.setup {
    ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "cpp" },
    sync_install = false,
    auto_install = true,
    ignore_install = { "" }, -- List of parsers to ignore installing
    autopairs = {
        enable = true,
    },
    highlight = {
        enable = true,    -- false will disable the whole extension
        disable = { "" }, -- list of language that will be disabled
        additional_vim_regex_highlighting = true,

    },
    indent = { enable = true, disable = { "yaml" } },
    rainbow = {
        enable = true,
        extanded_mode = true,
        max_file_lines = nil,
    },
    context_commentstring = {
        enable = true,
        enable_autocmd = true,
    }
}
