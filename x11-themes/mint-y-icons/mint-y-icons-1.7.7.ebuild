# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: 

EAPI="8"

inherit xdg-utils

DESCRIPTION="Mint-Y Icon themes"
HOMEPAGE="http://packages.linuxmint.com/pool/main/m/mint-y-icons/"
SRC_URI="http://packages.linuxmint.com/pool/main/m/${PN}/${PN}_${PV}.tar.xz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND=""

RESTRICT="binchecks strip"

S=${WORKDIR}

src_prepare() {
	default_src_prepare
}

src_install() {
	insinto /usr/share/icons
	doins -r mint-y-icons/usr/share/icons/Mint-Y{,-Aqua,-Blue,-Cyan,-Grey,-Navy,-Orange,-Pink,-Purple,-Red,-Sand,-Teal,-Yaru} || die

	dodoc mint-y-icons/debian/changelog  mint-y-icons/debian/copyright
}

pkg_preinst() { xdg_icon_savelist; }
pkg_postinst() { xdg_icon_cache_update; }
pkg_postrm() { xdg_icon_cache_update; }
