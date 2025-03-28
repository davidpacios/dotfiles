require("davidpacios.core.options")
require("davidpacios.core.keymaps")
require("davidpacios.plugins-setup")
require("davidpacios.core.colorscheme")
require("davidpacios.plugins.comment")
require("davidpacios.plugins.nvim-tree")
require("davidpacios.plugins.lualine")
require("davidpacios.plugins.telescope")
require("davidpacios.plugins.nvim-cmp")
require("davidpacios.plugins.lsp.mason")
require("davidpacios.plugins.lsp.lspsaga")
require("davidpacios.plugins.lsp.lspconfig")
require("davidpacios.plugins.lsp.null-ls")
require("davidpacios.plugins.autopairs")
require("davidpacios.plugins.treesitter")
require("davidpacios.plugins.gitsigns")

-- Configurar transparencia estableciendo el fondo de ciertos grupos de resaltado a 'none'
vim.cmd("highlight Normal guibg=none ctermbg=none")
vim.cmd("highlight NormalNC guibg=none ctermbg=none")
vim.cmd("highlight SignColumn guibg=none ctermbg=none")
vim.cmd("highlight VertSplit guibg=none ctermbg=none")
vim.cmd("highlight EndOfBuffer guibg=none ctermbg=none")
vim.cmd("highlight LineNr guibg=none ctermbg=none")
vim.cmd("highlight CursorLine guibg=none ctermbg=none")
vim.cmd("highlight Pmenu guibg=none ctermbg=none")
vim.cmd("highlight PmenuSel guibg=none ctermbg=none")
vim.cmd("highlight StatusLine guibg=none ctermbg=none")