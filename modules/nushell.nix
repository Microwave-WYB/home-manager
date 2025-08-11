{
  home.file = {
    ".zoxide.nu".source = ../dotfiles/nushell/.zoxide.nu;
    ".config/nushell" = {
      source = ../dotfiles/nushell/.config/nushell;
      recursive = true;
    };
  };
}
