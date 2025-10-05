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
    initExtra = ''
      export EDITOR=nvim
    '';
    oh-my-zsh = {
      enable = true;
      theme = "powerlevel10k/powerlevel10k";
      plugins = [ "git" "z" "colored-man-pages" "sudo" ];
    };
  };

  home.packages = with pkgs; [ zsh powerlevel10k ];
}
