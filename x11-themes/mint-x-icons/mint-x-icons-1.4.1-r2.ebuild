# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: 

EAPI="6"

inherit gnome2-utils

DESCRIPTION="Mint-X Icon themes"
HOMEPAGE="http://packages.linuxmint.com/pool/main/m/mint-x-icons/"
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
	local res x
	for x in Mint-X Mint-X-Blue Mint-X-Orange Mint-X-Purple Mint-X-Sand Mint-X-Yellow Mint-X-Aqua Mint-X-Brown Mint-X-Grey Mint-X-Pink Mint-X-Red Mint-X-Teal; do
		for res in 16 22 24 32 48 128; do
			#echo "${x}"
			cp  ${FILESDIR}/${res}-start-here-gentoo.png ${S}/${PN}/usr/share/icons/"${x}"/places/${res}/start-here.png || die
		done
	done
	cp ${FILESDIR}/start-here-gentoo.svg ${S}/${PN}/usr/share/icons/Mint-X/places/scalable/start-here.svg || die
}

src_install() {
	insinto /usr/share/icons
	doins -r mint-x-icons/usr/share/icons/Mint-X{,-Aqua,-Blue,-Brown,-Grey,-Orange,-Pink,-Purple,-Red,-Sand,-Teal,-Yellow} || die

	dodoc mint-x-icons/debian/changelog  mint-x-icons/debian/copyright
}

pkg_preinst() { gnome2_icon_savelist; }
pkg_postinst() { gnome2_icon_cache_update; }
pkg_postrm() { gnome2_icon_cache_update; }
