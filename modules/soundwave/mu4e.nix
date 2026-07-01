{ lib, config, pkgs, ... }:

let
  cfg = config.modules.hm.mu4e;

  accountModule = { name, ... }: {
    options = {
      realName = lib.mkOption {
        type = lib.types.str;
        description = "Display name used as the From: header for this account.";
      };

      address = lib.mkOption {
        type = lib.types.str;
        description = "Email address for this account.";
      };

      userName = lib.mkOption {
        type = lib.types.str;
        default = config.modules.hm.mu4e.accounts.${name}.address;
        description = "IMAP/SMTP login username, if different from the address.";
      };

      imapHost = lib.mkOption {
        type = lib.types.str;
        description = "IMAP server hostname, e.g. imap.fastmail.com";
      };

      smtpHost = lib.mkOption {
        type = lib.types.str;
        description = "SMTP server hostname, e.g. smtp.fastmail.com";
      };

      passwordCommand = lib.mkOption {
        type = lib.types.str;
        description = ''
          Shell command that prints this account's password/app-password
          to stdout. e.g. "pass show mail/work" or
          "gpg --decrypt ~/.mail-work.gpg".
        '';
      };

      primary = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = ''
          Mark this as the primary account. Exactly one account must
          have this set to true.
        '';
      };
    };
  };

in {

  options.modules.hm.mu4e = {
    enable = lib.mkEnableOption "mu4e mail (mbsync + mu + msmtp, wired into Doom Emacs)";

    maildir = lib.mkOption {
      type = lib.types.str;
      default = "${config.home.homeDirectory}/Mail";
      description = "Root maildir directory mu/mbsync will sync into. Each account gets a subfolder named after its attribute key.";
    };

    accounts = lib.mkOption {
      type = lib.types.attrsOf (lib.types.submodule accountModule);
      default = { };
      description = "Email accounts to configure, keyed by a short identifier (e.g. \"personal\", \"work\").";
    };
  };

  config = lib.mkIf cfg.enable {

    assertions = [
      {
        assertion = (lib.count (a: a.primary) (lib.attrValues cfg.accounts)) == 1;
        message = "modules.hm.mu4e: exactly one account must have primary = true.";
      }
    ];

    accounts.email.maildirBasePath = cfg.maildir;

    accounts.email.accounts = lib.mapAttrs (accName: acc: {
      primary = acc.primary;
      realName = acc.realName;
      address = acc.address;
      userName = acc.userName;
      passwordCommand = acc.passwordCommand;

      maildir.path = accName;

      mbsync = {
        enable = true;
        create = "maildir";
        expunge = "both";
        patterns = [ "*" ];
      };

      mu.enable = true;
      msmtp.enable = true;

      imap.host = acc.imapHost;
      smtp.host = acc.smtpHost;
    }) cfg.accounts;

    programs.mbsync.enable = true;
    programs.mu.enable = true;
    programs.msmtp.enable = true;

    # Periodic background sync for every configured account.
    services.mbsync = {
      enable = true;
      frequency = "*:0/5"; # every 5 minutes
      postExec = "${pkgs.mu}/bin/mu index --maildir=${cfg.maildir}";
    };
  };
}
