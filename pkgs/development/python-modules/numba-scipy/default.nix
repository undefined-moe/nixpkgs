{
  lib,
  buildPythonPackage,
  fetchPypi,
  scipy,
  numba,
  pytestCheckHook,
  pythonOlder,
}:

buildPythonPackage rec {
  pname = "numba-scipy";
  version = "0.4.0";
  format = "setuptools";

  disabled = pythonOlder "3.6";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-RDZF1mNcZnrcOzjQpjbZq8yXHnjeLAeAjYmvzXvFhEQ=";
  };

  propagatedBuildInputs = [
    scipy
    numba
  ];

  nativeCheckInputs = [
    pytestCheckHook
  ];
  pythonRelaxDeps = [
    "scipy"
    "numba"
  ];

  pythonImportsCheck = [ "numba_scipy" ];

  meta = with lib; {
    description = "Extends Numba to make it aware of SciPy";
    homepage = "https://github.com/numba/numba-scipy";
    changelog = "https://github.com/numba/numba-scipy/blob/master/CHANGE_LOG";
    license = licenses.bsd2;
    maintainers = with maintainers; [ Etjean ];
  };
}
