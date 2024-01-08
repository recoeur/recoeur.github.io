{
  description = "Ricur Blog";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }: 
  let 
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    devShells.${system}.default =
      pkgs.mkShell
        { 
          buildInputs = 
            [ 
              pkgs.babashka
              pkgs.hugo
              pkgs.dart-sass
              pkgs.go
            ];
      };
  };
}
