{ buildGoPackage, fetchzip }:

buildGoPackage rec {
  name = "ndm-${rev}";
  rev = "master";

  goPackagePath = "github.com/samuelhug/ndm";

  src = fetchzip {
    url = "https://${goPackagePath}/archive/${rev}.tar.gz";
    sha256 = "1f1zrnxdi9k332vx8jz1d9iprqwjk3h8rj098i3w2lxqq4y9662p";
  };
}
