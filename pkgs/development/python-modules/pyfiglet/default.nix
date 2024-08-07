{
  lib,
  buildPythonPackage,
  fetchPypi,
}:

buildPythonPackage rec {
  version = "1.0.2";
  format = "setuptools";
  pname = "pyfiglet";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-dYeIAYq4+q3cCYTh6gX/Mw08ZL5mPFE8wfEF9qMGbas=";
  };

  doCheck = false;

  meta = with lib; {
    description = "FIGlet in pure Python";
    mainProgram = "pyfiglet";
    license = licenses.gpl2Plus;
    maintainers = with maintainers; [ thoughtpolice ];
  };
}
