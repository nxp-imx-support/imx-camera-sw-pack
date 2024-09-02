DESCRIPTION = "Add OV5647 Camera Module enablement in linux-imx"

SRC_OV5647 = "git://github.com/nxp-imx-support/imx-camera-sw-pack-source.git;protocol=https"
SRC_BRANCH = "LF6.6.3_P24.1"

SRC_URI += " \
        ${SRC_OV5647};branch=${SRC_BRANCH};destsuffix=src_ov5647;name=ov5647;subpath=imx8mp-camera-sw-pack-ov5647\
"
SRCREV_FORMAT = "ov5647"
SRCREV_ov5647 = "e74440f9eb9ed03aa00b13b28c37f13f71f6cb77"

S_OV5647 = "${WORKDIR}/src_ov5647/linux-imx"
PATCHTOOL = "git"
do_patch:prepend() {
        
        cp ${S_OV5647}/imx8mp-evk-ov5647.dts ${S}/arch/arm64/boot/dts/freescale/
        
        cp ${S_OV5647}/ov5647_linux-imx.patch ${S}/
        cd ${S}
        git apply ov5647_linux-imx.patch
        
}
