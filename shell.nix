{ pkgs ? import <unstable> {} }:

let
  shellname = "www";
  myRust = with pkgs; [ elixir elmPackages.elm ];
in
  pkgs.stdenv.mkDerivation {
    name = shellname;
    buildInputs = [ myRust ];
    RUST_BACKTRACE = 1;
    shellHook = ''
      export NIX_SHELL_NAME='${shellname}'
      alias mb='mix build'
      alias mf='mix fmt'
      alias mr='mix run'
      alias mt='mix test'
    '';
  }
