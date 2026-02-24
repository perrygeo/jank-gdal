{
  # load environment with `nix develop`
  description = "C++ development environment with GDAL";

  inputs = {
    # Pin to same nixpkgs commit as jank to ensure GLIBC compatibility
    nixpkgs.url = "github:NixOS/nixpkgs/b579d443b37c9c5373044201ea77604e37e748c8";
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
            leiningen
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
