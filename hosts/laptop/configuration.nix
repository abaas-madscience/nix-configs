{ config, pkgs, ... }:

{
  imports = [
    ../../modules/system/hardware.nix
    ../../modules/system/graphics.nix
    ../../modules/desktop
    ../../modules/dev
    ../../modules/k8s
    ../../modules/ai
  ];

  boot.loader.grub.useOSProber = false;

  networking.hostName = "nixos";
  time.timeZone = "Europe/Amsterdam";

  # Enable the GNOME Desktop Environment.
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  # Disable basic GNOME stuff
  services.gnome.core-apps.enable = false;
  services.gnome.core-developer-tools.enable = false;
  services.gnome.games.enable = false;
  environment.gnome.excludePackages = with pkgs; [ gnome-tour gnome-user-docs ];

  users.users.oscar = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
    shell = pkgs.zsh;
  };

  environment.systemPackages = with pkgs; [ vim git gnome-terminal ];
  programs.zsh.enable = true;

  # Enable SSH (for now)
  services.openssh.enable = true;


  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?


}
