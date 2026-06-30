{ config, ... }: {
  networking.wg-quick.interfaces.privado-sea = {
    address = [ "100.64.87.158/32" ];
    dns = [ "9.9.9.9" "149.112.112.112" ];   # overriding Privado's pushed DNS with Quad9
    privateKeyFile = "/etc/nixos/secrets/privado-sea023.key";

    peers = [
      {
        publicKey = "KgTUh3KLijVluDvNpzDCJJfrJ7EyLzYLmdHCksG4sRg=";
        allowedIPs = [ "0.0.0.0/0" ];
        endpoint = "45.38.15.64:51820";
        persistentKeepalive = 25;
      }
    ];
  };
}
