# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit eutils

DESCRIPTION="X zoomer"
HOMEPAGE="ftp://metalab.unc.edu/pub/Linux/libs/X/"
SRC_URI="https://github.com/aaaaadrien/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="distributable"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="x11-misc/imake"
RDEPEND="${DEPEND}"

src_compile () {
	xmkmf
	emake
}

src_install() {
	dobin xzoom	
}
