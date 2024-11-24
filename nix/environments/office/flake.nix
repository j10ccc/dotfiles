{
    description = "My Node.js development flake";
    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos - 23.11";
    };
    outputs = { self, nixpkgs }: {
        devShells.aarch64-darwin = {
            default = nixpkgs.lib.nixpkgs.mkShell {
                buildInputs = [
                    nixpkgs.nodejs-20_x
                ];
            };
        };
    };
}
