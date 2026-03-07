{
  flake.modules.homeManager.zed = {
    programs.zed-editor = {
      enable = true;
      extensions = [
        "nix"
        "base16"
        "material-icon-theme"
        "neocmake"
        "just"
        "toml"
        "git-firefly"
        "zig"
      ];

      userSettings = {
        load_direnv = "shell_hook";

        buffer_font_family = "JetBrainsMono Nerd Font";
        buffer_font_size = 16.0;
        buffer_font_features = {
          calt = true;
          zero = true;
        };
        ui_font_size = 16.0;

        theme = "Base16 Mountain";
        icon_theme = {
          mode = "dark";
          dark = "Material Icon Theme";
          light = "Material Icon Theme";
        };

        git = {
          inline_blame.enabled = false;
          enable_status = false;
        };

        lsp = {
          nil = {
            binary = {
              path_lookup = true;
            };
            settings = {
              diagnostics = {
                ignored = [
                  # "unused_binding"
                  "unused_with"
                ];
              };
            };
          };

          nixd = {
            binary = {
              path_lookup = true;
            };
          };

          clangd = {
            binary = {
              arguments = [
                "--clang-tidy"
                "--background-index"
                "--completion-style=detailed"
                "--query-driver=/nix/store/*/bin/*clang*"
              ];
            };
          };

          rust-analyzer = {
            binary = {
              path_lookup = true;
            };
          };

          zls = {
            binary = {
              path_lookup = true;
            };
          };
        };

        languages = {
          Nix = {
            format_on_save = "off";
          };
        };

        agent = {
          default_model = {
            provider = "copilot_chat";
            model = "claude-opus-4.6";
          };
        };

        edit_predictions = {
          provider = "copilot";
        };

        telemetry = {
          diagnostics = false;
          metrics = false;
        };
      };
    };
  };
}
