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
      eval "$(direnv hook zsh)"

      autoload -Uz up-line-or-history down-line-or-history
      zmodload zsh/terminfo

      if (( $+commands[fzf] )); then
        history_prefix_fzf_widget() {
          emulate -L zsh
          setopt localoptions pipefail
          local prefix=$LBUFFER
          if [[ -z $prefix ]]; then
            zle up-line-or-history
            return
          fi
          local selected
          selected=$(
            fc -rl 1 |
              sed 's/^[[:space:]]*[0-9]\+[[:space:]]*//' |
              awk -v prefix="$prefix" '
                prefix == "" { print; next }
                index($0, prefix) == 1 { print }
              ' |
              fzf --no-sort --query "$prefix" --prompt="history> " --height=40% --layout=reverse --border
          ) || return
          selected=''${selected//\\n/ }
          BUFFER=$selected
          CURSOR=''${#BUFFER}
        }
        zle -N history_prefix_fzf_widget
        if [[ -n ''${terminfo[kcuu1]-} ]]; then
          bindkey "''${terminfo[kcuu1]}" history_prefix_fzf_widget
        else
          bindkey '^[[A' history_prefix_fzf_widget
        fi
        if [[ -n ''${terminfo[kcud1]-} ]]; then
          bindkey "''${terminfo[kcud1]}" history_prefix_fzf_widget
        else
          bindkey '^[[B' history_prefix_fzf_widget
        fi
      else
        if [[ -n ''${terminfo[kcuu1]-} ]]; then
          bindkey "''${terminfo[kcuu1]}" history-substring-search-up
        else
          bindkey '^[[A' history-substring-search-up
        fi
        if [[ -n ''${terminfo[kcud1]-} ]]; then
          bindkey "''${terminfo[kcud1]}" history-substring-search-down
        else
          bindkey '^[[B' history-substring-search-down
        fi
      fi
    '';
  };

  programs.starship = {
    enable = true;
    settings = {
      format = "$all";
      directory.truncation_length = 3;
      git_branch.symbol = " ";
      kubernetes.format = "[\\( $symbol$context in $cluster \\)]($style)";
      kubernetes.symbol = "⎈ ";
    };
  };

  home.packages = with pkgs; [
    zsh
  ];
}
