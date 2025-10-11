{
  description = "Rust dev shell";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  inputs.flake-utils.url = "github:numtide/flake-utils";
  inputs.fenix.url = "github:nix-community/fenix";
  inputs.fenix.inputs.nixpkgs.follows = "nixpkgs";

  outputs = { self, nixpkgs, flake-utils, fenix }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        toolchain = fenix.packages.${system}.stable;
      in
      {
        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            toolchain.toolchain
            cargo-audit
            cargo-edit
            cargo-watch
            bacon
            rust-analyzer
          ];
        };
      });
}
