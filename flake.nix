{
  description = "Personal website and blog built with Hugo";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, ... }:
    let
      systems = [
        "x86_64-linux"
        "aarch64-linux"
      ];
      forAllSystems = fn:
        nixpkgs.lib.genAttrs systems (system: fn nixpkgs.legacyPackages.${system});
    in {
      devShells = forAllSystems (pkgs: {
        default = pkgs.mkShell {
          nativeBuildInputs = with pkgs; [
            hugo
            git
          ];

          shellHook = ''
            echo "Hugo $(hugo version | head -1)"
            echo "Dev server: hugo serve -D"
          '';
        };
      });
    };
}
