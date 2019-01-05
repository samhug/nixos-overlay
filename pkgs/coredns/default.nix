{ stdenv, buildGoPackage, fetchFromGitHub }:

buildGoPackage rec {
  name = "coredns-${version}";
  version = "1.3.0";

  goPackagePath = "github.com/coredns/coredns";

  src = fetchFromGitHub {
    owner = "coredns";
    repo = "coredns";
    rev = "v${version}";
    sha256 = "0jib93k555d6jg0vh7ylikd4p9a8rj780z51qha7lmxhblrk36f4";
  };

  goDeps = ./deps.nix;

  preBuild = ''(
    cd go/src/${goPackagePath}
    go generate coredns.go
  )'';

  meta = with stdenv.lib; {
    homepage = https://coredns.io;
    description = "A DNS server that runs middleware";
    license = licenses.asl20;
    maintainers = [ maintainers.rushmorem maintainers.rtreffer ];
  };
}
