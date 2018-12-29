# This file was generated by https://github.com/kamilchm/go2nix v1.3.0
{ stdenv, buildGoPackage, fetchgit, fetchhg, fetchbzr, fetchsvn }:

buildGoPackage rec {
  name = "zfs-remote-keyloader-${version}";
  version = "2018-12-29";
  rev = "e7a2c054e11d1af9a4e21f94d3417cb4ef42eedf";

  goPackagePath = "github.com/samuelhug/zfs-remote-keyloader";

  buildInputs = [ stdenv.glibc.static ];
  CGO_ENABLED=0;
  buildFlags = "-ldflags -s -ldflags -w -ldflags -linkmode=external -ldflags -extldflags=-static";

  src = fetchgit {
    inherit rev;
    url = "https://github.com/samuelhug/zfs-remote-keyloader.git";
    sha256 = "1a6ldgscb1smwcn2rbzrdwlvj8nccrdmj6x31gas8chrp47vjdsv";
  };

  goDeps = ./deps.nix;

  # TODO: add metadata https://nixos.org/nixpkgs/manual/#sec-standard-meta-attributes
  meta = {
  };
}
