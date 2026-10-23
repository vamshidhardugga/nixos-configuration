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
      delve
      gh
      ghostty
      go
      go-task
      golangci-lint
      gopls
      mpv
      nixd
      nixfmt
      nodejs
      obs-studio
      starship
      transmission_4
      unzip
      wl-clipboard
      zed-editor
      zip
    ];
  };
  programs.nix-ld.enable = true;
  programs.starship.enable = true;
}
