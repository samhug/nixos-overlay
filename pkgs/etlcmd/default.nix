{ stdenv, buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  pname = "etlcmd";
  version = "0.3.6";

  goPackagePath = "github.com/samhug/etlcmd";

  src = fetchFromGitHub {
    owner = "samhug";
    repo = pname;
    rev = "v${version}";
    sha256 = "0nvpgz8kzmyhlv14n2ck90arr956k7xcxdk8ywimmyqg8pd4h9p0";
  };

  modSha256 = "1zbhbdjc24nlbydd65xq06qnblm5gvl5ggqxbicnabap1ghdar00";

  meta = {
    description = "A utility to assist with the automation of ETL tasks";
    homepage = "https://github.com/samhug/etlcmd";
  };
}
