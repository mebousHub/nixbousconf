{ lib, appimageTools, fetchurl }:

let
  pname = "gamesentenceminer";
  version = "2026.10.0";

  src = fetchurl {
    url = "https://github.com/bpwhelan/GameSentenceMiner/releases/download/v${version}/GameSentenceMiner-${version}.AppImage";
    hash = "sha256-zfbHTwBZxQGJ6TJm44fKjnZS1GkdmtO+3k4aI4whe38=";   };

  contents = appimageTools.extract { inherit pname version src; };
in
appimageTools.wrapType2 {
  inherit pname version src;

  extraPkgs = pkgs: with pkgs; [
  ffmpeg
  portaudio
  ];

  extraInstallCommands = ''
    install -Dm444 ${contents}/*.desktop -t $out/share/applications
    substituteInPlace $out/share/applications/*.desktop \
      --replace-quiet 'Exec=AppRun' 'Exec=${pname}'
    if [ -d ${contents}/usr/share/icons ]; then
      cp -r ${contents}/usr/share/icons $out/share/
    fi
  '';

  meta = {
    description = "Immersion toolkit for learning languages through games (Anki card mining, OCR, overlay)";
    homepage = "https://github.com/bpwhelan/GameSentenceMiner";
    license = lib.licenses.gpl3Only;
    platforms = [ "x86_64-linux" ];
    mainProgram = pname;
  };
}
