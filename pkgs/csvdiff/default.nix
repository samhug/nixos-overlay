{ stdenv, buildGoPackage, fetchgit, fetchhg, fetchbzr, fetchsvn }:

buildGoPackage rec {
  name = "csvdiff-v${version}";
  version = "1.2.0";
  rev = "875c17f5f4776853df0168e996d6514a3e1753a0";

  goPackagePath = "github.com/aswinkarthik/csvdiff";

  src = fetchgit {
    inherit rev;
    url = "https://github.com/aswinkarthik/csvdiff";
    sha256 = "0gmzn5z9yvv1vajywix1d3kz5xbfnqnxj3vw63bmlf12gf57hi1j";
  };

  goDeps = ./deps.nix;

  meta = with stdenv.lib; {
    description = "A fast diff tool for comparing csv files";
    homepage = "https://aswinkarthik.github.io/csvdiff/";
    license = licenses.mit;
  };
}
