{ nixpkgs ? import <nixpkgs> {}, compiler ? "ghc821" }:

let

  inherit (nixpkgs) pkgs;

  f = import ./eden.nix;

  haskellPackages = if compiler == "default"
                       then pkgs.haskellPackages
                       else pkgs.haskell.packages.${compiler};

  drv = haskellPackages.callPackage f {};

in

  pkgs.haskell.lib.dontHaddock drv
