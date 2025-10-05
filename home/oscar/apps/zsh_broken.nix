{ config, pkgs, lib, ... }:

let
  # Define the path to your external configuration file (assuming it's managed externally or by Home Manager)
  starshipConfigPath = "${config.home.homeDirectory}/nix-configs/.config/starship.toml";

  # Read the content of the TOML file and parse it into a Nix attribute set
  starshipSettings = lib.pipe starshipConfigPath [
    (path: builtins.readFile path)
    (content: lib.fromTOML content)
  ];
in
{
  # 🐚 Zsh and Plugins (you already have zsh enabled)
  # You already use Cilium as your CNI and Flux for GitOps, which suggests
  # you'll appreciate a clean shell environment!
  # You can enable zsh, syntax highlighting, and autosuggestions like this:
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    # other zsh settings
  };

  programs.zsh.syntaxHighlighting.enable = true;
  programs.zsh.autosuggestion.enable = true;


  # 🌟 Starship Configuration (loaded from external TOML)
  programs.starship = {
    enable = true;
    settings = starshipSettings; # Load the settings from the external file
  };

  # 🔍 Fzf Integration
  programs.fzf = {
    enable = true;
  };

  # 📦 Other packages you might need
  home.packages = with pkgs; [
    # These are often built-in or enabled via modules, but good to check
    # git
    # htop
    # Add back any other utilities you rely on
  ];

  # ⚙️ Ensure your starship.toml exists if you're managing it outside of Home Manager
  # If you want Home Manager to create the file:
  # home.file.".config/starship.toml".source = ./starship.toml;
}
