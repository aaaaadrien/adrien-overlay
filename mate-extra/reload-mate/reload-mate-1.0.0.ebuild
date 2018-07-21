# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit eutils

DESCRIPTION="Script to reload MATE desktop"
HOMEPAGE="https://github.com/aaaaadrien/reload-mate"
SRC_URI="https://github.com/aaaaadrien/reload-mate/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="mate-base/mate-panel
		x11-wm/marco"
RDEPEND="${DEPEND}"

src_compile()
{
    return
}

src_install() {
	dobin "${PN}"
}
