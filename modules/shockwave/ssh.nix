{ lib, config, ... }: {

  options.modules.ssh.enable =
    lib.mkEnableOption "OpenSSH daemon";

  config = lib.mkIf config.modules.ssh.enable {
    services.openssh.enable = true;
  };
}
