{ pkgs, ... }:
let
  manifest = builtins.fromTOML (builtins.readFile ./Cargo.toml);
  package = manifest.package;
in
pkgs.rustPlatform.buildRustPackage {
  pname = package.name;
  version = package.version;

  src = pkgs.lib.cleanSource ./.;
  cargoLock.lockFile = ./Cargo.lock;
}
