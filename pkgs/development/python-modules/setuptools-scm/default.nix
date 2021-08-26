{ lib, buildPythonPackage, fetchPypi, toml }:

buildPythonPackage rec {
  pname = "setuptools-scm";
  # don't update to 6.1.0 or 6.2.0, releases were pulled because of regression
  # https://github.com/pypa/setuptools_scm/issues/615
  version = "6.0.1";

  src = fetchPypi {
    pname = "setuptools_scm";
    inherit version;
    sha256 = "sha256-0ZJaacsH6bKUFqJ1ufrbAJojwUis6QWy+yIGSabBjpI=";
  };

  propagatedBuildInputs = [ toml ];

  # Requires pytest, circular dependency
  doCheck = false;
  pythonImportsCheck = [ "setuptools_scm" ];

  meta = with lib; {
    homepage = "https://github.com/pypa/setuptools_scm/";
    description = "Handles managing your python package versions in scm metadata";
    license = licenses.mit;
    maintainers = with maintainers; [ SuperSandro2000 ];
  };
}
