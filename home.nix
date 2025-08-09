{
  home.username = "wyb";
  home.homeDirectory = "/home/wyb";
  home.stateVersion = "25.05";
  imports = [
    ./modules/base.nix
    ./modules/ghostty.nix

    ./modules/lang-go.nix
    ./modules/lang-java.nix
    ./modules/lang-js.nix
    ./modules/lang-nim.nix
    ./modules/lang-nix.nix
    ./modules/lang-python.nix
    ./modules/lang-rust.nix

    ./modules/texlive.nix
  ];
}
