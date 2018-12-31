{ stdenv, buildGoPackage, fetchgit }:

buildGoPackage rec {
  name = "gobgp-${version}";
  version = "${rev}";
  rev = "v2.0.0";

  goPackagePath = "github.com/osrg/gobgp";

  src = fetchgit {
    inherit rev;
    url = "https://github.com/osrg/gobgp.git";
    sha256 = "1bc0hxy8cl94j4685a7idrir7kv16fywyhyybl71lf5p3mj8f5ll";
  };

  goDeps = ./deps.nix;

  # don't incude the config example
  preInstall = ''
    rm $NIX_BUILD_TOP/go/bin/config
  '';

  meta = with stdenv.lib; {
    description = "BGP implemented in the Go Programming Language";
    homepage = https://github.com/osrg/gobgp;
    license = licenses.asl20;
  };
}
