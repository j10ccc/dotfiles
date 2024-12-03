{
  description = "Nix configuration for making a living~";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
  };

  outputs = { self , nixpkgs ,... }: let
    system = "aarch64-darwin";
  in {
    devShells."${system}".default = let
      pkgs = import nixpkgs {
        inherit system;
      };
    in pkgs.mkShell {
      packages = with pkgs; [
        git
        nodejs_20
        pnpm
        bun
        nodePackages."@antfu/ni"
      ];

      shellHook = ''
        echo "node `${pkgs.nodejs}/bin/node --version`"
        exec fish
      '';
    };
  };
}
