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
            pkks.black
          ];

          shellHook = ''
            export DEV_SHELL_NAME="python"
            if [[ -z "${DIRENV_IN_ENVRC:-}" && -z "${_DEV_SHELL_ACTIVATED:-}" ]]; then
              export _DEV_SHELL_ACTIVATED=1
              printf '\n\033[1;35m🐍  Activated Python dev shell\033[0m (Python ${python.version})\n\n' >&2
            fi
          '';
        };
      });
}
