{ lib, rustPlatform, fetchFromGitHub }:

rustPlatform.buildRustPackage {
  pname = "zfs-remote-keyloader";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "samhug";
    repo = "zfs-remote-keyloader";
    rev = "5d5f543895374bb8efdea6b2f6f2bc9e431e050f";
    sha256 = "0qjmyvpdhnd3q7piylwpynhrinyvyln2vyc4cdxssvcdm6qn4nxk";
  };

  cargoSha256 = "1is8972qj7ynpl2phpads9qmiifp0dsy870b8pc89bl2hy1il1ai";
}
