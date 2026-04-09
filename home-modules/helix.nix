{ pkgs, ... }:

let
  prettier = "${pkgs.nodePackages.prettier}/bin/prettier";
in
{
  programs.helix = {
    enable = true;
    package = pkgs.helix;

    settings = {
      editor = {
        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };
        auto-format = true;
        file-picker.hidden = false;
        lsp.display-messages = true;
        soft-wrap.enable = true;
      };
    };

    languages = {
      language-server = {
        typescript-language-server = {
          command = "${pkgs.nodePackages.typescript-language-server}/bin/typescript-language-server";
          args = [ "--stdio" ];
        };

        vscode-json-language-server = {
          command = "${pkgs.vscode-langservers-extracted}/bin/vscode-json-language-server";
          args = [ "--stdio" ];
        };

        vscode-html-language-server = {
          command = "${pkgs.vscode-langservers-extracted}/bin/vscode-html-language-server";
          args = [ "--stdio" ];
        };

        vscode-css-language-server = {
          command = "${pkgs.vscode-langservers-extracted}/bin/vscode-css-language-server";
          args = [ "--stdio" ];
        };

        tailwindcss-language-server = {
          command = "${pkgs.nodePackages."@tailwindcss/language-server"}/bin/tailwindcss-language-server";
          args = [ "--stdio" ];
        };

        rust-analyzer = {
          command = "${pkgs.rust-analyzer}/bin/rust-analyzer";
        };

        gopls = {
          command = "${pkgs.gopls}/bin/gopls";
        };

        nil = {
          command = "${pkgs.nil}/bin/nil";
        };
      };

      language = [
        {
          name = "typescript";
          scope = "source.ts";
          file-types = [ "ts" ];
          language-servers = [ "typescript-language-server" ];
          auto-format = true;
          formatter = {
            command = prettier;
            args = [ "--parser" "typescript" ];
          };
        }
        {
          name = "javascript";
          scope = "source.js";
          file-types = [ "js" "mjs" "cjs" ];
          language-servers = [ "typescript-language-server" ];
          auto-format = true;
          formatter = {
            command = prettier;
            args = [ "--parser" "babel" ];
          };
        }
        {
          name = "tsx";
          scope = "source.tsx";
          file-types = [ "tsx" ];
          language-servers = [ "typescript-language-server" "tailwindcss-language-server" ];
          auto-format = true;
          formatter = {
            command = prettier;
            args = [ "--parser" "typescript" ];
          };
        }
        {
          name = "jsx";
          scope = "source.jsx";
          file-types = [ "jsx" ];
          language-servers = [ "typescript-language-server" "tailwindcss-language-server" ];
          auto-format = true;
          formatter = {
            command = prettier;
            args = [ "--parser" "babel" ];
          };
        }
        {
          name = "json";
          scope = "source.json";
          file-types = [ "json" ];
          language-servers = [ "vscode-json-language-server" ];
          auto-format = true;
          formatter = {
            command = prettier;
            args = [ "--parser" "json" ];
          };
        }
        {
          name = "html";
          scope = "text.html.basic";
          file-types = [ "html" ];
          language-servers = [ "vscode-html-language-server" "tailwindcss-language-server" ];
          auto-format = true;
          formatter = {
            command = prettier;
            args = [ "--parser" "html" ];
          };
        }
        {
          name = "css";
          scope = "source.css";
          file-types = [ "css" ];
          language-servers = [ "vscode-css-language-server" "tailwindcss-language-server" ];
          auto-format = true;
          formatter = {
            command = prettier;
            args = [ "--parser" "css" ];
          };
        }
        {
          name = "rust";
          scope = "source.rust";
          file-types = [ "rs" ];
          language-servers = [ "rust-analyzer" ];
          auto-format = true;
        }
        {
          name = "go";
          scope = "source.go";
          file-types = [ "go" ];
          language-servers = [ "gopls" ];
          auto-format = true;
        }
        {
          name = "nix";
          scope = "source.nix";
          file-types = [ "nix" ];
          language-servers = [ "nil" ];
          auto-format = true;
          formatter = {
            command = "${pkgs.nixpkgs-fmt}/bin/nixpkgs-fmt";
            args = [ ];
          };
        }
      ];
    };
  };
}

