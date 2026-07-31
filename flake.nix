{
  description = "Shared base modules";

  inputs.nixpkgs-ssh.url = "github:NixOS/nixpkgs/9.7p1";

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
