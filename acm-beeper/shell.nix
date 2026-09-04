let
  pkgs = import <nixpkgs> {};

  # CoC Config
  cocConfig = pkgs.writeText "coc-settings.json" (
    builtins.toJSON {
      "texlab.path" = "${pkgs.texlab}/bin/texlab";
    }
  );
in
  with pkgs;
  mkShell {
    # https://e.printstacktrace.blog/merging-json-files-recursively-in-the-command-line/
    shellHook = ''
      mkdir -p .vim
      ln -sf ${cocConfig} .vim/coc-settings.json
    '';

    buildInputs = [
      # Core
      gnumake
      neovim
      ripgrep
      rnix-lsp

      # LaTeX
      python38Packages.pygments
      texlive.combined.scheme-full

      # Python
      (
        python38.withPackages (
          ps: with ps; [
            black
            flake8
            jedi
            neovim
          ]
        )
      )
    ];
  }
