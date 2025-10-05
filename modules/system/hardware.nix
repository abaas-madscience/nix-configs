{ config, pkgs, ... }:
{
  imports = [ ../../hosts/laptop/hardware-configuration.nix ];

  # --- Bootloader ---
  boot.loader.grub = {
    enable = true;
    device = "/dev/vda";  # QEMU/VM disk device
    useOSProber = true;
  };

  # --- Kernel ---
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # --- Nix configuration ---
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # --- Networking ---
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  # --- CPU & firmware ---
  hardware.cpu.amd.updateMicrocode = true;
  hardware.enableRedistributableFirmware = true;

  # --- Power management ---
  powerManagement.cpuFreqGovernor = "schedutil";
  services.thermald.enable = true;
}
