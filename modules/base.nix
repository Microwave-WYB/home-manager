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
    watchexec
    jq
    unzip
  ];

  # Let Home Manager install and manage itself
  programs.home-manager.enable = true;

  home.file = {
    ".zshrc".source = ../dotfiles/zsh/.zshrc;
    ".local/share/zinit/zinit.git" = {
      source = pkgs.fetchFromGitHub {
        owner = "zdharma-continuum";
        repo = "zinit";
        rev = "v3.14.0";
        sha256 = "sha256-cBMGmFrveBes30aCSLMBO8WrtoPZeMNjcEQoQEzBNvM=";
      };
      recursive = true;
    };

    ".zoxide.nu".source = ../dotfiles/nushell/.zoxide.nu;
    ".config/nushell" = {
      source = ../dotfiles/nushell/.config/nushell;
      recursive = true;
    };

    ".config/nvim" = {
      source = ../dotfiles/nvim/.config/nvim;
      recursive = true;
    };

    ".config/zed" = {
      source = ../dotfiles/zed/.config/zed;
      recursive = true;
    };
  };

  home.sessionVariables = {
    HELLO = "Hello, world!";
    EDITOR = "nvim";
  };
}
