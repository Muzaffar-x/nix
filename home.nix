{
  inputs,
  lib,
  pkgs,
  config,
  outputs,
  packages,
  ...
}: {
  imports = [
    outputs.homeManagerModules.zsh
  ];

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # Add overlays your own flake exports (from overlays and pkgs dir):
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages
    ];

    # Configure your nixpkgs instance
    config = {
      # Wallahi, forgive me RMS...
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = _: true;
      # Let the system use fucked up programs
      allowBroken = true;
    };
  };

  # This is required information for home-manager to do its job
  home = {
    stateVersion = "24.05";
    username = "muzaffar";
    homeDirectory = "/home/muzaffar";

    # Don't check if home manager is same as nixpkgs
    enableNixpkgsReleaseCheck = false;
  };

  # Let's enable home-manager
  programs.home-manager.enable = true;
}
