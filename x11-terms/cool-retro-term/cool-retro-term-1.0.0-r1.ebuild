# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="6"

inherit qmake-utils eutils

SLOT="0"

DESCRIPTION="A good-looking terminal emulator which mimics the old cathode ray tube display."

HOMEPAGE="https://github.com/Swordfish90/cool-retro-term"

SRC_URI="${HOMEPAGE}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"

KEYWORDS="x86 amd64"

DEPEND="
	>=dev-qt/qtcore-5.3.1
	>=dev-qt/qtquickcontrols-5.3.1[widgets]
	>=dev-qt/qtdeclarative-5.3.1[localstorage]
	>=dev-qt/qtgraphicaleffects-5.3.1
"
src_prepare() {
	sed -i '/qmltermwidget/d' ${PN}.pro
	eapply_user
}

src_configure() {
	local myeqmakeargs=(
		${PN}.pro
		PREFIX="${EPREFIX}/usr"
		DESKTOPDIR="${EPREFIX}/usr/share/applications"
		ICONDIR="${EPREFIX}/usr/share/pixmaps"
	)
	eqmake5 ${myeqmakeargs[@]} || die "Failed to configure"
}

src_compile() {
	emake INSTALL_ROOT="${D}" || die "Failed to compile"
}

src_install() {
	emake INSTALL_ROOT="${D}" install 
}

