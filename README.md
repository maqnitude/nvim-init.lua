# ~/.config/nvim
For tracking & managing my Neovim configurations.

### Plugins
- Plugin manager: [`lazy.nvim`](https://github.com/folke/lazy.nvim).

- LSP:
  - [`nvim-lspconfig`](https://github.com/neovim/nvim-lspconfig) for [configurations](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md) of the Neovim's LSP client (see `:h lsp`).
  - [`mason.nvim`](https://github.com/williamboman/mason.nvim) for installing and managing LSP servers.
  - [`mason-lspconfig.nvim`](https://github.com/williamboman/mason-lspconfig.nvim) recommended for use with `nvim-lspconfig`.
 
- Autocompletion: [`nvim-cmp`](https://github.com/hrsh7th/nvim-cmp).
  - Snippet engine: [`LuaSnip`](https://github.com/L3MON4D3/LuaSnip).
  - Completion sources:
    - LSP: [`cmp-nvim-lsp`](https://github.com/hrsh7th/cmp-nvim-lsp).
    - LuaSnip: [`cmp_luasnip`](https://github.com/saadparwaiz1/cmp_luasnip).

- Syntax highlighting: [`nvim-treesitter`](https://github.com/nvim-treesitter/nvim-treesitter).

- Autopairing parentheses & brackets: [`nvim-autopairs`](https://github.com/windwp/nvim-autopairs).

- Commenting (with `gcc`, `gbc`, etc.): [`Comment.nvim`](https://github.com/numToStr/Comment.nvim).

- Fuzzy finder: [`telescope.nvim`](https://github.com/nvim-telescope/telescope.nvim).

- Others:
  - Colorscheme: [`vim-moonfly-colors`](https://github.com/bluz71/vim-moonfly-colors).
  - Statusline: [`lualine.nvim`](https://github.com/nvim-lualine/lualine.nvim).

### References
- [LazyVim](https://github.com/LazyVim/LazyVim)
- [NvChad](https://github.com/NvChad/NvChad)
- [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim)
