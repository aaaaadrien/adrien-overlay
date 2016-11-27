# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

inherit qmake-utils eutils

SLOT="0"

QT5_MODULE="qtbase"

DESCRIPTION="A good-looking terminal emulator which mimics the old cathode ray tube display."

HOMEPAGE="https://github.com/Swordfish90/"

SRC_URI="
${HOMEPAGE}/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz
${HOMEPAGE}/qmltermwidget/archive/v0.1.0.tar.gz -> qmltermwidget-0.1.0.tar.gz
"
LICENSE="GPL-2"

KEYWORDS="~x86 ~amd64"

DEPEND="
	>=dev-qt/qtcore-5.3.1
	>=dev-qt/qtquickcontrols-5.3.1[widgets]
	>=dev-qt/qtdeclarative-5.3.1[localstorage]
	>=dev-qt/qtgraphicaleffects-5.3.1
"
src_prepare() {
	einfo "Satisfying build-time dependency on QMLTermWidget by linking it into the source tree..."
	rmdir ${WORKDIR}/${P}/qmltermwidget || die "Error deleting empty widget dir from source tree"
	ln -s ${WORKDIR}/qmltermwidget-0.1.0 ${WORKDIR}/${P}/qmltermwidget || die "Error linking widget into source tree"
}

src_configure() {
	einfo "Preparing targets..."
	eqmake5 || die "Failed to configure"
}

src_compile() {
	einfo "Commencing compilation..."
	emake || die "Failed to compile"
}

src_install() {
	into /usr/
		dobin ${S}/${PN} || die "Failed to install application binary"
	insinto /usr/lib/qt5/qml/
		doins -r ${S}/qmltermwidget/QMLTermWidget || die "Failed to install QML imports"
	for size in 32 64 128 256; do
		doicon --size ${size} ${S}/app/icons/${size}x${size}/${PN}.png
	done
	domenu ${S}/cool-retro-term.desktop
	dodoc ${S}/README.md || die "Failed to install README"
}

pkg_postinst() {
	eqawarn "Please report any code-related issues upstream!"
	elog "This package lacks a man page for now. Please invoke \"${PN} -h\" if You need help!"
	elog "Additional information can be obtained via \"bzcat /usr/share/doc/${PN}-${PV}/README.md.bz2\""
	elog "Icons are located under \"/usr/share/icons/${PN}/\"."
}
