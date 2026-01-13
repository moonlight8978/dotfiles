{...}: {
  system = {
    defaults = {
      trackpad = {
        Clicking = true;
      };

      universalaccess = {
        mouseDriverCursorSize = 1.5;
      };

      ".GlobalPreferences" = {
        "com.apple.mouse.scaling" = 2.0;
      };
    };
  };

  launchd = {
    daemon = {
      limit-maxfiles = {
        serviceConfig = {
          Label = "limit.maxfiles";
          ProgramArguments = ["/bin/launchctl", "limit", "maxfiles", "65536", "200000"];
          RunAtLoad = true;
        };
      };
    };
  };
}
