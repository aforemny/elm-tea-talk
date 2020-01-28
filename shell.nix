{ pkgs ? import <nixpkgs> {} }:
with pkgs;
with stdenv;
mkDerivation {
  name = "elm-tea-talk";
  buildInputs = [ nodejs ];
  shellHook = ''
    export PATH=./node_modules/.bin:$PATH
  '';
}
