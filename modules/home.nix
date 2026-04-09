{ config, pkgs, ... }: {
  imports = [
    ../home-modules/sh.nix
    ../home-modules/helix.nix
  ];

  home.username = "ahmed";
  home.homeDirectory = "/home/ahmed";

  programs.git = {
    enable = true;
    userName = "keyboord01";
    userEmail = "keyboord01@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };

  home.stateVersion = "25.05";

  home.packages = with pkgs; [
    helix
    nodejs_20
    nodePackages.pnpm
    nodePackages.typescript-language-server
    nodePackages.prettier
    nodePackages."@tailwindcss/language-server"
    vscode-langservers-extracted
    rust-analyzer
    rustfmt
    cargo
    rustc
    go
    gopls
    gotools
    nil
    nixpkgs-fmt
  ];

  home.file = { };

  home.sessionVariables = {
    EDITOR = "hx";
    TERM = "xterm-256color"; # Ghostty compatibility
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  programs.home-manager.enable = true;
}

