{ pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    autosuggestion.enable = true;
    historySubstringSearch.enable = true;
    shellAliases = {
      ll = "ls -lah";
      gs = "git status";
      v = "nvim";
    };
    initContent = ''
      export EDITOR=nvim

      autoload -Uz up-line-or-history down-line-or-history
      zmodload zsh/terminfo

      if (( $+commands[fzf] )); then
        history_prefix_fzf_widget() {
          emulate -L zsh
          local prefix=$LBUFFER
          local selected
          selected=$(
            fc -rl 1 |
              sed 's/^[[:space:]]*[0-9]\+[[:space:]]*//' |
              awk -v prefix="$prefix" '
                prefix == "" { print; next }
                index($0, prefix) == 1 { print }
              ' |
              fzf --tac --no-sort --query "$prefix" --prompt="history> " --height=40% --layout=reverse --border
          ) || return
          if [[ -n $selected ]]; then
            BUFFER=$selected
            CURSOR=''${#BUFFER}
          fi
        }
        zle -N history_prefix_fzf_widget
        if [[ -n ${terminfo[kcuu1]} ]]; then
          bindkey "${terminfo[kcuu1]}" history_prefix_fzf_widget
        else
          bindkey '^[[A' history_prefix_fzf_widget
        fi
        if [[ -n ${terminfo[kcud1]} ]]; then
          bindkey "${terminfo[kcud1]}" history_prefix_fzf_widget
        else
          bindkey '^[[B' history_prefix_fzf_widget
        fi
      else
        if [[ -n ${terminfo[kcuu1]} ]]; then
          bindkey "${terminfo[kcuu1]}" history-substring-search-up
        else
          bindkey '^[[A' history-substring-search-up
        fi
        if [[ -n ${terminfo[kcud1]} ]]; then
          bindkey "${terminfo[kcud1]}" history-substring-search-down
        else
          bindkey '^[[B' history-substring-search-down
        fi
      fi
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
