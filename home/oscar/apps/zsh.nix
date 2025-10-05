{ pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    autosuggestion.enable = true;
    shellAliases = {
      ll = "ls -lah";
      gs = "git status";
      v = "nvim";
    };
    
    # DEPRECATED: initExtra = ''
    # NEW OPTION:
    initContent = ''
      export EDITOR=nvim
    '';
    
    oh-my-zsh = {
      enable = true;
      # You can often use "powerlevel10k" directly here
      theme = "powerlevel10k/powerlevel10k"; 
      plugins = [ "git" "z" "colored-man-pages" "sudo" ];
    };
  };

  # Assuming you fixed the undefined variable issue by using 'zsh-powerlevel10k'
  home.packages = with pkgs; [ zsh zsh-powerlevel10k ];
}
