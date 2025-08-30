{ config, pkgs, ... }: {
  imports = [
    ../home-modules/sh.nix
    ../home-modules/helix.nix
  ];

  # Home Manager needs a bit of information about you and the paths it should
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



  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  home.stateVersion = "25.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    helix
    nodejs_20
    nodePackages.pnpm
    rust-analyzer
    clang-tools
    nil
    nodePackages.typescript-language-server
    nodePackages.prettier
    nodePackages."@tailwindcss/language-server"
    vscode-langservers-extracted
    pyright
    rustfmt
    nixpkgs-fmt
    lldb
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = { };

  # You can also set the file content immediately.
  # ".gradle/gradle.properties".text = ''
  #   org.gradle.console=verbose
  #   org.gradle.daemon.idletimeout=3600000
  # '';

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'.
  home.sessionVariables = {
    EDITOR = "hx"; # Set Helix as the default editor
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}

