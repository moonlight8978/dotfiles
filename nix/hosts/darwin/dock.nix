{...}: {
  system = {
    defaults = {
      dock = {
        autohide = false;
        launchanim = true;
        orientation = "bottom";

        magnification = true;
        tilesize = 42;
        largesize = 56;

        mineffect = "scale";
        minimize-to-application = true;

        show-process-indicators = true;
        show-recents = false;

        persistent-apps = [
          {
            app = "/System/Applications/Launchpad.app";
          }
          {
            app = "/System/Applications/App Store.app";
          }
          {
            app = "/System/Applications/System Settings.app";
          }
          {
            app = "/System/Applications/Calendar.app";
          }

          {
            app = "/Applications/Telegram.app";
          }
          {
            app = "/Applications/Google Chrome.app";
          }

          {
            app = "/Applications/Ghostty.app";
          }
          {
            app = "/Applications/Visual Studio Code.app";
          }
          {
            app = "/Applications/Cursor.app";
          }
          {
            app = "/Applications/Medis.app";
          }
          {
            app = "/Applications/TablePlus.app";
          }
          {
            app = "/Applications/Postman.app";
          }
          {
            app = "/Applications/OpenVPN Connect/OpenVPN Connect.app";
          }
        ];
      };
    };
  };
}
