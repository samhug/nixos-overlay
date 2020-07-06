{ lib, rustPlatform, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "zfs-remote-keyloader";
  version = "0.2.1";

  src = fetchFromGitHub {
    owner = "samhug";
    repo = "zfs-remote-keyloader";
    rev = "v${version}";
    sha256 = "1ms3kralazy6gk2gfzfk713h06qcvx4ri2266h88wzhivl3c8q1f";
  };

  cargoSha256 = "1d0l5j9nlm832mglfl64kfl6xhc6ss338z1q2cgk3vw4xhl5k01s";
}
