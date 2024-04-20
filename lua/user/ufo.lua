-- local ftMap = {
--     vim = 'indent',
--     python = {'indent'},
--     git = ''
-- }
-- require('ufo').setup({
--     -- open_fold_hl_timeout = 1000000;
--     -- close_fold_kinds = {'imports', 'comment'},
--     -- preview = {
--     --     win_config = {
--     --         border = {'+', '─', '+', '+', '+', '─', '+', '+'},
--     --         winhighlight = 'Normal:Folded',
--     --         winblend = 0
--     --     },
--     --     mappings = {
--     --         scrollU = '<C-u>',
--     --         scrollD = '<C-d>',
--     --         jumpTop = '[',
--     --         jumpBot = ']'
--     --     }
--     -- },
--     -- provider_selector = function(bufnr, filetype, buftype)
--     --     -- if you prefer treesitter provider rather than lsp,
--     --     -- return ftMap[filetype] or {'treesitter', 'indent'}
--     --     return ftMap[filetype]
--     --
--     --     -- refer to ./doc/example.lua for detail
--     -- end
-- })
-- vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
-- vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
-- vim.keymap.set('n', 'zr', require('ufo').openFoldsExceptKinds)
-- vim.keymap.set('n', 'zm', require('ufo').closeFoldsWith) -- closeAllFolds == closeFoldsWith(0)
-- vim.keymap.set('n', 'L', function()
--     local winid = require('ufo').peekFoldedLinesUnderCursor()
--     if not winid then
--         -- choose one of coc.nvim and nvim lsp
--         vim.fn.CocActionAsync('definitionHover') -- coc.nvim
--         vim.lsp.buf.hover()
--     end
-- end)
vim.o.foldcolumn = '1' -- '0' is not bad
vim.o.foldlevel = 1 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true

local status_ok, ufo = pcall(require, "ufo")
if not status_ok then
    return
end

ufo.setup {}
vim.keymap.set('n', '<leader>z', require('ufo').openAllFolds)
vim.keymap.set('n', '<leader>m', require('ufo').closeAllFolds)
vim.keymap.set('n', 'L', function()
    local winid = require('ufo').peekFoldedLinesUnderCursor()
    if not winid then
        -- choose one of coc.nvim and nvim lsp
        vim.fn.CocActionAsync('definitionHover') -- coc.nvim
        vim.lsp.buf.hover()
    end
end)
