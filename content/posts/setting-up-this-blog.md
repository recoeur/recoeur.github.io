+++
title = 'Setting Up This Blog'
date = 2024-01-08T02:47:15Z
draft = true
+++

## Standard tools

For a while I was proud of being a generalist. When confronted with a problem,
I don't rely on a my expertise with a specific set of tools, because I never
built that experience. I rather rely on being highly adaptive to harness whatever
tools are available.

This is true for programming languages, operating systems, architectural styles,
text editors, etc. I master none!

In 2024 I decided to change that and this blog will document my journey. Starting
for my choice of Nix for configuration management. This blog is the first application
where I'm using Nix to mangage the development environment instead of Docker.

So far it's been really simple. All Hugo dependencies are in the main NixOS repository
so I just had to declare them in my `flake.nix` file like this:

```
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
```

As you can see, another tool I've chosen is Babashka to replace all my scripting.
I hope to replace all my generic use of Make, Bash and YAML with Babashka.
