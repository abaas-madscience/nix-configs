{ config, pkgs, lib, ... }:
{
  imports = [
    ./apps/zsh.nix
    ./apps/tmux.nix
    ./apps/zed-editor.nix
    ./apps/starship.nix
    ./apps/firefox.nix
    ./apps/ai-tools.nix
  ];

  home.username = "oscar";
  home.homeDirectory = "/home/oscar";

  home.stateVersion = "25.05";

  programs.home-manager.enable = true;

  # User-level GNOME Shell extensions
  home.packages = with pkgs.gnomeExtensions; [
    dash-to-dock
    vitals
    appindicator
    user-themes
    caffeine
    hot-edge
  ];

  xdg.dataFile."gnome-shell/extensions/user-theme@gnome-shell-extensions.gcampax.github.com".source =
    "${pkgs.gnomeExtensions.user-themes}/share/gnome-shell/extensions/user-theme@gnome-shell-extensions.gcampax.github.com";

  xdg.dataFile."gnome-shell/extensions/dash-to-dock@micxgx.gmail.com".source =
    "${pkgs.gnomeExtensions.dash-to-dock}/share/gnome-shell/extensions/dash-to-dock@micxgx.gmail.com";

  xdg.dataFile."gnome-shell/extensions/Vitals@CoreCoding.com".source =
    "${pkgs.gnomeExtensions.vitals}/share/gnome-shell/extensions/Vitals@CoreCoding.com";

  xdg.dataFile."gnome-shell/extensions/appindicatorsupport@rgcjonas.gmail.com".source =
    "${pkgs.gnomeExtensions.appindicator}/share/gnome-shell/extensions/appindicatorsupport@rgcjonas.gmail.com";

  xdg.dataFile."gnome-shell/extensions/caffeine@patapon.info".source =
    "${pkgs.gnomeExtensions.caffeine}/share/gnome-shell/extensions/caffeine@patapon.info";

  xdg.dataFile."gnome-shell/extensions/hotedge@ajauw.github.com".source =
    "${pkgs.gnomeExtensions.hot-edge}/share/gnome-shell/extensions/hotedge@ajauw.github.com";

  # Let Stylix handle the cursor; keep only xresources override
  xresources.properties = {
    "Xcursor.size" = 24;
  };

  # Override Stylix cursor size to avoid null coercion
  stylix = {
    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
      size = 24;
    };
    targets = {
      qt = {
        enable = lib.mkForce false;
      };
      firefox = {
        profileNames = [ "default" ];
      };
    };
  };
}
