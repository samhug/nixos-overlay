{ buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  pname = "ndm";
  version = "0.1.2";

  goPackagePath = "github.com/samuelhug/ndm";

  src = fetchFromGitHub {
    owner = "samhug";
    repo = "${pname}";
    rev = "v${version}";
    sha256 = "1hxxf13rcyb9q5dcz1da339pxagz9q4gi6l614b90dms68ra5wv3";
  };

  modSha256 = "0i68qsnap4gc6bk2sb1zkf01s54slg1p3n64iwldc1az74l1d7mj";

  subPackages = [ "." ];
}
