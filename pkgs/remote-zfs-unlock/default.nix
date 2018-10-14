{ stdenv, buildGoPackage, fetchgit, fetchhg, fetchbzr, fetchsvn }:

buildGoPackage rec {
  name = "remote-zfs-unlock-${version}";
  version = "2018-10-13";
  rev = "6d9266b50076342b4460d322430ee44ae078f474";

  goPackagePath = "github.com/samuelhug/remote-zfs-unlock";

  src = fetchgit {
    inherit rev;
    url = "https://github.com/samuelhug/remote-zfs-unlock.git";
    sha256 = "1wpz8sr07cpsc5h9qwrhfnylw2xs172rs6x3virwlpnag4dqzp4g";
  };

  CGO_LDFLAGS_ALLOW="-std=c\\+\\+11";

  # TODO: add metadata https://nixos.org/nixpkgs/manual/#sec-standard-meta-attributes
  meta = {
  };
}
