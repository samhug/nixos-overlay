{ pkgs ? import <nixpkgs> {} }: with pkgs;

let
  overlays = stdenv.mkDerivation {
    name = "nixpkgs-overlays";
    buildCommand = "mkdir -p $out && ln -s ${toString ./.}/pkgs $_";
  };
in

stdenvNoCC.mkDerivation {
  name = "nixos-overlay";

  NIX_PATH = builtins.concatStringsSep ":" [
    "nixpkgs=${toString pkgs.path}"
    "nixpkgs-overlays=${overlays}"
  ];
}
