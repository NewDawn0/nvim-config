# _   _ ____        _   _       _
# | \ | |  _ \      | \ | |_   _(_)_ __ ___
# |  \| | | | |_____|  \| \ \ / / | '_ ` _ \
# | |\  | |_| |_____| |\  |\ V /| | | | | | |
# |_| \_|____/      |_| \_| \_/ |_|_| |_| |_|
# Copyright: 2024 NewDawn0
#
# Author: NewDawn0 (https://github.com/NewDawn0)

{ pkgs, opts }:
let
  inherit (builtins)
    isBool mapAttrs readFile replaceStrings stringLength substring toJSON
    toString;
  ndnvimRtp = pkgs.stdenv.mkDerivation {
    name = "ndnvim-rtp";
    src = ../nvim;
    buildPhase = ''
      mkdir -p $out/nvim
      mkdir -p $out/lua
      rm init.lua
    '';
    installPhase = ''
      cp -r lua $out/lua
      rm -r lua
      cp -r $out/lua $out/nvim
    '';
  };
  getAttrsRec = attrs:
    mapAttrs
    (k: v: if isBool v then if v then "true" else "false" else getAttrsRec v)
    attrs;
  luaOpts = let
    string = replaceStrings [ ''"'' ":" ] [ "" "=" ]
      (toString (toJSON (getAttrsRec opts)));
  in substring 1 ((stringLength string) - 2) string;
in pkgs.neovim.override {
  configure = {
    packages.all.start = (import ./plugins.nix { inherit pkgs; })
      ++ (with pkgs.vimPlugins; [
        cmp-buffer
        cmp-nvim-lsp
        cmp-nvim-lua
        cmp-path
        cmp_luasnip
        codeium-nvim
        lspkind-nvim
        luasnip
        nvim-cmp
        nvim-lspconfig
      ]);
    customRC = ''
      lua <<EOF
      -- Startup optimisations
      vim.loader.enable()
      vim.opt.rtp:prepend('${ndnvimRtp}/lua')
    '' + ''
      vim.g.ndnvim = {
        ${luaOpts}
      }
    '' + (readFile ../nvim/init.lua) + ''
      vim.opt.rtp:prepend('${ndnvimRtp}/nvim')
      EOF
    '';
    extraMakeWrapperArgs = " "
      + ''--set LIBSQLITE_CLIB_PATH "${pkgs.sqlite.out}/lib/libsqlite3.so"''
      + " " + ''--set LIBSQLITE "${pkgs.sqlite.out}/lib/libsqlite3.so"'';
  };
}
