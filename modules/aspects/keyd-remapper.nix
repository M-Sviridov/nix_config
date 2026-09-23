{
  my.keyd-remapper.nixos = {
    services.keyd = {
      enable = true;
      keyboards = {
        default = {
          ids = ["0001:0001:09b4e68d"];
          settings = {
            main = {
              capslock = "overload(control, esc)";
              leftcontrol = "layer(meta)";
              leftmeta = "layer(control)";
              # rightcontrol = "layer(meta)";
              # rightmeta = "layer(control)";
              # leftshift = "oneshot(shift)";
              # rightshift = "oneshot(shift)";
              a = "overloadt(control, a, 150)";
              s = "overloadt(shift, s, 150)";
              d = "overloadt(meta, d, 150)";
              f = "overloadt(alt, f, 150)";
              # j = "overloadt(alt, j, 150)";
              # k = "overloadt(meta, k, 150)";
              # l = "overloadt(shift, l, 150)";
              ";" = "overloadt(control, ;, 150)";
              # v = "overloadt(altgr, v, 150)";
              # m = "overloadt(altgr, m, 150)";
            };
          };
        };

        externalKeyboards = {
          ids = ["04d9:a0d1" "07d7:0000"];
          settings = {
            main = {
              capslock = "overload(control, esc)";
              leftcontrol = "layer(control)";
              leftmeta = "layer(meta)";
              rightcontrol = "layer(control)";
              rightmeta = "layer(meta)";
              # leftshift = "oneshot(shift)";
              # rightshift = "oneshot(shift)";
              a = "overloadt(control, a, 150)";
              s = "overloadt(shift, s, 150)";
              d = "overloadt(meta, d, 150)";
              f = "overloadt(alt, f, 150)";
              j = "overloadt(alt, j, 150)";
              k = "overloadt(meta, k, 150)";
              l = "overloadt(shift, l, 150)";
              ";" = "overloadt(control, ;, 150)";
              v = "overloadt(altgr, v, 150)";
              m = "overloadt(altgr, m, 150)";
            };
          };
        };
      };
    };
  };
}
