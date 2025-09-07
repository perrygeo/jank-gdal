{
  # load environment with `nix develop`
  description = "C++ development environment with GDAL";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = nixpkgs.legacyPackages.${system};
      in {
        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            # C++ compiler and build tools
            gcc
            clang
            cmake
            gnumake
            pkg-config

            # Essential C++ libraries
            gdal

            # Additional useful tools
            gdb
            valgrind
            git
          ];

          shellHook = ''
            echo "C++ GDAL Development Environment"
            echo "GDAL version: $(gdal-config --version)"
            echo "GDAL cflags: $(gdal-config --cflags)"
            echo "GDAL libs: $(gdal-config --libs)"
          '';

          # Set environment variables
          GDAL_DATA = "${pkgs.gdal}/share/gdal";
        };
      });
}
