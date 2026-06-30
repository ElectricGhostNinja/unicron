{ lib, config, ... }: {

  options.modules.networking = {
    enable = lib.mkEnableOption "networking (NetworkManager + firewall)";
    hostName = lib.mkOption {
      type = lib.types.str;
      description = "Hostname for this machine";
    };
  };

  config = lib.mkIf config.modules.networking.enable {
    networking.hostName = config.modules.networking.hostName;
    networking.networkmanager.enable = true;

    networking.firewall.enable = true;
    # KDE Connect + Jellyfin
    networking.firewall.allowedTCPPorts = [ 1714 8096 8920 ];
    networking.firewall.allowedTCPPortRanges = [
      { from = 1714; to = 1764; }
    ];
    networking.firewall.allowedUDPPortRanges = [
      { from = 1714; to = 1764; }
    ];
    networking.firewall.allowedUDPPorts = [ 1900 7359 ];
  };
}
