{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # Shells
    zsh
    nushell
    # Essential CLI tools
    neovim
    zoxide
    hexyl
  ];

  # Let Home Manager install and manage itself
  programs.home-manager.enable = true;

  home.file = {
    ".zshrc".source = ../dotfiles/.zshrc;
    ".local/share/zinit/zinit.git" = {
      source = pkgs.fetchFromGitHub {
        owner = "zdharma-continuum";
        repo = "zinit";
        rev = "v3.14.0";
        sha256 = "sha256-cBMGmFrveBes30aCSLMBO8WrtoPZeMNjcEQoQEzBNvM=";
      };
      recursive = true;
    };

    ".zoxide.nu".source = ../dotfiles/.zoxide.nu;
    ".config/nushell" = {
      source = ../dotfiles/.config/nushell;
      recursive = true;
    };

    ".config/nvim" = {
      source = ../dotfiles/.config/nvim;
      recursive = true;
    };

    ".config/zed" = {
      source = ../dotfiles/.config/zed;
      recursive = true;
    };
  };

  home.sessionVariables = {
    HELLO = "Hello, world!";
    EDITOR = "nvim";
  };
}
