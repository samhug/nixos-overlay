{ lib, rustPlatform, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "zfs-remote-keyloader";
  version = "0.2.0";

  src = fetchFromGitHub {
    owner = "samhug";
    repo = "zfs-remote-keyloader";
    rev = "v${version}";
    sha256 = "0gxf72qz4rnprwqn7i850qx1vjv0qm6s0rh9ipnxi4i8hmac87iz";
  };

  cargoSha256 = "0sdbp38fw44icvl7wdyb1wsipah3kr37q2nq0jdykcs6pynicvxx";
}
