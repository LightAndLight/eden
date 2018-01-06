{ nixpkgs ? import <nixpkgs> {}, compiler ? "ghc821" }:

let

  inherit (nixpkgs) pkgs;

  f = import ./default.nix { inherit nixpkgs compiler; };

in

  f
