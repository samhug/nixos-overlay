{ stdenv
, buildGoModule
, fetchFromGitHub
}:

buildGoModule rec {
  name = "zfs-remote-keyloader-${version}";
  version = "0.0.1";

  src = fetchFromGitHub {
    owner = "samhug";
    repo = "zfs-remote-keyloader";
    rev = "v${version}";
    sha256 = "1r1g6s1057yb40gjy83d6smgbj3r8crfrnxx5n8ksr3vfylx4jg7";
  };

  modSha256 = "1j3vgmn64shy1v73c1pz1qm90b837mlbjz3gaspn2fi2akyab53f";

  subPackages = [ "." ];

  buildInputs = [ stdenv.glibc.static ];
  CGO_ENABLED=0;
  buildFlags = "-ldflags -s -ldflags -w -ldflags -linkmode=external -ldflags -extldflags=-static";

  meta = {
    # TODO: description = "";
    homepage = https://github.com/samhug/zfs-remote-keyloader;
  };
}
