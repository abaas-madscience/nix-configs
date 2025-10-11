{ config, pkgs, lib, ... }:
{
  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      format = lib.mkForce "$all$directory$git_branch$kubernetes$line_break$character";
      palette = "catppuccin_mocha";
      right_format = "$time";
      character.success = {
        format = "[➜](bold green) ";
      };
      directory = {
        truncation_length = 3;
        truncate_to_repo = true;
      };
      git_branch = {
        format = " [$symbol$branch]($style) ";
        symbol = lib.mkForce "🌱 ";
      };
      kubernetes = {
        format = lib.mkForce " [$symbol$context(/$namespace)]($style) ";
        symbol = "☸ ";
        disabled = false;
      };
    };
  };
}
