local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    "nvim-lua/popup.nvim"    -- An implementation of the Popup API from vim in Neovim
    "nvim-lua/plenary.nvim"  -- Useful lua functions used ny lots of plugins
    "windwp/nvim-autopairs"  -- Autopairs, integrates with both cmp and treesitter
    "numToStr/Comment.nvim"  -- Easily comment stuff
    'JoosepAlviste/nvim-ts-context-commentstring'

    -- colorscheme and appearnce
    'folke/tokyonight.nvim'
    'oxfist/night-owl.nvim'
    'xiyaowong/transparent.nvim'
    'folke/twilight.nvim' -- toggle focus on chunk of code
    'nvim-lualine/lualine.nvim'
    'ellisonleao/gruvbox.nvim'
    'Skullamortis/forest.nvim'
    'zSnails/cityscape.nvim'
    {
        'RRethy/vim-hexokinase',
        run = 'make hexokinase'
    }



    --LSP
     'jose-elias-alvarez/null-ls.nvim'   -- LSP diagnostics and code actions
     {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            --- Uncomment these if you want to manage LSP servers from neovim
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- LSP Support
            { 'neovim/nvim-lspconfig' },

            -- Autocompletion
            -- cmp plugins
            { "hrsh7th/nvim-cmp" },         -- The completion plugin
            { "hrsh7th/cmp-buffer" },       -- buffer completions
            { "hrsh7th/cmp-path" },         -- path completions
            { "hrsh7th/cmp-cmdline" },      -- cmdline completions
            { "saadparwaiz1/cmp_luasnip" }, -- snippet completions
            { "hrsh7th/cmp-nvim-lsp" },
            { "hrsh7th/cmp-nvim-lua" },

            -- snippets
            { "L3MON4D3/LuaSnip" },             --snippet engine
            { "rafamadriz/friendly-snippets" }, -- a bunch of snippets to use
        }
    }
    -- Telescope
    "nvim-telescope/telescope.nvim"
    'nvim-telescope/telescope-media-files.nvim'

    -- Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
    }
    "p00f/nvim-ts-rainbow"
    --use "nvim-treesitter/playground"

    -- Git
    'tpope/vim-fugitive'
    'lewis6991/gitsigns.nvim'

    -- tree file explorer
    {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional, for file icons
        },
    }
    'mbbill/undotree'

    --buffer line in top of window
    {'romgrk/barbar.nvim', wants = 'nvim-web-devicons'}

    -- terminal
    'akinsho/toggleterm.nvim'

    -- horizontal line
    '/lukas-reineke/indent-blankline.nvim'
    {'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async'}

    -- AI plugins
    '/github/copilot.vim'

    -- debuger plugins
    --[[ use 'mfussenegger/nvim-dap' ]]
    -- use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
    -- use 'ldelossa/nvim-dap-projects'
})
