{ pkgs, ... }:

{
  virtualisation.podman = {
    enable = true;
    autoPrune.enable = true;
    defaultNetwork.settings.dns_enabled = true;
  };
  users.users.vamshidhardugga = {
    isNormalUser = true;
    description = "Vamshidhar Reddy Dugga";
    shell = pkgs.bash;
    extraGroups = [
      "wheel"
      "networkmanager"
    ];
    packages = with pkgs; [
      brave-origin
      delve
      gh
      ghostty
      gnumake
      go
      golangci-lint
      gopls
      mpv
      nodejs
      obs-studio
      podman-compose
      starship
      transmission_4
      vscode
      wl-clipboard
    ];
  };
}
