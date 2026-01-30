{
  description = "Theseus - A template for a university thesis or academic paper";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
    tytanic = {
      url = "github:typst-community/tytanic/v0.3.1";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, tytanic, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
      in {
        devShells.default = pkgs.mkShell {
          name = "theseus";
          packages = with pkgs; [
            typst
            tinymist
            typstyle
            tytanic.outputs.packages.${system}.default
            just
          ];

          shellHook = "unset SOURCE_DATE_EPOCH";
        };
      }
    );
}
