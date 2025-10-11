{ config, pkgs, lib, ... }:

let
  defaultOllamaModel = "llama3";
  defaultTemperature = 0.2;
  defaultTopP = 0.95;

  shellGptConfig = {
    default = {
      provider = "ollama";
      model = defaultOllamaModel;
      temperature = defaultTemperature;
      top_p = defaultTopP;
      max_tokens = 4096;
    };
    ollama = {
      api_base = "http://127.0.0.1:11434";
    };
  };

  aiderConfig = {
    model = "ollama/${defaultOllamaModel}";
    "weak-model" = "ollama/${defaultOllamaModel}";
    "editor-model" = "ollama/${defaultOllamaModel}";
    stream = true;
    temperature = defaultTemperature;
    "top-p" = defaultTopP;
    "max-output-tokens" = 4096;
    "openai-api-base" = "http://127.0.0.1:11434/v1";
  };

  tomlFormat = pkgs.formats.toml { };
in
{
  xdg.configFile."shell_gpt/config.toml".source =
    tomlFormat.generate "shell-gpt-config" shellGptConfig;

  home.file.".aider.conf.yml".text =
    lib.generators.toYAML { } aiderConfig;
}
