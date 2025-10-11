{ pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    autosuggestion.enable = true;
    historySubstringSearch = {
      enable = true;
      caseSensitive = false;
    };
    shellAliases = {
      ll = "ls -lah";
      gs = "git status";
      v = "nvim";
    };
    initExtra = ''
      export EDITOR=nvim

      bindkey '^[[A' history-substring-search-up
      bindkey '^[[B' history-substring-search-down
    '';
  };

  # Starship configuration
  programs.starship = {
    enable = true;
    # Configure it declaratively!
    settings = {
      # Example settings to configure its appearance
      format = "$all";
      directory.truncation_length = 3;
      git_branch.symbol = " ";
      kubernetes.format = "[\\( $symbol$context in $cluster \\)]($style)";
      kubernetes.symbol = "⎈ ";
    };
  };

  # Use minimal packages, letting zsh modules handle their dependencies
  home.packages = with pkgs; [
    zsh
    # Add back the zsh plugins that you want (syntax-highlighting, autosuggestions are now dedicated modules)
  ];
}
