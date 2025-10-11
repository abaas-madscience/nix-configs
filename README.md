# Oscar’s NixOS Laptop Flake

> A sleek, opinionated NixOS flake that gives you a **dark-purple Catppuccin-themed** GNOME desktop, batteries-included dev tooling, Kubernetes CLI magic, and AI sidekicks—all in one `just rebuild`.

---

## Quick Start (VM or Bare-Metal)

1. **Boot NixOS unstable ISO**  
   https://nixos.org/download.html#nixos-iso

2. **Partition & mount** as usual (`ext4`, one swap).

3. **Clone this flake**  
   ```bash
   sudo nix-shell -p git --run \
     "git clone https://github.com/YOU/YOUR_REPO.git /mnt/etc/nixos"
   ```

4. **Tweak disks**  
   Edit `/mnt/etc/nixos/hosts/laptop/hardware-configuration.nix` and adjust UUIDs.

5. **Install**  
   ```bash
   sudo nixos-install --flake /mnt/etc/nixos#laptop
   reboot
   ```

---

## Daily Workflow

```bash
# one-shot
nix-shell -p just
just rebuild          # sudo nixos-rebuild switch --flake .#laptop
```

---

## What You Get

| Layer | Highlights |
|------|------------|
| **Desktop** | GNOME + Wayland, Catppuccin-Mocha Stylix theme, Dash-to-Dock, Vitals, Caffeine, JetBrainsMono, Papirus icons |
| **Terminal** | Kitty (GPU), Alacritty fallback, Zsh + Starship, TMUX with Catppuccin skin, mouse splits |
| **Dev** | direnv + nix-direnv, fzf, zoxide, bat, eza, ripgrep, fd, bottom, fastfetch |
| **Languages** | Python, Node, Go, Rust, dev shells under `shells/*/` |
| **Containers** | Podman (rootless) + Docker compat |
| **Kubernetes** | kubectl, helm, k9s, kubectx, stern, flux, cilium-cli, kube-prompt in Starship |
| **AI** | ollama (rocm), aider-chat |
| **Power/Audio** | TLP, PipeWire + WirePlumber, AMD GPU (Vulkan, OpenCL) |
| **Apps** | Zed, VS Codium, DBeaver, Firefox, Bitwarden CLI, Syncthing, restic |

---

## Development Shells

```bash
cd shells/python   # auto Python + Poetry
cd shells/rust     # auto Rust + cargo-watch
```

Create new ones:

```bash
cp -r shells/rust shells/go
# edit shells/go/flake.nix
```

---

## Keybinds & Tips

| Key | Action |
|-----|--------|
| **Super** | GNOME launcher |
| **Ctrl-Shift-T** | Launch Kitty |
| **Ctrl-L** (TMUX) | Horizontal split |
| **Ctrl-V** (TMUX) | Vertical split |
| **Alt-Tab** | Window switcher |
| **Prompt** | Shows git, k8s context, time |

---

## Customising

| File | Purpose |
|------|---------|
| `hosts/laptop/configuration.nix` | Host-specific settings |
| `modules/desktop/` | GNOME, Stylix, fonts, themes |
| `modules/dev/` | dev tools, audio, GPU |
| `modules/k8s/` | cluster tooling |
| `modules/ai/` | ollama, aider-chat |
| `home/oscar/apps/` | per-user programs |
| `shells/*/flake.nix` | per-project dev environments |

---

## Troubleshooting

| Problem | Fix |
|---------|-----|
| `ollama` GPU not detected | Ensure ROCm supported card & kernel ≥ 6.5 |
| direnv not activating | `direnv allow` inside project |
| rebuild fails | `nix flake update`, then rebuild |

---

## Updating Inputs

```bash
nix flake update
just rebuild
```

---

## License

MIT – see [LICENSE](./LICENSE).
