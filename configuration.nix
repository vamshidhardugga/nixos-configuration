{ lib, pkgs, ... }:

{
  system.stateVersion = "26.05";
  nix = {
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      auto-optimise-store = true;
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };
  nixpkgs.config.allowUnfree = true;
  documentation.nixos.enable = false;
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };
  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
    firewall.enable = true;
  };
  time.timeZone = "Asia/Kolkata";
  i18n.defaultLocale = "en_US.UTF-8";
  hardware = {
    cpu.intel.updateMicrocode = true;
    enableRedistributableFirmware = true;
    bluetooth.enable = true;
    bluetooth.powerOnBoot = true;
    graphics = {
      enable = true;
      extraPackages = [ pkgs.intel-media-driver ];
    };
  };
  security.rtkit.enable = true;
  services.fstrim.enable = true;
  services.power-profiles-daemon.enable = true;
  services.gvfs.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    jack.enable = true;
    pulse.enable = true;
  };
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;
  services.gnome = {
    core-apps.enable = false;
    core-developer-tools.enable = false;
    games.enable = false;
  };
  services.gnome.evolution-data-server.enable = lib.mkForce false;
  environment.gnome.excludePackages = with pkgs; [ gnome-tour ];
  environment.systemPackages = with pkgs; [
    curl
    git
    nautilus
  ];
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
    nerd-fonts.jetbrains-mono
  ];
}
