{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # Essential CLI tools
    neovim
    zoxide
    hexyl
    watchexec
    jq
    unzip
    yazi
    just
    stow
  ];

  # Let Home Manager install and manage itself
  programs.home-manager.enable = true;

  home.file = {
    ".local/share/zinit/zinit.git" = {
      source = pkgs.fetchFromGitHub {
        owner = "zdharma-continuum";
        repo = "zinit";
        rev = "v3.14.0";
        sha256 = "sha256-cBMGmFrveBes30aCSLMBO8WrtoPZeMNjcEQoQEzBNvM=";
      };
      recursive = true;
    };
  };

  home.sessionVariables = {
    HELLO = "Hello, world!";
    EDITOR = "nvim";
  };
}
