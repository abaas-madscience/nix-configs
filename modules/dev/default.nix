{ config, pkgs, lib, ... }:
{
  # Core dev tooling
  environment.systemPackages = with pkgs; [
    zsh
    starship
    fzf
    zoxide
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

  # Audio stack
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
    wireplumber.enable = true;
  };

  # AMD graphics + Vulkan
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };
  hardware.graphics.enable = true;
  services.xserver.videoDrivers = [ "amdgpu" ];

  # Enable docker/podman
  virtualisation.docker.enable = true;
  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
  };

  # Fonts
  fonts.packages = with pkgs; [
    nerdfonts
    inter
  ];
}
