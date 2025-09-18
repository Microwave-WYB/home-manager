{ pkgs, ... }:
{
  home.packages = with pkgs; [
    elixir
    erlang_26
    rebar3
    hex
    elixir_ls
    inotify-tools
    gleam
  ];
}
