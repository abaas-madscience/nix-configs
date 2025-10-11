{ config, pkgs, lib, ... }:
{
  # Core dev tooling
  environment.systemPackages = with pkgs; [
    zsh
    starship
    fzf
    zoxide
    direnv
    bat
    eza
    ripgrep
    fd
    bottom
    fastfetch
    wl-clipboard
    clipman
    kitty
    alacritty
  ];

  # Power management
  powerManagement.enable = true;
  services.tlp.enable = true;
  services.power-profiles-daemon.enable = false;

  # Audio stack
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
    wireplumber.enable = true;
  };

  # AMD graphics + Vulkan
  hardware.graphics = {
    enable = true;
  };
  services.xserver.videoDrivers = [ "amdgpu" ];

  # Enable docker/podman
  virtualisation.docker.enable = true;
  virtualisation.podman = {
    enable = true;
    dockerCompat = false;
  };

  # Fonts
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    inter
  ];
}
