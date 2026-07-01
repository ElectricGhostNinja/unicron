{ lib, config, ... }: {

  options.modules.hm.git = {
    enable = lib.mkEnableOption "git configuration";
    userName = lib.mkOption {
      type = lib.types.str;
      default = "galvatron";
    };
    userEmail = lib.mkOption {
      type = lib.types.str;
      default = "galvatron@unicron.local";
    };
    signingKey = lib.mkOption {
      type = lib.types.nullOr lib.types.str;
      default = null;
      description = "GPG key ID for commit signing, e.g. \"ABCD1234EFGH5678\" from `gpg --list-secret-keys --keyid-format=long`. Leave null to disable signing.";
    };
  };

  config = lib.mkIf config.modules.hm.git.enable {
    programs.git = {
      enable = true;
      userName = config.modules.hm.git.userName;
      userEmail = config.modules.hm.git.userEmail;
      signing = lib.mkIf (config.modules.hm.git.signingKey != null) {
        key = config.modules.hm.git.signingKey;
        signByDefault = true;
      };
      settings = {
        init.defaultBranch = "main";
        pull.rebase = true;
        push.autoSetupRemote = true;
      };
    };
  };
}
