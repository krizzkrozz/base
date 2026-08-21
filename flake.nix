{
  description = "Shared base modules";
  # version 9.7p1
  inputs.nixpkgs-ssh.url = "github:NixOS/nixpkgs/a343533bccc62400e8a9560423486a3b6c11a23b";

  outputs =
    { self, nixpkgs-ssh, ... }:
    let
      pkgs-ssh = import nixpkgs-ssh { system = "x86_64-linux"; };
    in
    {
      # nixosModules.opensshPin = { ... };
      packages.x86_64-linux.openssh = pkgs-ssh.openssh;
    };
}
