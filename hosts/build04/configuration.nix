{ inputs, ... }:
{
  imports = [
    inputs.srvos.nixosModules.hardware-hetzner-online-arm
    inputs.self.nixosModules.disko-raid
    inputs.self.nixosModules.common
    inputs.self.nixosModules.builder
    inputs.self.nixosModules.hercules-ci
    inputs.self.nixosModules.remote-builder
  ];

  nixCommunity.disko.raidLevel = 0; # more disk space, we don't have much state to restore anyway

  networking.hostName = "build04";

  system.stateVersion = "23.11";

  systemd.network.networks."10-uplink".networkConfig.Address = "2a01:4f9:3051:3962::2";
}
