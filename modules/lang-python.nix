{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # Python tools
    uv
    pyright
    basedpyright
    ruff
    ty
  ];
}
