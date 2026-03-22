# /etc/nixos/pc.nix
{ pkgs, ... }:

{
  virtualisation = {
    containers.enable = true;
    podman = {
      enable = true;
      dockerCompat = true;
      defaultNetwork.settings.dns_enabled = true; # Required for containers under podman-compose to be able to talk to each other.
    };
  };
  networking.networkmanager = {
    enable = true;
    dns = "systemd-resolved"; # Key: NM hands DNS to resolved
  };

  services.resolved = {
    enable = true;
    domains = [ "~." ]; # Force global routing over DHCP
    extraConfig = ''
      DNS=8.8.8.8 8.8.4.4
      Domains=~blizzard.com ~battle.net
    '';
  };

  environment.shellAliases = {
    comfyui-gpu = ''
      podman run -it --rm \
        --name comfyui-rocm \
        --device=/dev/kfd --device=/dev/dri \
        --group-add=26 --group-add=303 \
        --ipc=host --cap-add=SYS_PTRACE \
        --security-opt seccomp=unconfined --security-opt label=disable \
        -p 8188:8188 \
        -v "$(pwd)"/storage:/root \
        -v "$(pwd)"/storage-models/models:/root/ComfyUI/models \
        -e HSA_OVERRIDE_GFX_VERSION="11.0.0" \
        -e TORCH_ROCM_AOTRITON_ENABLE_EXPERIMENTAL=1 \
        -e CLI_ARGS="--lowvram --force-fp16 --use-pytorch-cross-attention" \
        docker.io/yanwk/comfyui-boot:rocm
    '';
  };

}
