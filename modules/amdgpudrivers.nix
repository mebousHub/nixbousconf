{ config, pkgs, ... }:

{

# The kernel can load the correct driver right away: 
boot.initrd.kernelModules = [ "amdgpu" ];

# make sure xserver uses amdgpu drivers
services.xserver.videoDrivers = [ "amdgpu" ];
}
