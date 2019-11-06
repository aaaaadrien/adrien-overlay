# Copyright 2018-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit eutils linux-info linux-mod
COMMIT="a57556d8dc279273b4f753513e8b493254d84258"
DESCRIPTION="ReatlTek 8821ce wifi driver"
HOMEPAGE="https://github.com/tomaspinho/rtl8821ce/"
SRC_URI="https://github.com/tomaspinho/rtl8821ce/archive/${COMMIT}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="kernel_linux"
RESTRICT="bindist"

COMMON="
	kernel_linux? ( >=sys-libs/glibc-2.6.1 )
"
DEPEND="${COMMON}
	kernel_linux? (
		virtual/linux-sources
		virtual/pkgconfig
	)"
RDEPEND="${COMMON}"

REQUIRED_USE="kernel_linux"

S="${WORKDIR}/rtl8821ce-${COMMIT}"

pkg_setup() {
	export DISTCC_DISABLE=1
	export CCACHE_DISABLE=1

	export KVER="${KV_FULL}"

	linux-mod_pkg_setup
	MODULE_NAMES="8821ce(kernel/drivers/net/wireless:${S})"
	BUILD_TARGETS="clean modules"
}

src_prepare() {
	if kernel_is lt 4 14 0 ; then
		eerror "You must build this against 4.14.0 or higher kernels."
	fi

	eapply_user
}

src_compile() {
	linux-mod_src_compile src="${KERNEL_DIR}" KERNELRELEASE="${KV_FULL}"
}

src_install() {
	linux-mod_src_install

	insinto /etc/modules-load.d/
	doins -r "${FILESDIR}/rtl8821ce.conf"
}

pkg_preinst() {
	linux-mod_pkg_preinst
}

pkg_postinst() {
	linux-mod_pkg_postinst
}

pkg_postrm() {
	linux-mod_pkg_postrm
}
