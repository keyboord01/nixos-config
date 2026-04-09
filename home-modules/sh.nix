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
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true;
    history = {
      size = 10000;
      save = 10000;
      ignoreDups = true;
      ignoreAllDups = true;
      share = true;
    };
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    enableBashIntegration = true;
    settings = {
      add_newline = false;
      line_break.disabled = true;
      hostname.disabled = true;
      container.disabled = true;
    };
  };


}

