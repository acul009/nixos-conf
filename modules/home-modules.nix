{ lib, ... }:
{
  imports = builtins.filter (lib.hasSuffix ".nix") (lib.filesystem.listFilesRecursive ./home);
}
