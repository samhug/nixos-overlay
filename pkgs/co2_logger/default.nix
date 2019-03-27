{ stdenv, fetchFromGitHub, pythonPackages }:

let
  inherit (pythonPackages) python buildPythonApplication callPackage;
  pycozir = callPackage ./pycozir.nix {};
in buildPythonApplication rec {
  pname = "co2_logger";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "samhug";
    repo = "co2_logger";
    rev = "e4c4d16a54b19385e9141d6804f1d4e5d706c0a9";
    sha256 = "0sz9mgyjsg10v6qb3x2z7sxj7smg2030dvsm0h8slic02ifknlp3";
  };

  pythonPath = with pythonPackages; [
    google_api_python_client
    pycozir
  ];

  meta = {
    description = "A utility to log readings from a CO2 sensor to a Google Sheets spreadsheet";
  };
}
