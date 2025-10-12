{ config, pkgs, lib, ... }:

let
  imageViewerDesktop = "org.gnome.Loupe.desktop";
  pdfViewerDesktop = "org.gnome.Evince.desktop";
  fileManagerDesktop = "org.gnome.Nautilus.desktop";
  workspaceSettingsDir = ".local/share/DBeaverData/workspace6/General/.metadata/.plugins/org.eclipse.core.runtime/.settings";
in
{
  home.packages = with pkgs; [
    dbeaver-bin
    gnome.nautilus
  ];

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "application/pdf" = [ pdfViewerDesktop ];
      "application/x-pdf" = [ pdfViewerDesktop ];
      "inode/directory" = [ fileManagerDesktop ];
      "x-directory/normal" = [ fileManagerDesktop ];
      "text/directory" = [ fileManagerDesktop ];
      "image/avif" = [ imageViewerDesktop ];
      "image/bmp" = [ imageViewerDesktop ];
      "image/gif" = [ imageViewerDesktop ];
      "image/heic" = [ imageViewerDesktop ];
      "image/heif" = [ imageViewerDesktop ];
      "image/jpeg" = [ imageViewerDesktop ];
      "image/jpg" = [ imageViewerDesktop ];
      "image/pjpeg" = [ imageViewerDesktop ];
      "image/png" = [ imageViewerDesktop ];
      "image/svg+xml" = [ imageViewerDesktop ];
      "image/tiff" = [ imageViewerDesktop ];
      "image/webp" = [ imageViewerDesktop ];
      "image/x-portable-anymap" = [ imageViewerDesktop ];
      "image/x-portable-bitmap" = [ imageViewerDesktop ];
      "image/x-portable-graymap" = [ imageViewerDesktop ];
      "image/x-portable-pixmap" = [ imageViewerDesktop ];
      "image/x-xbitmap" = [ imageViewerDesktop ];
      "image/vnd.microsoft.icon" = [ imageViewerDesktop ];
    };
  };

  home.activation.configureDBeaverTheme =
    lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      settingsDir="$HOME/${workspaceSettingsDir}"
      mkdir -p "$settingsDir"
      cat > "$settingsDir/org.jkiss.dbeaver.core.prefs" <<'EOF'
eclipse.preferences.version=1
ui.activeTheme=org.jkiss.dbeaver.ui.theme.dark
EOF
      cat > "$settingsDir/org.eclipse.ui.prefs" <<'EOF'
eclipse.preferences.version=1
themeid=org.jkiss.dbeaver.ui.theme.dark
EOF
    '';
}
