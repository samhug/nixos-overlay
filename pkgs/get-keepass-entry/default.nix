{ stdenv, python3 }:

let
  pythonWithPackages =
    (python3.withPackages (ps: with ps; [
      pykeepass
    ]));

in

stdenv.mkDerivation {
  pname = "get-keepass-entry";
  version = "0.1.0";

  src = ./get-keepass-entry.py;

  sourceRoot = ".";
  unpackCmd = ":";
  buildPhase = ":";

  propagatedBuildInputs = [ pythonWithPackages ];

  installPhase = ''
    mkdir -p $out/bin
    cp $src $out/bin/get-keepass-entry
    chmod +x $out/bin/get-keepass-entry
  '';

  meta = {
    description = "Retrieve a password from a KeePass database";
  };
}
