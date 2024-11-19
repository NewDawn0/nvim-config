# _   _ ____        _   _       _
# | \ | |  _ \      | \ | |_   _(_)_ __ ___
# |  \| | | | |_____|  \| \ \ / / | '_ ` _ \
# | |\  | |_| |_____| |\  |\ V /| | | | | | |
# |_| \_|____/      |_| \_| \_/ |_|_| |_| |_|
# Copyright: 2024 NewDawn0
#
# Author: NewDawn0 (https://github.com/NewDawn0)

{ pkgs, unstable, opts }:
with pkgs;

# Generic packages
[
  coreutils
  curl
  fd
  fzf
  jq
  lldb
  tmux
  nodePackages.nodemon
  ripgrep
  wget
]
# Languages, tools, lsps, linters & daps:
# Generic:
++ [
  nodePackages.diagnostic-languageserver
  typos-lsp
  write-good
]
# Language specific:
++ (if opts.langs.all.enabled || opts.langs.arduino.enabled then
  [ arduino-language-server ]
else
  [ ])

++ (if opts.langs.all.enabled || opts.langs.assembly.enabled then [
  asm-lsp
  asmfmt
  nasm
] else
  [ ])

++ (if opts.langs.all.enabled || opts.langs.awk.enabled then
  [ awk-language-server ]
else
  [ ])

++ (if opts.langs.all.enabled || opts.langs.shell.enabled then [
  beautysh
  nodePackages.bash-language-server
  shellcheck
  shellharden
] else
  [ ])

++ (if opts.langs.all.enabled || opts.langs.cpp.enabled then [
  ccls
  clang-tools
  gcc
  gnumake
  libcxxStdenv
] else
  [ ])

++ (if opts.langs.all.enabled || opts.langs.css.enabled then [
  nodePackages.live-server
  prettierd
  vscode-langservers-extracted
] else
  [ ])

++ (if opts.langs.all.enabled || opts.langs.docker.enabled then [
  docker-compose-language-service
  dockerfile-language-server-nodejs
  hadolint
] else
  [ ])

++ (if opts.langs.all.enabled || opts.langs.fennel.enabled then [
  fennel-ls
  fnlfmt
] else
  [ ])

++ (if opts.langs.all.enabled || opts.langs.fortran.enabled then [
  fortran-language-server
  fprettify
] else
  [ ])

++ (if opts.langs.all.enabled || opts.langs.gleam.enabled then
  [ gleam ]
else
  [ ])

++ (if opts.langs.all.enabled || opts.langs.go.enabled then [
  delve
  golangci-lint
  golangci-lint-langserver
  gopls
] else
  [ ])

++ (if opts.langs.all.enabled || opts.langs.haskell.enabled then [
  haskell-language-server
  hlint
  ormolu
] else
  [ ])

++ (if opts.langs.all.enabled || opts.langs.html.enabled then [
  htmx-lsp
  nodePackages.live-server
  prettierd
  vscode-langservers-extracted
] else
  [ ])

++ (if opts.langs.all.enabled || opts.langs.hydrogen.enabled then [ ] else [ ])

++ (if opts.langs.all.enabled || opts.langs.java.enabled then [
  checkstyle
  google-java-format
  java-language-server
  jdt-language-server
  openjdk
] else
  [ ])

++ (if opts.langs.all.enabled || opts.langs.javascript.enabled then [
  biome
  nodePackages.graphql-language-service-cli
  nodePackages.live-server
  nodePackages.typescript-language-server
  nodejs
  postgres-lsp
  prettierd
  typescript
] else
  [ ])

++ (if opts.langs.all.enabled || opts.langs.json.enabled then [
  nodePackages.jsonlint
  prettierd
  spectral-language-server
  vscode-langservers-extracted
] else
  [ ])

++ (if opts.langs.all.enabled || opts.langs.lua.enabled then [
  lua-language-server
  luaPackages.luacheck
  stylua
] else
  [ ])

++ (if opts.langs.all.enabled || opts.langs.markdown.enabled then [
  markdownlint-cli2
  marksman
  write-good
] else
  [ ])

++ (if opts.langs.all.enabled || opts.langs.matlab.enabled then
  [ matlab-language-server ]
else
  [ ])

++ (if opts.langs.all.enabled || opts.langs.mcfunction.enabled then
  [ spyglassmc-language-server ]
else
  [ ])

++ (if opts.langs.all.enabled || opts.langs.nginx.enabled then
  [ nginx-language-server ]
else
  [ ])

++ (if opts.langs.all.enabled || opts.langs.nix.enabled then [
  nil
  nixd
  nixfmt-classic
] else
  [ ])

++ (if opts.langs.all.enabled || opts.langs.nushell.enabled then
  [ nushell ]
else
  [ ])

++ (if opts.langs.all.enabled || opts.langs.ocaml.enabled then [
  ocamlPackages.ocaml-lsp
  ocamlPackages.ocamlformat
] else
  [ ])

++ (if opts.langs.all.enabled || opts.langs.perl.enabled then [
  perlPackages.PerlTidy
  perlnavigator
] else
  [ ])

++ (if opts.langs.all.enabled || opts.langs.protobuf.enabled then [
  buf
  buf-language-server
  protolint
  protols
] else
  [ ])

++ (if opts.langs.all.enabled || opts.langs.python.enabled then [
  (python3.withPackages (p: with p; [ debugpy pandas pytest requests ]))
  black
  isort
  pylint
  pylyzer
  unstable.basedpyright
] else
  [ ])

++ (if opts.langs.all.enabled || opts.langs.rust.enabled then [
  bacon
  bacon-ls
  rust-analyzer
  rustfmt
] else
  [ ])

++ (if opts.langs.all.enabled || opts.langs.svelte.enabled then
  [ nodePackages.svelte-language-server ]
else
  [ ])

++ (if opts.langs.all.enabled || opts.langs.toml.enabled then
  [ taplo ]
else
  [ ])

++ (if opts.langs.all.enabled || opts.langs.typescript.enabled then [
  biome
  nodePackages.live-server
  nodePackages.typescript-language-server
  nodejs
  postgres-lsp
  prettierd
  typescript
] else
  [ ])

++ (if opts.langs.all.enabled || opts.langs.yaml.enabled then [
  spectral-language-server
  yaml-language-server
  yamlfmt
  yamllint
] else
  [ ])

++ (if opts.langs.all.enabled || opts.langs.zig.enabled then
  [
    zig
    # zls
  ]
else
  [ ])

## FIXME:  TMP ###
++ [ fnlfmt fennel-ls fortran-language-server fprettify java-language-server ]
