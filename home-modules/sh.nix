{ config, pkgs, ... }:

let
  myAliases = {
    ll = "ls -la";
    ".." = "cd ..";
    "..." = "cd ../..";
    gs = "git status";
    gl = "git log --oneline -20";
    gd = "git diff";
    lg = "lazygit";
  };
in
{
  programs.bash = {
    enable = true;
    shellAliases = myAliases;
  };

  programs.zsh = {
    enable = true;
    shellAliases = myAliases;
  };
}

