# _   _ ____        _   _       _
# | \ | |  _ \      | \ | |_   _(_)_ __ ___
# |  \| | | | |_____|  \| \ \ / / | '_ ` _ \
# | |\  | |_| |_____| |\  |\ V /| | | | | | |
# |_| \_|____/      |_| \_| \_/ |_|_| |_| |_|
# Copyright: 2024 NewDawn0
#
# Author: NewDawn0 (https://github.com/NewDawn0)

{ pkgs }:
let mac-frameworks = pkgs.darwin.apple_sdk.frameworks;
in {
  asm-lsp = pkgs.rustPlatform.buildRustPackage {
    cargoHash = "sha256-MwUI9xJ+vBTc+x2gjWesld9y/PqVnJ1LJpZ6d4URJAE=";
    doCheck = false;
    name = "asm-lsp";
    version = "0.7.3";
    PKG_CONFIG_PATH = "${pkgs.openssl.dev}/lib/pkgconfig";
    nativeBuildInputs = with pkgs; [ openssl pkg-config ];
    buildInputs = with pkgs;
      [ pkg-config openssl ] ++ (if pkgs.stdenv.isDarwin then
        with mac-frameworks; [ SystemConfiguration ]
      else
        [ ]);
    src = builtins.fetchGit {
      ref = "master";
      rev = "615cb1bbf7d42c98bf341a03c27d5241fab0e8f4";
      url = "https://github.com/bergercookie/asm-lsp";
    };
  };
  awk-language-server = pkgs.buildNpmPackage {
    name = "awk-language-server";
    version = "0.4.12";
    src = ./awkls;
    dontNpmBuild = true;
    npmDeps = pkgs.importNpmLock { npmRoot = ./awkls; };
    npmConfigHook = pkgs.importNpmLock.npmConfigHook;
    meta = with pkgs.lib; {
      description = "An awk language server";
      homepage = "https://github.com/Beaglefoot/awk-language-server";
      license = licenses.mit;
    };
  };
  bacon-ls = pkgs.rustPlatform.buildRustPackage {
    cargoHash = "sha256-xst1CZrtEQQl7nZB57TPHHuiSVJCE96R1MvzJEmigho=";
    name = "bacon-ls";
    version = "0.3.0";
    src = builtins.fetchGit {
      ref = "main";
      rev = "e25fd5520e59882b3429db8648518e12be0042db";
      url = "https://github.com/crisidev/bacon-ls";
    };
  };
  cmakelang = pkgs.buildPythonPackage {
    name = "cmakelang";
    version = "0.6.13";
    src = builtins.fetchurl {
      url =
        "https://files.pythonhosted.org/packages/74/c0/75d4806cf21dcb4198e9fba02f4d2fa61c8db919b7db788862d9cd5f4433/cmakelang-0.6.13.tar.gz";
      hash = pkgs.lib.fakeHash;
    };
  };
  mesonls = pkgs.stdenv.mkDerivation {
    name = "mesonls";
    version = "4.3.1";
    src = builtins.fetchGit {
      ref = "main";
      rev = "c9875b6df1bc494ff9f733ad05fe5d9b67d155de";
      url = "https://github.com/JCWasmx86/mesonlsp";
    };
  };
  protols = pkgs.rustPlatform.buildRustPackage {
    cargoHash = "sha256-yKFvaxnU3ZtX1/AXkNhvw5CxPzesooGas6Cc1qFpMrQ=";
    name = "protols";
    version = "0.2.1";
    src = builtins.fetchGit {
      ref = "main";
      rev = "fec7bfb3de4a120ad608c639c50e572bf795751e";
      url = "https://github.com/coder3101/protols";
    };
  };
  spyglassmc-language-server = pkgs.buildNpmPackage {
    name = "spyglassmc-language-server";
    version = "0.4.12";
    src = ./spyglass;
    dontNpmBuild = true;
    npmDeps = pkgs.importNpmLock { npmRoot = ./spyglass; };
    npmConfigHook = pkgs.importNpmLock.npmConfigHook;
    meta = with pkgs.lib; {
      description = "An mcfunction language server";
      homepage = "https://spyglassmc.com";
      license = licenses.mit;
    };
  };
  vimPlugins = pkgs.vimPlugins // {
    bufferline-nvim = pkgs.vimUtils.buildVimPlugin {
      name = "bufferline-nvim";
      src = builtins.fetchGit {
        ref = "main";
        rev = "0b2fd861eee7595015b6561dade52fb060be10c4";
        url = "https://github.com/akinsho/bufferline.nvim";
      };
    };
    codeium-nvim = pkgs.vimUtils.buildVimPlugin {
      name = "codeium-nvim";
      src = builtins.fetchGit {
        ref = "main";
        rev = "d3b88eb3aa1de6da33d325c196b8a41da2bcc825";
        url = "https://github.com/Exafunction/codeium.nvim";
      };
    };
    colorful-winsep-nvim = pkgs.vimUtils.buildVimPlugin {
      name = "colorful-winsep-nvim";
      src = builtins.fetchGit {
        ref = "alpha";
        rev = "72cf292b9b49c371b3d9333d2ff2146b0bceab04";
        url = "https://github.com/nvim-zh/colorful-winsep.nvim";
      };
    };
    gen-nvim = pkgs.vimUtils.buildVimPlugin {
      name = "gen-nvim";
      src = builtins.fetchGit {
        ref = "main";
        rev = "bd19cf584b5b82123de977b44105e855e61e5f39";
        url = "https://github.com/David-Kunz/gen.nvim";
      };
    };
    mini-surround = pkgs.vimUtils.buildVimPlugin {
      name = "mini-surround";
      src = builtins.fetchGit {
        ref = "main";
        rev = "27096c1a27324ee8f2044ea2adc77366d8a782de";
        url = "https://github.com/echasnovski/mini.surround";
      };
    };
    nvim-dap-repl-highlights = pkgs.vimUtils.buildVimPlugin {
      name = "nvim-dap-repl-highlights";
      src = builtins.fetchGit {
        ref = "master";
        rev = "a7512fc0a0de0c0be8d58983939856dda6f72451";
        url = "https://github.com/LiadOz/nvim-dap-repl-highlights";
      };
    };
    vim-mcfunction = pkgs.vimUtils.buildVimPlugin {
      name = "vim-mcfunction";
      src = builtins.fetchGit {
        ref = "master";
        rev = "074aa25dd3128bb9de174e7e7039c3c76bbe5fb4";
        url = "https://github.com/CrystalAlpha358/vim-mcfunction";
      };
    };
  };
}
