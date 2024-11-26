{
  description = "Nix configuration for bd-life";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    legacyNixPkgs.url = "github:nixos/nixpkgs/nixos-23.05";
  };

  outputs = { self , nixpkgs , legacyNixPkgs ,... }: let
    system = "aarch64-darwin";
  in {
    devShells."${system}".default = let
      pkgs = import nixpkgs {
        inherit system;
      };
      legacyPkgs = import legacyNixPkgs {
        inherit system;
        config = {
          permittedInsecurePackages = [ "nodejs-16.20.2" ];
        };
      };
    in pkgs.mkShell {
      packages = [
        pkgs.git
        legacyPkgs.nodejs_16
        pkgs.nushell
        pkgs.whistle
      ];

      shellHook = ''
        echo "node `${pkgs.nodejs}/bin/node --version`"
        exec nu
      '';
    };
  };
}
