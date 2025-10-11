{ config, pkgs, lib, ... }:
{
  programs.firefox = {
    enable = true;
    package = pkgs.firefox;
    profiles.default = {
      isDefault = true;
      settings = {
        "browser.startup.homepage" = "about:blank";
      };
    };
  };
}
