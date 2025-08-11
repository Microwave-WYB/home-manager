{ pkgs, ... }:
let
  google-sans-code = pkgs.stdenv.mkDerivation {
    name = "google-sans-code";
    version = "6.000";

    src = pkgs.fetchurl {
      url = "https://github.com/googlefonts/googlesans-code/releases/download/v6.000/GoogleSansCode-v6.000.zip";
      sha256 = "sha256-VMK1u7aBWYOBBufRz/sujOuPe0a5P3MGA7NlGaYSW7s=";
    };

    nativeBuildInputs = [ pkgs.unzip ];

    unpackPhase = ''
      unzip $src
    '';

    installPhase = ''
      mkdir -p $out/share/fonts/truetype/google-sans-code
      cp -r * $out/share/fonts/truetype/google-sans-code/
    '';
  };
in
{
  home.packages = with pkgs; [
    nerd-fonts.fira-code
    nerd-fonts.jetbrains-mono
    nerd-fonts.go-mono
    noto-fonts
    noto-fonts-emoji
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    inter
    adwaita-fonts
    google-sans-code
  ];

  home.file = {
    ".config/fontconfig" = {
      source = ../dotfiles/fonts/.config/fontconfig;
      recursive = true;
    };
  };

  fonts.fontconfig.enable = true;

  fonts.fontconfig.defaultFonts = {
    monospace = [ "Google Sans Mono" "Fira Code Nerd Font" ];
    sansSerif = [ "Noto San CJK SC" "Adwaita Sans" "Inter" ];
    serif = [ "Noto Serif CJK SC" ];
    emoji = [ "Noto Color Emoji" ];
  };
}
