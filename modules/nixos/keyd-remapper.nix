{...}: {
  services.keyd = {
    enable = true;
    keyboards = {
      default = {
        ids = ["0001:0001:70533846"];
        settings = {
          main = {
            capslock = "overload(control, esc)";
            leftcontrol = "layer(meta)";
            leftmeta = "layer(control)";
            rightcontrol = "layer(meta)";
            rightmeta = "layer(control)";
            leftshift = "oneshot(shift)";
            rightshift = "oneshot(shift)";
            a = "overloadt(control, a, 200)";
            s = "overloadt(shift, s, 200)";
            d = "overloadt(meta, d, 200)";
            f = "overloadt(alt, f, 200)";
            # j = "overloadt(alt, j, 200)";
            # k = "overloadt(meta, k, 200)";
            # l = "overloadt(shift, l, 200)";
            ";" = "overloadt(control, ;, 200)";
            # v = "overloadt(altgr, v, 200)";
            # m = "overloadt(altgr, m, 200)";
          };
        };
      };

      externalKeyboard = {
        ids = ["04d9:a0d1"];
        settings = {
          main = {
            capslock = "overload(control, esc)";
            leftcontrol = "layer(control)";
            leftmeta = "layer(meta)";
            rightcontrol = "layer(control)";
            rightmeta = "layer(meta)";
            # leftshift = "oneshot(shift)";
            # rightshift = "oneshot(shift)";
            # a = "overloadt(control, a, 200)";
            s = "overloadt(shift, s, 200)";
            d = "overloadt(meta, d, 200)";
            f = "overloadt(alt, f, 200)";
            # j = "overloadt(alt, j, 200)";
            # k = "overloadt(meta, k, 200)";
            # l = "overloadt(shift, l, 200)";
            ";" = "overloadt(control, ;, 200)";
            # v = "overloadt(altgr, v, 200)";
            # m = "overloadt(altgr, m, 200)";
          };
        };
      };
    };
  };
}
