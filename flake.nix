{
  description = "Masihkasar Flake Configurator";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
		# nixpkgs-master.url = "github:NixOS/nixpkgs/master";
    home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
		self,
		nixpkgs,
		home-manager,
		...
  }: let
		system = "x86_64-linux";
		pkgs = nixpkgs.legacyPackages.${system};
		nixpkgsConfig = {
			config = { 
				allowUnfree = true;
				# Build x86 packages on Apple Silicon
				allowUnsupportedSystem = true;
				allowBroken = true;
			};
		};
  in
  {
		# nixosConfigurations = rec {
		# 	masihkasar = nixpkgs.lib.nixosSystem {
		# 		inherit system;
		# 		modules = [
		# 			./configurations.nix
		# 			home-manager.nixosModules.home-manager
		# 			({ config, lib, pkgs, ... }:
		# 				let primaryUser = "masihkasar";
		# 				in {
		# 					nixpkgs = nixpkgsConfig;
		# 					home-manager.useGlobalPkgs = true;
		# 					home-manager.useUserPackages = true;
		# 					users.users.${primaryUser}.home = "/Users/${primaryUser}";
		# 					home-manager.users.masihkasar = import ./home-manager/home.nix;
		# 				}
		# 			)
		# 		];
		# 	};
		# };
		homeConfigurations = {
			masihkasar = home-manager.lib.homeManagerConfiguration {
				inherit pkgs;
				modules = [
					./home-manager/home.nix
				];
			};
		};

		# packages.x86_64-linux.default = self.nixosConfigurations.masihkasar.config.system.build.toplevel;
		# defaultPackage.x86_64-linux = self.nixosConfigurations.masihkasar.config.system.build.toplevel;

  };
}
