{
  inputs,
  lib,
  ...
}:
{
        programs.zed-editor = {
          enable = true;
          extensions = [
            "docker-compose"
            "dockerfile"
            "git-firefly"
            "graphviz"
            "http"
            "just"
            "latex"
            "make"
            "material-icon-theme"
            "nix"
            "plantuml"
            "pylsp"
            "ruff"
            "toml"
            "typos"
            "typst"
          ];
          userSettings = {
            assistant = {
              default_model = {
                provider = "copilot_chat";
                model = "gpt-4o";
              };
              version = "2";
            };
            file_types = {
              Dockerfile = [ "*Containerfile*" ];
            };
            # assistant = {
            #   default_model = {
            #     provider = "zed.dev";
            #     model = "claude-3-5-sonnet-latest";
            #   };
            #   version = "2";
            # };
            auto_update = false;
            autosave = {
              after_delay = {
                milliseconds = 1000;
              };
            };
            base_keymap = "VSCode";
            ensure_final_newline_on_save = true;
            buffer_font_family = "JetBrainsMono Nerd Font";
            buffer_font_features = {
              calt = true;
              ligatures = true;
            };
            buffer_font_size = 14;
            edit_predictions = {
              disabled_globs = [
                "**/.env*"
                "**/*.pem"
                "**/*.key"
                "**/*.cert"
                "**/*.crt"
                "**/secrets.yml"
              ];
            };
            features = {
              inline_completion_provider = "copilot";
              edit_prediction_provider = "copilot";
            };
            format_on_save = "on";
            hour_format = "hour24";
            icon_theme = {
              mode = "system";
              light = "Material Icon Theme";
              dark = "Material Icon Theme";
            };
            inlay_hints = {
              enable = true;
            };
            languages = {
              Markdown = {
                format_on_save = "on";
                preferred_line_length = 120;
                soft_wrap = "preferred_line_length";
              };
              Nix = {
                language_servers = [
                  "nixd"
                  "!nil"
                ];
              };
            };
            preview_tabs = {
              enabled = true;
              enable_preview_from_file_finder = true;
              enable_preview_from_code_navigation = true;
            };
            show_edit_predictions = true;
            tabs = {
              file_icons = true;
              git_status = true;
            };
            tab_size = 2;
            telemetry = {
              diagnostics = false;
              metrics = false;
            };
            terminal.env = {
              EDITOR = "zed --wait";
              VISUAL = "zed --wait";
            };
            ui_font_family = "Aporetic Sans Mono";
            ui_font_size = 14;
            wrap_guides = [
              80
              120
            ];
          };
        };
      }
