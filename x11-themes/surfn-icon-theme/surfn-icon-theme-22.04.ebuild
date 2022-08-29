# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit gnome2-utils

DESCRIPTION="A colourful icon theme for linux desktops"
MY_PV="${PV}-02"

HOMEPAGE="https://github.com/erikdubois/Surfn"
SRC_URI="https://github.com/erikdubois/Surfn/archive/${MY_PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL-3.0"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}/Surfn-${MY_PV}"

src_prepare() {
	default_src_prepare
}

src_install() {
	insinto /usr/share/icons
	doins -r surfn-icons/Surfn{,-Arc,-Arch-Blue,-Arched,-Breeze-Dark,-Luv-Red,-Luv,-Majestic,-Mint-X-Grey,-Numix-Misty,-Numix-Polo,-Numix,-Orange,-Papirus-Blue,-Papirus-Casablanca,-Papirus-Grey,-Tela,-Vertexed,-Vimix-Black} || die

}

pkg_preinst() { gnome2_icon_savelist; }
pkg_postinst() { gnome2_icon_cache_update; }
pkg_postrm() { gnome2_icon_cache_update; }
