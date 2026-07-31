{
  description = "Shared base modules";
  # version 9.7p1
  inputs.nixpkgs-ssh.url = "github:NixOS/nixpkgs/a343533bccc62400e8a9560423486a3b6c11a23b";
  outputs = { self, nixpkgs-ssh, ... }: {
    nixosModules.opensshPin =
      { pkgs, lib, ... }:
      let
        pkgs-ssh = import nixpkgs-ssh { system = pkgs.system; };
      in
      {
        environment.systemPackages = [ pkgs-ssh.openssh ];
        # services.openssh.package = lib.mkDefault pkgs-ssh.openssh; # mkDefault make it overridable
        services.openssh.package = pkgs-ssh.openssh; # needs to be overriden by mkForc
      };
  };
}
