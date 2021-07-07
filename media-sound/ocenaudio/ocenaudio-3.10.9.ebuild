# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit xdg-utils

DESCRIPTION="Easy, fast and powerful audio editor"
HOMEPAGE="https://www.ocenaudio.com/"
SRC_URI="https://www.ocenaudio.com/downloads/index.php/${PN}_archlinux.pkg.tar.xz -> ${P}.tar.xz"

LICENSE="ocenaudio_license"
SLOT="0"
KEYWORDS="amd64 x86"

DEPEND="
	app-arch/bzip2
	app-arch/xz-utils
	dev-libs/libgudev
	dev-libs/libxml2
	dev-libs/openssl
	dev-qt/qtconcurrent
	dev-qt/qtcore
	dev-qt/qtgui
	dev-qt/qtnetwork
	dev-qt/qtwidgets
	media-libs/alsa-lib
	media-sound/pulseaudio
	sys-libs/zlib
	virtual/jack
"
RDEPEND="${DEPEND}"
BDEPEND=""

QA_PREBUILT="*"
S="${WORKDIR}"

src_install() {
	mv */ "${D}" || die
	dosym ../../opt/${PN}/bin/${PN} /usr/bin/${PN}
}

pkg_postinst() {
	xdg_mimeinfo_database_update
	xdg_desktop_database_update
}

pkg_postrm() {
	xdg_mimeinfo_database_update
	xdg_desktop_database_update
}
