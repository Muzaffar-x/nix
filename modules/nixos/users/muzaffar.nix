{
  pkgs,
  inputs,
  outputs,
  ...
}: {
  config = {
    users.users = {
      muzaffar = {
        isNormalUser = true;
        description = "Muzaffar ...";
        initialPassword = "SomeExample";
        openssh.authorizedKeys.keys = [
          "ssh-rsa ..."
        ];
        extraGroups = ["networkmanager" "wheel" "docker" "vboxusers" "admins"];
        packages =
          (with pkgs; [
            telegram-desktop
            discord
          ])
          ++ (with pkgs.unstable; []);
      };
    };

    home-manager = {
      extraSpecialArgs = {inherit inputs outputs;};
      users = {
        muzaffar = import ../../home;
      };
    };
  };
}
