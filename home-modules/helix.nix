{ pkgs, ... }:

let
  tsserverPath = "${pkgs.nodePackages.typescript}/lib/node_modules/typescript/lib";
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
      language-servers = {
        typescript-language-server = {
          command = "${pkgs.nodePackages.typescript-language-server}/bin/typescript-language-server";
          args = [ "--stdio" "--tsserver-path=${tsserverPath}" ];
        };

        vscode-langservers-extracted = {
          command = "${pkgs.vscode-langservers-extracted}/bin/vscode-langservers-extracted";
          args = [ "--stdio" ];
        };

        tailwindcss-language-server = {
          command = "${pkgs.nodePackages."@tailwindcss/language-server"}/bin/tailwindcss-language-server";
          args = [ "--stdio" ];
        };

        rust-analyzer = {
          command = "${pkgs.rust-analyzer}/bin/rust-analyzer";
        };

        pyright = {
          command = "${pkgs.pyright}/bin/pyright-langserver";
          args = [ "--stdio" ];
        };

        clangd = {
          command = "${pkgs.clang-tools}/bin/clangd";
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
          file-types = [ "js" ];
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
          language-servers = [ "typescript-language-server" ];
          auto-format = true;
          formatter = {
            command = prettier;
            args = [ "--parser" "typescript" ];
          };
        }
        {
          name = "json";
          scope = "source.json";
          file-types = [ "json" ];
          language-servers = [ "vscode-langservers-extracted" ];
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
          language-servers = [ "vscode-langservers-extracted" ];
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
          language-servers = [ "vscode-langservers-extracted" ];
          auto-format = true;
          formatter = {
            command = prettier;
            args = [ "--parser" "css" ];
          };
        }
        {
          name = "tailwindcss";
          scope = "source.css";
          file-types = [ "css" ];
          language-servers = [ "tailwindcss-language-server" ];
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
          auto-format = false;
        }
        {
          name = "python";
          scope = "source.python";
          file-types = [ "py" ];
          language-servers = [ "pyright" ];
          auto-format = true;
          formatter = {
            command = "${pkgs.black}/bin/black";
            args = [ "-" ];
          };
        }
        {
          name = "c";
          scope = "source.c";
          file-types = [ "c" ];
          language-servers = [ "clangd" ];
          auto-format = true;
        }
        {
          name = "cpp";
          scope = "source.cpp";
          file-types = [ "cpp" "cxx" "cc" "c++" "hpp" "hxx" "hh" ];
          language-servers = [ "clangd" ];
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

