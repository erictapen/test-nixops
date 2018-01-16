{
  network.description = "Test deployment";

  node1 = { config, pkgs, ... }:
  {
    deployment = {
      targetEnv = "virtualbox";
      virtualbox = {
        memorySize = 512;
        vcpu = 1;
        headless = true;
      };
    };

    environment.systemPackages = with pkgs; [ hello ];

  };

  node2 = { config, pkgs, ... }:
  {
    deployment = {
      targetEnv = "virtualbox";
      virtualbox = {
        memorySize = 512;
        vcpu = 1;
        headless = true;
      };
    };

    nixpkgs.config.allowUnfree = true;
    environment.systemPackages = with pkgs; [ sublime ];

  };

}

