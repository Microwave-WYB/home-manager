{ pkgs, ... }:
{
  home.packages = with pkgs; [
    sqls
    dbmate
  ];
}
