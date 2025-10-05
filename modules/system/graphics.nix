{ config, pkgs, ... }:
{
  # --- AMDGPU driver stack ---
  services.xserver.videoDrivers = [ "amdgpu" ];

  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;

    extraPackages = with pkgs; [
      amdvlk
      rocm-opencl-runtime
    ];
    extraPackages32 = with pkgs; [
      driversi686Linux.amdvlk
    ];
  };

  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      mesa
      mesa.drivers
      mesa.vulkan-drivers
    ];
  };

  # --- Fonts & cursor defaults ---
  fonts = {
    packages = with pkgs; [
      nerd-fonts.jetbrains-mono
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
    ];

    fontconfig = {
      enable = true;
      defaultFonts = {
        monospace = [ "JetBrainsMono Nerd Font" ];
        sansSerif = [ "Noto Sans" ];
        serif = [ "Noto Serif" ];
      };
    };
  };

  # --- Desktop variables ---
  environment.variables = {
    GTK_THEME = "Adwaita:dark";
    QT_QPA_PLATFORMTHEME = "gtk3";
    XCURSOR_THEME = "Bibata-Modern-Ice";
    XCURSOR_SIZE = "24";
  };
}
