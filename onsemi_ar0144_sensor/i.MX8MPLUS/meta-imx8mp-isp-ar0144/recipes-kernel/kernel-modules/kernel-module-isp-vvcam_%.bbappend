DESCRIPTION = "Add AR0144 Camera Module enablement in isp-vvcam"

SRC_AR0144 = "git://github.com/nxp-imx-support/imx-camera-sw-pack-source.git;protocol=https"
SRC_BRANCH = "LF6.6.3_P24.1"

SRC_URI += " \
        ${SRC_AR0144};branch=${SRC_BRANCH};destsuffix=src_ar0144;name=ar0144;subpath=imx8mp-camera-sw-pack-ar0144\
"
SRCREV_FORMAT = "ar0144"
SRCREV_ar0144 = "e74440f9eb9ed03aa00b13b28c37f13f71f6cb77"

S_AR0144 = "${WORKDIR}/src_ar0144/isp-vvcam"
PATCHTOOL = "git"
do_compile:append () {

        cp -r ${S_AR0144}/v4l2/* ${S}/
        cp ${S_AR0144}/ar0144_kernel-module-isp-vvcam.patch ${S}/

        cd ${S}/
        git apply ar0144_kernel-module-isp-vvcam.patch
        module_do_compile
}
