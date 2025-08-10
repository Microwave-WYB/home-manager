{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nerd-fonts.fira-code
    nerd-fonts.jetbrains-mono
    nerd-fonts.go-mono
    inter
    adwaita-fonts
  ];

  home.file = {
    ".local/share/fonts" = {
      source = ../dotfiles/.local/share/fonts;
      recursive = true;
    };
  };

  fonts.fontconfig.enable = true;
}
