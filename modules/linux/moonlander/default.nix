{ stdenv }: stdenv.mkDerivation rec {
  name = "moonlander-keyboard-${version}";
  version = "1.0";
  src = ./.;
  nativeBuildInputs = [ ];
  buildInputs = [ ];
  buildPhase = "";
  installPhase = ''
    cp moonlander.kbd $out
  ''; 
}
