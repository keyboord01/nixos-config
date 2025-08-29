{
  description = "My first flake";

  inputs = {
    # nixpkgs = {
    #   url = "github:NixOs/nixpkgs/nixos-25.05"
    # };
    nixpkgs.url = "nixpkgs/nixos-25.05";
    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    # helix.url = "github:the-mikedavis/helix/driver";
    # helix.inputs.nixpkgs.follows = "nixpkgs";
    # helix.inputs.flake-utils.follows = "flake-utils";
  };

  outputs = { nixpkgs, home-manager, ... }:
    let
      lib = nixpkgs.lib;
      system = "aarch64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      nixosConfigurations = {
        nixos = lib.nixosSystem {
          inherit system;
          modules = [ ./modules/configuration.nix ];
        };
      };

      homeConfigurations = {
        ahmed = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [ ./modules/home.nix ];
        };
      };
    };
}

