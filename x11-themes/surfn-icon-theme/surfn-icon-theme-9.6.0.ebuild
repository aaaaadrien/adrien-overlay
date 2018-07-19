# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit gnome2-utils

DESCRIPTION="A colourful icon theme for linux desktops"

HOMEPAGE="https://github.com/erikdubois/Surfn"
SRC_URI="https://github.com/erikdubois/Surfn/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL-3.0"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}/Surfn-${PV}"

src_prepare() {
	default_src_prepare
	#local res x
	#for x in Mint-X Mint-X-Blue Mint-X-Orange Mint-X-Purple Mint-X-Sand Mint-X-Yellow Mint-X-Aqua Mint-X-Brown Mint-X-Grey Mint-X-Pink Mint-X-Red Mint-X-Teal; do
	#	for res in 16 22 24 32 48 128; do
			#echo "${x}"
	#		cp  ${FILESDIR}/${res}-start-here-gentoo.png ${S}/${PN}/usr/share/icons/"${x}"/places/${res}/start-here.png || die
	#	done
	#done
	#cp ${FILESDIR}/start-here-gentoo.svg ${S}/${PN}/usr/share/icons/Mint-X/places/scalable/start-here.svg || die
}

src_install() {
	insinto /usr/share/icons
	doins -r Surfn{,-Arc,-Arch-Blue,-Arched,-Breeze-Dark,-Evopop,-Luv-Red,-Luv,-Majestic,-Mint-X-Grey,-Numix-Misty,-Numix-Polo,-Numix,-Orange,-Papirus-Blue,-Papirus-Grey,-Vertexed} || die

}

pkg_preinst() { gnome2_icon_savelist; }
pkg_postinst() { gnome2_icon_cache_update; }
pkg_postrm() { gnome2_icon_cache_update; }
