{
  lib,
  appimageTools,
  fetchurl,
  makeWrapper,
  xdotool,
  libxtst,
  libxkbcommon,
  libGL,
  vulkan-loader,
  libpulseaudio,
  alsa-lib,
  stdenv,
}:

let
  pname = "yomininja";
  version = "0.9.3";

  src = fetchurl {
    url = "https://github.com/matt-m-o/YomiNinja/releases/download/v${version}/YomiNinja-${version}.AppImage";
    hash = "sha256-yvMgZG3zjBndPtiMctucon8VHnY4EvsqI6/QMqTwFR0=";
  };

  appimageContents = appimageTools.extract { inherit pname version src; };
in
appimageTools.wrapType2 {
  inherit pname version src;

  nativeBuildInputs = [ makeWrapper ];

  # xdotool is a hard runtime dependency (window handling on X11).
  # The rest covers the bundled native modules (uiohook, ppocr, electron).
  extraPkgs = pkgs: [
    xdotool
    libxtst
    libxkbcommon
    libGL
    vulkan-loader
    libpulseaudio
    alsa-lib
    stdenv.cc.cc.lib
  ];

  extraInstallCommands = ''
    install -Dm444 ${appimageContents}/yomininja-e.desktop \
      $out/share/applications/yomininja.desktop
    substituteInPlace $out/share/applications/yomininja.desktop \
      --replace-fail "Exec=AppRun --no-sandbox %U" "Exec=yomininja %U" \
      --replace-fail "Icon=yomininja-e" "Icon=yomininja"

    for size in 16 32 48 64 128 256 512; do
      icon=${appimageContents}/usr/share/icons/hicolor/''${size}x''${size}/apps/yomininja-e.png
      if [ -f "$icon" ]; then
        install -Dm444 "$icon" \
          $out/share/icons/hicolor/''${size}x''${size}/apps/yomininja.png
      fi
    done

    # chrome-sandbox can't be setuid inside the FHS env, so --no-sandbox
    # is required (same flag the upstream .desktop file uses).
    wrapProgram $out/bin/yomininja \
      --add-flags "--no-sandbox"
  '';

  meta = {
    description = "OCR and pop-up dictionary overlay for language learners";
    homepage = "https://github.com/matt-m-o/YomiNinja";
    changelog = "https://github.com/matt-m-o/YomiNinja/releases/tag/v${version}";
    license = lib.licenses.gpl3Only;
    mainProgram = "yomininja";
    platforms = [ "x86_64-linux" ];
    sourceProvenance = [ lib.sourceTypes.binaryNativeCode ];
  };
}

