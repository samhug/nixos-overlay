{ stdenv
, buildGoModule
, fetchFromGitHub
}:

buildGoModule rec {
  name = "zfs-remote-keyloader-${version}";
  version = "0.0.2";

  src = fetchFromGitHub {
    owner = "samhug";
    repo = "zfs-remote-keyloader";
    rev = "v${version}";
    sha256 = "1825fckb7s7zagvs7vgy3n7rrssp2p0a5dkhrnyp4k7fdg7dq4ii";
  };

  modSha256 = "0cjwz6gxcsj63hvwa7pmapsqabd740192951ql5h1ncil6c6pp40";

  subPackages = [ "." ];

  buildInputs = [ stdenv.glibc.static ];
  CGO_ENABLED = 0;
  buildFlags = "-ldflags -s -ldflags -w -ldflags -linkmode=external -ldflags -extldflags=-static";

  meta = {
    # TODO: description = "";
    homepage = https://github.com/samhug/zfs-remote-keyloader;
  };
}
