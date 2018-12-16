# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit qmake-utils toolchain-funcs

DESCRIPTION="Powerful yet simple to use screenshot software"
HOMEPAGE="http://github.com/lupoDharkael/flameshot"

SRC_URI="${HOMEPAGE}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
KEYWORDS="x86 amd64 arm"

LICENSE="GPL-3"
SLOT="0"
IUSE=""

DEPEND="
	>=dev-qt/qtcore-5.3.0:5
	>=dev-qt/qtdbus-5.3.0:5
	>=dev-qt/qtnetwork-5.3.0:5
	>=dev-qt/qtwidgets-5.3.0:5
	>=dev-qt/linguist-tools-5.3.0:5
"
RDEPEND="${DEPEND}"

src_prepare(){
	sed -i "s#\(VERSION = \).*#\1${PV}#" ${PN}.pro
	sed -i "s#icons#pixmaps#" ${PN}.pro
	sed -i "s#^Icon=.*#Icon=${PN}#" "docs/desktopEntry/package/${PN}.desktop" \
		"snap/gui/${PN}.desktop" \
		"snap/gui/${PN}-init.desktop"
	eapply_user
}

src_configure(){
	eqmake5 "CONFIG+=packaging" ${PN}.pro
}

src_install(){
	emake INSTALL_ROOT="${D}" install
}
