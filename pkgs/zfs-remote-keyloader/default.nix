{ pkgs ? import ./nix/pkgs.nix {} }:

pkgs.naersk.buildPackage rec {
  name = "zfs-remote-keyloader-${version}";
  version = "0.1.0";

  src = pkgs.fetchFromGitHub {
    owner = "samhug";
    repo = "zfs-remote-keyloader";
    rev = "52ddbfe8617a16fbf4485f626c0dafe9cb89d07a";
    sha256 = "08jqgpknq0rld5i9rx2nypk479803bq2jlcl7a0cbyspkgbx252b";
  };
}
