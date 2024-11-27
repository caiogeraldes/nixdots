{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
    zen-browser.url = "github:caiogeraldes/zen-browser-flake";
    yazi.url = "github:sxyazi/yazi";
  };

  outputs = { self, nixpkgs, home-manager, yazi, ... }@inputs: 
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
  in {
    nixosConfigurations = {
      rua = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          ./hosts/rua
        ];
      };
      wkst = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          ./hosts/wkst
        ];
      };
    };
    homeConfigurations."rua" = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      modules = [
      ./home/home.nix
      ./home/hypr_rua.nix
      ({pkgs, ... }: { home.packages = [ yazi.packages.${pkgs.system}.default ];})
      ];
    };
    homeConfigurations."wkst" = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      modules = [
      ./home/home.nix 
      ./home/hypr_wkst.nix
      ({pkgs, ... }: { home.packages = [ yazi.packages.${pkgs.system}.default ];})
      ];
    };
  };
}
