# programs.vesktop = {
#   enable = true; # this installs vesktop
#   theme = ''
#     /* this sets up a css file for vesktop to use */
#     body { background-color: red; }
#   '';
#   settings = { customTitleBar = true; }; # this makes settings
# };

{
  lib,
  config,
  pkgs,
  ...
}:
let
  inherit (lib)
    mkIf
    mkEnableOption
    mkOption
    types
    concatStrings
    ;
  cfg = config.programs.vesktop;
in
{
  options.programs.vesktop = {
    enable = mkEnableOption "Enable Vesktop";
    settings = mkOption {
      type =
        with types;
        attrsOf (oneOf [
          int
          float
          bool
          str
        ]);
      default = { };
      description = "Provides settings in the `vesktop.json` file.";
    };
    theme = mkOption {
      type = types.lines;
      default = " ";
      description = ''
        Set a custom CSS for Vesktop.
      '';
    };
  };

  config = mkIf cfg.enable {
    home.packages = [ pkgs.vesktop ];

    xdg.configFile = {
      "vesktop/themes/output.css".text = concatStrings [
        ''
          /**
          * @name Some Theme
          * @author Home Manager
          * @version 0.0.0
          * @description This theme was automatically generated by Home Manager.
          */
        ''
        cfg.theme
      ];
      "vesktop/settings.json".text = builtins.toJSON cfg.settings;
    };
  };
}
