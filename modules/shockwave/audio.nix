{ lib, config, ... }: {

  options.modules.audio.enable =
    lib.mkEnableOption "pipewire audio stack";

  config = lib.mkIf config.modules.audio.enable {
    services.pulseaudio.enable = false;
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
  };
}
