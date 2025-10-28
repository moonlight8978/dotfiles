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

      CustomUserPreferences = {
        "com.apple.symbolichotkeys" = {
          AppleSymbolicHotKeys = {
            "32" = {
              enabled = false;
              value = { type = "standard"; parameters = [65535 126 8650752]; };
            };
            "25" = { enabled = false; };
            "18" = { enabled = false; };
            "33" = {
              enabled = false;
                value = { type = "standard"; parameters = [65535 125 8650752]; };
            };
            "26" = { enabled = false; };
            "19" = { enabled = false; };
            "79" = {
              enabled = false;
              value = { type = "standard"; parameters = [65535 123 8650752]; };
            };
            "20" = { enabled = false; };
            "80" = {
              enabled = true;
              value = { type = "standard"; parameters = [65535 123 8781824]; };
            };
            "21" = { enabled = false; };
            "81" = {
              enabled = false;
              value = { type = "standard"; parameters = [65535 124 8650752]; };
            };
            "118" = {
              enabled = false;
              value = { type = "standard"; parameters = [65535 18 262144]; };
            };
            "22" = { enabled = false; };
            "15" = { enabled = false; };
            "82" = {
              enabled = true;
              value = { type = "standard"; parameters = [65535 124 8781824]; };
            };
            "60" = {
              enabled = true;
              value = { type = "standard"; parameters = [32 49 393216]; };
            };
            "16" = { enabled = false; };
            "23" = { enabled = false; };
            "164" = {
              enabled = true;
              value = { type = "modifier"; parameters = [262144 4294705151]; };
            };
            "119" = {
              enabled = false;
              value = { type = "standard"; parameters = [65535 19 262144]; };
            };
            "61" = {
              value = { type = "standard"; parameters = [32 49 786432]; };
              enabled = true;
            };
            "17" = { enabled = false; };
            "24" = { enabled = false; };
          };
        };
      };
    };
  };
}
