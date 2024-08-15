DESCRIPTION = "Add AR0144 Camera Module enablement in isp-imx"

inherit fsl-eula-unpack

SRC_AR0144 = "https://github.com/nxp-imx-support/imx-camera-sw-pack-source.git;protocol=https"
SRC_BRANCH = "LF6.6.3_P24.1"

SRC_URI += " \
	${SRC_AR0144};branch=${SRC_BRANCH};destsuffix=src_ar0144;fsl-eula=true;name=ar0144;subpath=imx8mp-camera-sw-pack-ar0144\
"
SRCREV_FORMAT = "ar0144"
SRCREV_ar0144 = "e74440f9eb9ed03aa00b13b28c37f13f71f6cb77"


FILES_SOLIBS_VERSIONED += " \
    ${libdir}/libar0144.so \
"

S_AR0144 = "${WORKDIR}/src_ar0144/isp-imx"
PATCHTOOL = "git"
do_compile:append () {
	
        cp -r ${S_AR0144}/*  ${S}/
	cd ${S}/
	git apply  ar0144_isp-imx.patch 
	
        cd ${B}/
        cmake_do_compile
}
