{ stdenv, buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  pname = "pomerium";
  version = "0.6.0";

  goPackagePath = "github.com/pomerium/pomerium";

  src = fetchFromGitHub {
    owner = "pomerium";
    repo = pname;
    rev = "v${version}";
    sha256 = "1pdnqgb5c14y8l3aaxsa9vz723zib0w42i6kviwqj2hlswpqf7b3";
  };

  modSha256 = "1vf80fiksnc6z1w0b1shzdqj266glzryxksnj3xslb9hdsf74x2s";

  meta = {
    description = "Pomerium is an identity-aware access proxy";
    homepage = "https://www.pomerium.io";
  };
}
