{ pkgs, ... }:

{
  virtualisation.docker = {
    enable = true;
    enableOnBoot = false;
    autoPrune = {
      enable = true;
      dates = "weekly";
    };
    daemon.settings = {
      features.buildkit = true;
      live-restore = true;
      log-driver = "json-file";
      log-opts = {
        max-size = "10m";
        max-file = "5";
      };
    };
  };
  users.users.vamshidhardugga = {
    isNormalUser = true;
    description = "Vamshidhar Reddy Dugga";
    shell = pkgs.bash;
    extraGroups = [
      "wheel"
      "networkmanager"
      "docker"
    ];
    packages = with pkgs; [
      brave-origin
      devenv
      gh
      ghostty
      mpv
      nixd
      nixfmt
      obs-studio
      starship
      transmission_4
      unzip
      vscode
      wl-clipboard
      zip
    ];
  };
  programs.nix-ld.enable = true;
}
