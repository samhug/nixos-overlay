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

  modSha256 = "0c7l14gv8aj11v18rs1lc9gwfh7wcm569agf7z8d5i02aji2nk9g";

  subPackages = [ "." ];

  buildInputs = [ stdenv.glibc.static ];
  CGO_ENABLED=0;
  buildFlags = "-ldflags -s -ldflags -w -ldflags -linkmode=external -ldflags -extldflags=-static";

  meta = {
    # TODO: description = "";
    homepage = https://github.com/samhug/zfs-remote-keyloader;
  };
}
