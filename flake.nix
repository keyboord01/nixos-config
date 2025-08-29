{
  description = "My first flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-25.05";

    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    ghostty.url = "github:ghostty-org/ghostty";
  };

  outputs = { nixpkgs, home-manager, ghostty, ... }:
    let
      system = "aarch64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      nixosConfigurations = {
        nixos = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            ./modules/configuration.nix
            {
              environment.systemPackages = [
                ghostty.packages.${system}.default
              ];
            }
          ];
        };
      };

      homeConfigurations = {
        ahmed = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            ./modules/home.nix
          ];
        };
      };
    };
}

