{ config, pkgs, ... }:

{
  imports = [
    ../../modules/system/hardware.nix
    ../../modules/system/graphics.nix
  ];

  networking.hostName = "laptop";
  time.timeZone = "Europe/Amsterdam";

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

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

  environment.systemPackages = with pkgs; [ vim git ];
  programs.zsh.enable = true;
}
