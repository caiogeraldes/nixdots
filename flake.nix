{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
    zen-browser.url = "github:caiogeraldes/zen-browser-flake";
    yazi.url = "github:sxyazi/yazi";
    agenix.url = "github:ryantm/agenix";
    audiomenu.url = "github:jalil-salame/audiomenu";
  };

  outputs = { self, nixpkgs, home-manager, yazi, agenix, audiomenu, ... }@inputs: 
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
  in {
    nixosConfigurations = {
      rua = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          ./hosts/rua
          agenix.nixosModules.default
        ];
      };
      wkst = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          ./hosts/wkst
          agenix.nixosModules.default
        ];
      };
      hsamg = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          ./hosts/hsamg
          agenix.nixosModules.default
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
    homeConfigurations."hsamg" = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      modules = [
      ./home/hsamg.nix 
      ({pkgs, ... }: { home.packages = [ yazi.packages.${pkgs.system}.default ];})
      ];
    };
  };
}
