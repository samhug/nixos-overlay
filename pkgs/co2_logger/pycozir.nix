{ lib
, buildPythonPackage
, fetchFromGitHub
, isPy3k
, pyserial
, enum34
}:

buildPythonPackage rec {
  pname = "pycozir";
  version = "0.1";

  src = fetchFromGitHub {
    owner = "pierre-haessig";
    repo = "pycozir";
    rev = "d8757e568809e6ec8a59b310607aae620cbf2e34";
    sha256 = "0imxlhg4zwgpl6rk8fw22d46mhl88b7bdp3pfs0nvn6ydjwvzg53";
  };

  propagatedBuildInputs = [
    pyserial
  ] ++ lib.optional (!isPy3k) enum34;

  meta = {
    description = "a Python interface to COZIR CO2 sensors";
    homepage = "https://github.com/pierre-haessig/pycozir";
    license = lib.licenses.bsd3;
  };
}
