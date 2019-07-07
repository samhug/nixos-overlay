{ callPackage, fetchFromGitHub, pkgconfig, buildRustCrateHelpers, defaultCrateOverrides, zeromq }:
with buildRustCrateHelpers;
let
  evcxr-src = fetchFromGitHub {
    owner = "google";
    repo = "evcxr";
    rev = "f375d872bb8560117780e7b9b83e9692e2cebb0e";
    sha256 = "19yaamv10dzgknjpwsilxd0s2hq60qxgjlcwsvvz63cxr6q3mjbh";
  };

  cratesIO = callPackage ./crates-io.nix {};

  _crates = callPackage ./Cargo.nix { inherit cratesIO; };

  evcxr_jupyter = (_crates.evcxr_jupyter {}).override {
    crateOverrides = defaultCrateOverrides // {
      evcxr = attrs: { src = evcxr-src; };
      evcxr_jupyter = attrs: { src = evcxr-src; };
      zmq-sys = attrs: { buildInputs = [ zeromq pkgconfig ]; };
    };
  };
in
  evcxr_jupyter
