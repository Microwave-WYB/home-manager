{ pkgs, ... }:
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
  ];

  home.file = {
    ".local/share/fonts" = {
      source = ../dotfiles/fonts/.local/share/fonts;
      recursive = true;
    };
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
