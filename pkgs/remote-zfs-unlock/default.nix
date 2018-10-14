{ stdenv, buildGoPackage, fetchgit, fetchhg, fetchbzr, fetchsvn }:

buildGoPackage rec {
  name = "remote-zfs-unlock-${version}";
  version = "v0.1.0";
  rev = "v0.1.0";

  goPackagePath = "github.com/samuelhug/remote-zfs-unlock";

  src = fetchgit {
    inherit rev;
    url = "https://github.com/samuelhug/remote-zfs-unlock.git";
    sha256 = "1mb7f7xrkxsmq9rlay30k2354dm7prspi2490bkf623k3pnxi5qg";
  };

  CGO_LDFLAGS_ALLOW="-std=c\\+\\+11";

  # TODO: add metadata https://nixos.org/nixpkgs/manual/#sec-standard-meta-attributes
  meta = {
  };
}
