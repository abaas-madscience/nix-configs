{ config, pkgs, lib, ... }:

{
  environment.systemPackages = with pkgs; [
    ollama
    aider-chat
    shell-gpt
  ];

  # Allow user to run ollama service
  users.users.oscar.extraGroups = [ "ollama" ];
  services.ollama = {
    enable = true;
    acceleration = "rocm"; # auto-detect AMD GPU
  };
}
