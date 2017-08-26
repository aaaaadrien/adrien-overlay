# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit autotools gnome2-utils

DESCRIPTION="Arc icon theme"
HOMEPAGE="https://github.com/horst3180/${P}"
SRC_URI="https://github.com/horst3180/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
IUSE=""
KEYWORDS="amd64 x86"

RDEPEND="
	x11-themes/moka-icon-theme
"
DEPEND=""

# This ebuild does not install any binaries
RESTRICT="binchecks strip"

src_prepare() {
	default
	eautoreconf
}

pkg_preinst() {
	gnome2_icon_savelist
}

pkg_postinst() {
	gnome2_icon_cache_update
}

pkg_postrm() {
	gnome2_icon_cache_update
}
