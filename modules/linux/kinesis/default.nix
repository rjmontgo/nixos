{ stdenv }: stdenv.mkDerivation rec {
  name = "kinesis-keyboard-${version}";
  version = "1.0";
  src = ./.;
  nativeBuildInputs = [ ];
  buildInputs = [ ];
  buildPhase = "";
  installPhase = ''
    cp kinesis.kbd $out
  '';
}
