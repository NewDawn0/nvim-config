# _   _ ____        _   _       _
# | \ | |  _ \      | \ | |_   _(_)_ __ ___
# |  \| | | | |_____|  \| \ \ / / | '_ ` _ \
# | |\  | |_| |_____| |\  |\ V /| | | | | | |
# |_| \_|____/      |_| \_| \_/ |_|_| |_| |_|
# Copyright: 2024 NewDawn0
#
# Author: NewDawn0 (https://github.com/NewDawn0)

{
  description = "NewDawn0's NeoVim config";

  inputs = {
    nix-systems.url = "github:nix-systems/default";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs.url = "github:nixos/nixpkgs";
    treesitter-pinned = {
      url = "github:NewDawn0/treesitterPinnedNdnvim";
      inputs.nix-systems.follows = "nix-systems";
    };
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, ... }@inputs:
    let
      defaultOpts = import ./nix/opts.nix;
      eachSystem = nixpkgs.lib.genAttrs (import inputs.nix-systems);
      mkPkgs = system: {
        unstable = nixpkgs-unstable.legacyPackages.${system};
        pkgs = import nixpkgs {
          inherit system;
          config = { allowUnfree = true; };
          overlays = [
            (final: prev: (import ./nix/overlays { pkgs = prev; }))
            inputs.treesitter-pinned.overlays.default
          ];
        };
      };
    in {
      overlays.default = final: prev: {
        ndnvim = self.packages.${prev.system}.default;
      };
      packages = eachSystem (system:
        let
          inherit (mkPkgs system) pkgs unstable;
          inherit (pkgs) callPackage writeShellApplication;
          inherit (pkgs.lib) makeOverridable recursiveUpdate;
          ndnvimOverridable = userOpts:
            let
              opts = recursiveUpdate defaultOpts userOpts;
              nvimApp = let
                ndnvim = callPackage ./nix/ndnvim.nix { inherit pkgs opts; };
              in writeShellApplication {
                name = "nvim";
                runtimeInputs =
                  import ./nix/runtime.nix { inherit pkgs unstable opts; };
                text = ''${ndnvim}/bin/nvim "$@"'';
              };
            in pkgs.stdenv.mkDerivation {
              name = "nvim";
              buildInputs = [ ];
              phases = [ "installPhase" ];
              installPhase = ''
                # Create out dir
                mkdir -p $out/bin

                # Copy out dir
                cp ${nvimApp}/bin/nvim $out/bin/nvim
                # Conditionally enable vi and vim bins
                if [ "${builtins.toString opts.viAlias.enabled}" = 1 ]; then
                  cp ${nvimApp}/bin/nvim $out/bin/vi
                fi
                if [ "${builtins.toString opts.vimAlias.enabled}" = 1 ]; then
                  cp ${nvimApp}/bin/nvim $out/bin/vim
                fi
              '';
            };
        in { default = makeOverridable ndnvimOverridable defaultOpts; });
    };
}
