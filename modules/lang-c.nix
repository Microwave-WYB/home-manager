{ pkgs, ... }:
{
  home.packages = with pkgs; [
    clang
    bear
  ];
}
