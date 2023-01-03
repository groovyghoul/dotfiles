require'nvim-treesitter.configs'.setup {
    ensure_installed = { "c_sharp" },
    ignore_installed = { "html" },
    sync_install = false,

    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
}

require 'nvim-treesitter.install'.prefer_git = false

-- try clang first (probably Windows) and fall back to gcc (WSL and Linux)
if (vim.loop.os_uname().sysname == "Linux") then
  require 'nvim-treesitter.install'.compilers = { "gcc" }
else
  require 'nvim-treesitter.install'.compilers = { "gcc", "clang" }
end
