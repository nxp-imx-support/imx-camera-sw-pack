DESCRIPTION = "Add AR0144 Camera Module enablement in linux-imx"

SRC_AR0144 = "https://github.com/nxp-imx-support/imx-camera-sw-pack-source.git;protocol=https"
SRC_BRANCH = "LF6.6.3_P24.1"

SRC_URI += " \
        ${SRC_AR0144};branch=${SRC_BRANCH};destsuffix=src_ar0144;name=ar0144;subpath=imx8mp-camera-sw-pack-ar0144\
"
SRCREV_FORMAT = "ar0144"
SRCREV_ar0144 = "e74440f9eb9ed03aa00b13b28c37f13f71f6cb77"

S_AR0144 = "${WORKDIR}/src_ar0144/linux-imx"
PATCHTOOL = "git"
do_patch:append() {
       
        cp ${S_AR0144}/imx8mp-evk-ar0144.dts ${S}/arch/arm64/boot/dts/freescale/
        cp ${S_AR0144}/ar0144_linux-imx.patch ${S}/
        cd ${S}
        git apply ar0144_linux-imx.patch
}
