# Pacote para NixOS. Em distros comuns isso não é usado: veja "Instalar" no README.
#
# O NixOS não tem /bin/bash, então o patchShebangs (automático no fixupPhase)
# troca o "#!/bin/bash" do script pelo bash da Nix store. O script original
# continua intocado.
{ pkgs ? import <nixpkgs> { } }:

pkgs.stdenvNoCC.mkDerivation {
  pname = "dockerbuddy";
  version = "0.1.0";

  src = ./.;

  nativeBuildInputs = [ pkgs.makeWrapper ];
  buildInputs = [ pkgs.bash ];

  installPhase = ''
    runHook preInstall

    mkdir -p $out/share/dockerbuddy $out/bin
    cp -r dockerbuddy.sh data $out/share/dockerbuddy/

    # Garante sed/readlink/dirname no PATH, mesmo num ambiente mínimo
    makeWrapper $out/share/dockerbuddy/dockerbuddy.sh $out/bin/dockerbuddy \
      --prefix PATH : ${pkgs.lib.makeBinPath [ pkgs.coreutils pkgs.gnused ]}

    runHook postInstall
  '';
}
