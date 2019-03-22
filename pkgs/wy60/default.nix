{ stdenv, pkgs, fetchurl }:

with stdenv;
mkDerivation rec {
  name = "wy60-${version}";
  version = "2.0.9";

  src = fetchurl {
    url = "https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/wy60/wy60-${version}.tar.gz";
    sha256 = "1l2yq0zvd5b1lln1n1vmmdk55xhdkrgv1xwaljmqzwxsy0298dzp";
  };

  buildInputs = [ pkgs.ncurses ];

  meta = with lib; {
    description = "Wyse 60 compatible terminal emulator";
    homepage = "https://code.google.com/archive/p/wy60/";
    license = licenses.gpl2;
  };
}
