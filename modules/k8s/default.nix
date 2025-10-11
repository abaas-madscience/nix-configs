{ config, pkgs, lib, ... }:

{
  environment.systemPackages = with pkgs; [
    kubectl
    helm
    k9s
    kubectx
    stern
    kustomize
    fluxcd
    yq
    jq
    cilium-cli
    kind
  ];

  # Auto-set KUBECONFIG in Zsh
  programs.zsh.shellInit = ''
    export KUBECONFIG="$HOME/.kube/config"
  '';
}
