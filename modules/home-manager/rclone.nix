{...}: {
  programs.rclone = {
    enable = true;

    remotes.protondrive = {
      mounts = {
        "protondrive" = {
          mountPoint = "/home/msviridov/proton-drive";
        };
      };
    };
  };
}
