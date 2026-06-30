{ pkgs, ... }: {

  users.users."galvatron" = {
    isNormalUser = true;
    description = "Decepticons";
    extraGroups = [ "networkmanager" "wheel" "video" "audio" ];
    packages = with pkgs; [
      kdePackages.kate
    ];
  };
}
