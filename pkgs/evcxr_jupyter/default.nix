{ lib, fetchgit, buildPlatform, buildRustCrate, buildRustCrateHelpers
, defaultCrateOverrides, zeromq, pkgconfig }:


let

  evcxr-src = fetchgit {
    url = git://github.com/google/evcxr;
    rev = "v0.4.3";
    sha256 = "08zsdl6pkg6dx7k0ns8cd070v7ydsxkscd2ms8wh9r68c08vwzcp";
  };

in

((import ./Cargo.nix {
  inherit lib buildPlatform buildRustCrate buildRustCrateHelpers fetchgit;
  cratesIO = import ./crates-io.nix { inherit lib buildRustCrate buildRustCrateHelpers; };
}).evcxr_jupyter {}).override {
  crateOverrides = defaultCrateOverrides // {
    evcxr = attrs: { src = evcxr-src; };
    evcxr_jupyter = attrs: { src = evcxr-src; };
    zmq-sys = attrs: { buildInputs = [ zeromq pkgconfig ]; };
  };
}
