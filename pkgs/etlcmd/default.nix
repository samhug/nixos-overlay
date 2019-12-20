{ buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  pname = "etlcmd";
  version = "0.3.7";

  goPackagePath = "github.com/samhug/etlcmd";

  src = fetchFromGitHub {
    owner = "samhug";
    repo = pname;
    rev = "v${version}";
    sha256 = "0f0g3rcmjh7rjymzjllp1i0bnsi1n91c9vhnblkb77p15wz9wywp";
  };

  modSha256 = "0zsdymqghrqb89q3ydmgrb2167n8jnff8vqqqrydrxkwbgcg50nr";

  meta = {
    description = "A utility to assist with the automation of ETL tasks";
    homepage = "https://github.com/samhug/etlcmd";
  };
}
