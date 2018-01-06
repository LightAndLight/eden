{ mkDerivation, stdenv, lens }:
mkDerivation {
  pname = "eden";
  version = "0.1.0.0";
  src = ./.;
  isLibrary = true;
  libraryHaskellDepends = [ lens ];
  isExecutable = true;
  executableHaskellDepends = [ lens ];
  license = stdenv.lib.licenses.bsd3;
}
