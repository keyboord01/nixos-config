{ config, pkgs, ... }:

{
  programs.ghostty = {
    enable = true;

    # Setting the default theme for Ghostty
    theme = "dracula"; # You can change this to any theme Ghostty supports (e.g., "solarized", "monokai", etc.)

    # Set the working directory inheritance
    window-inherit-working-directory = true; # Inherit the working directory from the previous terminal
    working-directory = "inherit"; # Or set to "home" for the user's home directory

    # Enable transparency (optional)
    transparency = 0.9; # 0.0 (no transparency) to 1.0 (full transparency)

    # Set window-specific command (e.g., you can make it run a command on startup)
    startup-command = "htop"; # Runs htop on startup, for example

    # Enable mouse support
    mouse = true; # Enables mouse support in the terminal

    # Enable clipboard access
    clipboard-provider = "xclip"; # or "wl-clipboard" for Wayland

    # Use system fonts (optional)
    font = "Hack Nerd Font Mono"; # Set a nerd font for better icon support

    # Additional features like auto-save, shell environment variables, etc.
    auto-save = true;
  };
}

