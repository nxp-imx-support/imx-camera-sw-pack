DESCRIPTION = "Add IMX219 Camera Module enablement in linux-imx"

SRC_IMX219 = "https://github.com/nxp-imx-support/imx-camera-sw-pack-source.git;protocol=https"
SRC_BRANCH = "LF6.6.3_P24.1"

SRC_URI += " \
        ${SRC_IMX219};branch=${SRC_BRANCH};destsuffix=src_imx219;name=imx219;subpath=imx8mp-camera-sw-pack-imx219\
"
SRCREV_FORMAT = "imx219"
SRCREV_imx219 = "e74440f9eb9ed03aa00b13b28c37f13f71f6cb77"

S_IMX219 = "${WORKDIR}/src_imx219/linux-imx"
PATCHTOOL = "git"
do_patch:append() {
       
        cp ${S_IMX219}/imx8mp-evk-imx219.dts ${S}/arch/arm64/boot/dts/freescale/
        cp ${S_IMX219}/imx219_linux-imx.patch ${S}/
        cd ${S}
        git apply imx219_linux-imx.patch
}

