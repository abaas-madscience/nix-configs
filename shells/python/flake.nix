{
  description = "Python dev shell";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        python = pkgs.python311;
      in
      {
        devShells.default = pkgs.mkShell {
          packages = [
            python
            pkgs.poetry
            pkgs.nodejs
            pkgs.pre-commit
            pkgs.ruff
            pkgs.black
          ];

          shellHook = ''
            export DEV_SHELL_NAME="python"
            if [ -n "${PS1-}" ]; then
              printf '\n\033[1;35m🐍 Activated Python dev shell\033[0m (Python ${python.version})\n\n'
            fi
          '';
        };
      });
}
