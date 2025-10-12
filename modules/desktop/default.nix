{ config, pkgs, lib, ... }:

{
  # GNOME + Wayland, minimal app selection
  services.xserver.enable = true;

  services.displayManager.gdm = {
    enable = true;
    wayland = true;
  };

  services.desktopManager.gnome.enable = true;

  # Disable GNOME extension version warnings
  #programs.dconf.enable = true;
  #dconf.settings = {
  #  "org/gnome/shell" = {
  #    disable-extension-version-validation = true;
  #  };
  #};

  # Remove default GNOME apps
  environment.gnome.excludePackages = with pkgs; [
    gnome-tour
    gnome-weather
    gnome-maps
    gnome-contacts
    gnome-calendar
    gnome-clocks
    gnome-photos
    epiphany
  ];

  # GNOME extensions and themes
  environment.systemPackages = with pkgs; [
    adw-gtk3
    papirus-icon-theme
    loupe
    evince
    pkgs.nautilus
    gnomeExtensions.dash-to-dock
    gnomeExtensions.vitals
    gnomeExtensions.appindicator
    gnomeExtensions.user-themes
    gnomeExtensions.caffeine
    gnomeExtensions.hot-edge
  ];

  # Stylix – unified theming
  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
    polarity = "dark";
    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono Nerd Font";
      };
      sansSerif = {
        package = pkgs.inter;
        name = "Inter";
      };
    };
    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
      size = 24;
    };
    targets = {
      qt = {
        enable = lib.mkForce false;
      };
    };
  };
}
