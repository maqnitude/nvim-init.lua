# ~/.config/nvim
For tracking & managing neovim configurations.

I use [lazy.nvim](https://github.com/folke/lazy.nvim) as the plugin manager, [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) for [configurations](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md) of the Neovim's LSP client (see `:h lsp`). Installing LSP servers manually can be very infuriating, so I use [mason.nvim](https://github.com/williamboman/mason.nvim) to install and manage them as well as its extension [mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim) to fix the inconsistent server naming (e.g. `lua-language-server` in mason and `lua_ls` in lspconfig).

References:
- [LazyVim](https://github.com/LazyVim/LazyVim)
- [NvChad](https://github.com/NvChad/NvChad)
- [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim)
