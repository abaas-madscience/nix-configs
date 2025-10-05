{ config, pkgs, ... }:
{
  # --- CPU & microcode ---
  hardware.cpu.amd.updateMicrocode = true;

  # --- Basic kernel setup ---
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # --- Power management ---
  powerManagement.cpuFreqGovernor = "schedutil";
  services.thermald.enable = true;

  # --- Firmware ---
  hardware.enableRedistributableFirmware = true;

  # --- Filesystems ---
  fileSystems."/" = {
    device = "/dev/disk/by-label/nixos";
    fsType = "ext4"; # or xfs/btrfs/zfs as you prefer
  };

  swapDevices = [ ];

  # --- Host networking ---
  networking.networkmanager.enable = true;
}
