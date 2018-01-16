{
  network.description = "Test deployment";

  node1 = { config, pkgs, ... }:
  {
    deployment = {
      targetEnv = "None";
    };

    boot.loader.grub.device = "/dev/sda";

    fileSystems."/" = {
      device = "dev/sda1";
      fsType = "ext4";
    };

    environment.systemPackages = with pkgs; [ hello ];

  };

  node2 = { config, pkgs, ... }:
  {
    deployment = {
      targetEnv = "None";
    };

    boot.loader.grub.device = "/dev/sda";

    fileSystems."/" = {
      device = "dev/sda1";
      fsType = "ext4";
    };

    nixpkgs.config.allowUnfree = true;
    environment.systemPackages = with pkgs; [ sublime ];

  };

}

