# Rebuild
sudo nixos-rebuild switch --flake .#laptop

# I want the following build for a brand new NixOs laptop environment
# I will be testing this on a VM to begin with
# Also create a README.MD file on how this should work
# Also create a JUST file with JUST installed to quickly rebuild the flake

Base System & Core Setup
 - Install NixOS (latest unstable) with flakes enabled.
 - Enable systemd-boot and hardware detection (firmware, ucode, etc.).
 - Set hostname, timezone, locales — minimal but consistent.
 - Enable networking with NetworkManager and Bluetooth.
 - Set up GDM + GNOME desktop with Wayland (clean and polished).
 - Remove all base GNOME apps, we will only install what is needed

Hardware Enablement
 - Enable AMD acceleration (Mesa, Vulkan, OpenCL).
 - Configure power management (TLP or auto-cpufreq).
 - Audio stack: PipeWire + WirePlumber.
 - Webcam, and touchpad gestures support.
 - HiDPI scaling and font rendering tweaks.

Development Environment
 - Shell: zsh + starship + fzf + zoxide + bat + eza.
 - When alacritty of kitty starts, also start a TMUX session
 - TMUX should be configured with CTRL-L and H/V for Horizontal/Vertical breaks, it should have mouse support 
 - TMUX should have Cattppuchin look and feel/skin and 
 - Dev editors: Zed, VSCode (codium), micro or helix optional.
 - DB tools: DBeaver, pgAdmin optional.
 - Git setup with delta diff viewer and signing key.
 - Programming languages: Python, Go, NodeJS, Rust, preferred available in a dev shell.
 - Please also make a fee examples of dev shells where I can CD into it and the environment is available.
 - Containers: Podman + Docker compatibility layer.

Kubernetes Tooling
 - kubectl, helm, k9s, kubectx/kubens.
 - Flux CLI, kustomize, yq, jq, stern, cilium CLI.
 - nix-shell auto-env (direnv + nix-develop) → when cd into a directory:
 - Auto-load kube tools from shell.nix
 - Set KUBECONFIG
 - Change prompt to show active kube context and namespace.
 - Cluster mgmt aliases: compact kubectl wrappers, context switchers

Productivity Layer
 - Terminal: Kitty or Alacritty (GPU-accelerated).
 - Clipboard manager, notifications, etc.
 - Browser: Firefox + GNOME keyring integration.
 - Password manager: Bitwarden / 1Password CLI.
 - File sync: Syncthing or Nextcloud client.
 - Backup: restic + cron/systemd timer.

System Polish
 - Theming: GTK + shell theme coherence (Papirus icons, adw-gtk3, some slick looking theme).
 - GNOME extensions: Dash to Dock, Vitals, AppIndicator, User Themes, Caffeine, Hot Edge.
 - Fonts: JetBrainsMono Nerd Font system-wide.
 - Notification sounds and minimal animations.
 - Stylix: unified system theming for GNOME, GTK, Qt, cursor, icons, and fonts — tie it all together with your chosen color scheme (e.g. Catppuccin, Tokyo Night, or a custom one).

“Cool Stuff” Layer
 - Auto environment detection: use direnv + nix-develop for per-project tools.
 - Dynamic shell prompt: show kube context, git branch, nix shell name.
 - Fast search: ripgrep + fzf integration everywhere.
 - System monitoring: btop, fastfetch, gnome-system-monitor.
 - Terminal dashboard: bottom or glances.
 - Custom GNOME keyboard shortcuts (workspace navigation, launcher).

AI Layer
 - AI layer: local ollama or open-source LLM integration with shellgpt
 - AI layer: Install aider

Everything should be broken out in modules/desktop, modules/dev, modules/k8s, etc, etc. Make it logically modular
