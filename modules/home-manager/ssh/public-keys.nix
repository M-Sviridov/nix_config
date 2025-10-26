{...}: {
  home.file = {
    ".ssh/id_aopo_prod_ed25519.pub".text = ''
      ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOVRSWYWMcXldUDDUMC2fBltH3EKHcD1xc8WUs88RUTj tsst@AOPO_PROD_ed25519
    '';

    ".ssh/id_github_ed25519.pub".text = ''
      ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEe9tlp6GJUCSXrnyyYt0pjFEFqGV452wJHA9T7gNdko msviridov@GITHUB_ed25519
    '';

    ".ssh/id_home_dmz_ed25519.pub".text = ''
      ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIL8H29fWtGTGJTld7ZctjoquZFS/860umr8XzsVjjjwu msviridov@HOME_DMZ_ed25519
    '';

    ".ssh/id_home_mgmt_ed25519.pub".text = ''
      ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAPN4Q+VTqTm8Zq42cRGLzZeB8TbPAFmjHPEpaeZzY5V msviridov@HOME_MGMT_ed25519
    '';

    ".ssh/id_home_opnsense_ed25519.pub".text = ''
      ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIK0ntgB5X2u7im7Pu0iEGdqeeyAMt5TJRBK/5c84ttAS msviridov@HOME_OPNSENSE_ed25519
    '';

    ".ssh/id_home_prod_ed25519.pub".text = ''
      ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILe+cHeVb5A5bkRiX467Q+o9Hmo8UkBFX3nAlvROhNuL msviridov@HOME_PROD_ed25519
    '';

    ".ssh/id_home_test_ed25519.pub".text = ''
      ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEdNCEeB17KKF3HEqHrsQAjHXuzR9g7VOjRHEV/SW/pN msviridov@HOME_TEST_ed25519
    '';

    ".ssh/pve-club_key.pub".text = ''
      ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICZHB67qFau4obfUvhN/UM2BcKFins690iA6G9nSlez1 msviridov@loki
    '';

    ".ssh/sign_github_ed25519.pub".text = ''
      ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOWVkM3oDqFJ1efHN6A9k802YztirL1drOsSZy2mhlAY msviridov@SIGN_GITHUB_ed25519
    '';
  };
}
