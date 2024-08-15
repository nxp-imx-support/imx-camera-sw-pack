# i.MX Camera Software Pack - Meta Layers
This layer enables OV5647 camera sensor utilizing i.MX 8M Plus internal ISP (Image Signal Processor).

Fetch source files from [imx8mp-camera-sw-pack-ov5647](https://github.com/nxp-imx-support/imx-camera-sw-pack-source/imx8mp-camera-sw-pack-ov5647.git) repository and build a *imx-image-full* Yocto Image

## 1. Compile i.MX 8M Plus EVK Yocto Image with OV5647 enabled
    $ source sources/meta-imx8mp-isp-ov5647/setup/setup-env-imx8mp-ov5647 -b build
    $ bitbake imx-image-full

## 2. Test
a. plug ov5647 sensor to the i.MX 8M Plus EVK board MIPI CSI1 with xRPI-CAM-MINISAS adaptor 
b. Flash a Micro SD card with the image in build/tmp/deploy
c. set device tree in uboot:

    u-boot => setenv fdtfile imx8mp-evk-ov5647.dtb
    u-boot => saveenv
    Saving Environment to MMC... Writing to MMC(1)... OK
    u-boot => boot

d. identify v4l2 capture device id for VIV (platform:viv0)

    root@imx8mp-lpddr4-evk:~# v4l2-ctl --list-devices
    
         VIV (platform:viv0):
	        /dev/video3

e. Test with gstreamer
    
    root@imx8mp-lpddr4-evk:~# gst-launch-1.0 v4l2src device=/dev/video3 ! "video/x-raw ,format=YUY2, width=1920, height=1080" ! waylandsink

For detailed steps, please refer to [i.MX Camera Software Pack App Note](https://www.nxp.com/docs/en/application-note/AN14376.pdf)
