DESCRIPTION = "Add OV5647 Camera Module enablement in isp-imx"

inherit fsl-eula-unpack

SRC_OV5647 = "git://github.com/nxp-imx-support/imx-camera-sw-pack-source.git;protocol=https"
SRC_BRANCH = "LF6.6.3_P24.1"

SRC_URI += " \
	${SRC_OV5647};branch=${SRC_BRANCH};destsuffix=src_ov5647;fsl-eula=true;name=ov5647;subpath=imx8mp-camera-sw-pack-ov5647\
"
SRCREV_FORMAT = "ov5647"
SRCREV_ov5647 = "e74440f9eb9ed03aa00b13b28c37f13f71f6cb77"

FILES_SOLIBS_VERSIONED += " \
    ${libdir}/libov5647.so \
"

S_OV5647 = "${WORKDIR}/src_ov5647/isp-imx"
PATCHTOOL = "git"
do_compile:append () {
	
        cp -r ${S_OV5647}/*  ${S}/
        cd ${S}/
        
        git apply ov5647_isp-imx.patch
        cd ${B}/
        cmake_do_compile
}

