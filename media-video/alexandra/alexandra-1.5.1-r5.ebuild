# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

#PLOCALES="cs de fr"

inherit qmake-utils plocale desktop

DESCRIPTION="Small, fast, but powerful video library, written in C++ with Qt5."
HOMEPAGE="https://github.com/eugene-melnik/alexandra"
SRC_URI="https://github.com/eugene-melnik/alexandra/archive/${PV}.tar.gz -> ${P}.tar.gz"
KEYWORDS="amd64 x86"
LICENSE="GPL-2"
SLOT="0"

DEPEND="dev-qt/qtcore:5
	dev-qt/qtgui:5
	dev-qt/qtnetwork:5
	dev-qt/qtwidgets:5
	dev-qt/qtscript:5
	dev-qt/qttranslations:5
	dev-qt/linguist:5
	dev-qt/linguist-tools:5
	media-libs/libmediainfo
"

# -DMEDIAINFO_SUPPORT

RDEPEND="${DEPEND}"

src_compile() {
	eqmake5 ${PN}.pro
	emake
}

src_install() {
	#dobin ${PN}
	emake INSTALL_ROOT="${D}" install || die
	domenu linux/${PN}.desktop
	doicon linux/${PN}.png
}
