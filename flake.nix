{
  description = "Masihkasar Flake Configurator";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
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
  in
  {
	# nixosConfigurations = {
	# 	masihkasar = nixpkgs.lib.nixosSystem {
	# 		inherit system;
	# 		modules = [
				
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

  };
}
