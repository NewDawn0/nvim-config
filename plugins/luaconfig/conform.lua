require("conform").setup {
    formatters_by_ft = {
        asm = {"asmfmt"},
        c = {"clang-format"},
        cpp = {"clang-format"},
        css = {"prettierd"},
        fortran = {"fprettify"},
        gleam = {"gleam"},
        go = {"gofmt"},
        haskell = {"fourmolu"},
        html = {"prettierd"},
        java = {"google-java-format"},
        javascript = {"prettierd"},
        javascriptreact = {"prettierd"},
        json = {"prettierd"},
        kotlin = {"ktfmt"},
        lua = {"stylua"},
        markdown = {"prettierd"},
        matlab = {"clang-format"}, -- Objective-C detected as matlab
        nix = {"nixfmt"},
        proto = {"buf"},
        python = {"black"},
        rust = {"rustfmt"},
        scss = {"prettierd"},
        sh = {"shfmt", "shellharden"},
        -- swift = { "swift-format" },
        toml = {"taplo"},
        typescript = {"prettierd"},
        vue = {"prettierd"},
        vue = {"prettierd"},
        yaml = {"prettierd"},
        zig = {"zig"},
        zsh = {"shfmt", "shellharden"}
    },
    format_on_save = {timeout_ms = 500, lsp_fallback = true},
    formatters = {
        gleam = {prepend_args = {"format"}},
        proto = {prepend_args = {"format"}},
        taplo = {prepend_args = {"format"}},
        zig = {prepend_args = {"fmt"}}
    }
}
