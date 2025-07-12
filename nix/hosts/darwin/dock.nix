{ pkgs }: 
{
  system = {
    defaults = {
      dock = {
        autohide = false;
        launchanim = true;

        magnification= true;
        largesize = 32;

        mineffect = "scale";
        minimize-to-application = true;

      };
    };
  };
}
