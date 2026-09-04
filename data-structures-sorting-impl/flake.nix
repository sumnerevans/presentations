{
  description = "Making Your Home in Nix presentation for LinuxFest Northwest 2023";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
    latex.url = "github:leixb/latex-template";
  };

  outputs = { self, nixpkgs, flake-utils, latex }:
    flake-utils.lib.eachDefaultSystem
      (system:
        let
          pkgs = import nixpkgs { system = system; };
          texlive = pkgs.texlive.combined.scheme-full;
        in
        rec {
          devShell = pkgs.mkShell {
            name = "texlive";
            buildInputs = with pkgs; [
              gnumake
              texlive
              python39Packages.pygments
            ];
          };

          packages.document = latex.lib.latexmk {
            inherit pkgs;
            src = self;
            shellEscape = true;
            minted = true;
            name = "nix-home-manager.pdf";
          };

          defaultPackage = packages.document;
        }
      );
}
