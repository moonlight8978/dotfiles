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

        # Lock screen
        wvous-tr-corner = 13;

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
            app = "/Applications/Microsoft Edge.app";
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
            app = "/Applications/MarkText.app";
          }
          {
            app = "/Applications/Medis.app";
          }
          {
            app = "/Applications/TablePlus.app";
          }
          {
            app = "/Applications/Yakk.app";
          }
          {
            app = "/Applications/OpenVPN Connect/OpenVPN Connect.app";
          }
          {
            app = "/Applications/RustDesk.app";
          }
        ];
      };
    };
  };
}
