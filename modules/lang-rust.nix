{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # rustup
    cargo
    rustc
    rust-analyzer
    rustfmt
  ];
}
