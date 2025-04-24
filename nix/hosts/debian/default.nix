{ pkgs, home-manager, ... }: 
{
  moonlight = home-manager.lib.homeManagerConfiguration {
    inherit pkgs;

    modules = [ ./home.nix ];
  };
}