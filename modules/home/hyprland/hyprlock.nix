{username, ...}: {
  programs.hyprlock = {
    enable = true;
    settings = {
      auth = {
        fingerprint.enabled = true;
      };
      background = [
        {
          monitor = " ";
          path = "/home/${username}/Pictures/wallpapers/catppuccin/cat_ef_ign_unsplash46.png";
          color = "$base";
          blur_size = 5;
          blur_passes = 4;
        }
      ];
      label = [
        {
          monitor = " ";
          text = "$TIME";
          color = "$text";
          font_size = 100;
          font_family = "Noto Sans";
          position = "0, 350";
          halign = "center";
          valign = "center";
        }
        {
          monitor = " ";
          text = "Hello $USER!";
          color = "$text";
          font_size = 30;
          font_family = "$font";
          position = "0, 240";
          halign = "center";
          valign = "center";
        }
      ];
      input-field = [
        {
          size = "450, 90";
          outline_thickness = 2;
          dots_size = 0.1;
          dots_spacing = 0.3;
          dots_rounding = -1;
          outer_color = "rgba(9a8d9555)";
          inner_color = "rgba(120F1111)";
          font_color = "rgba(d1c2cbFF)";
          fade_on_empty = true;
          fade_timeout = 1000;
          placeholder_text = "<i>Input Password...</i>";
          hide_input = false;
          rounding = -1;
          check_color = "$peach";
          fail_color = "$red";
          fail_text = "<i>$FAIL <b>($ATTEMPTS)</b></i>";
          fail_transition = 300;
          capslock_color = -1;
          numlock_color = -1;
          bothlock_color = -1;
          invert_numlock = false;
          position = "0, 20";
          halign = "center";
          valign = "center";
        }
      ];
    };
  };
}
