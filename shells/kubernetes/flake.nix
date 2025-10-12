{
  description = "Kubernetes management environment";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in {
      devShells.${system}.default = pkgs.mkShell {
        name = "k8s-shell";

        packages = with pkgs; [
          kubectl
          helm
          k9s
          cilium-cli
          fluxcd
          kubeseal
          yq
          jq
          stern
          kind
        ];

        shellHook = ''
          export KUBECONFIG=$HOME/.kube/config
          echo -e "\033[1;36m🐳 Welcome to Cluster Land — kubectl $(kubectl version --client --short 2>/dev/null)\033[0m"
          PS1="(k8s) \u@\h:\W$ "
        '';
      };
    };
}
