# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit eutils qmake-utils


DESCRIPTION="ROSA Image Writer"
HOMEPAGE="https://abf.io/soft/rosa-imagewriter"
SRC_URI="https://abf.io/soft/rosa-imagewriter/archive/${PN}-version-${PV}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="dev-qt/qtcore:5
	dev-qt/qtgui:5
	dev-qt/linguist:5
	dev-qt/linguist-tools:5
	virtual/udev
"

RDEPEND="${DEPEND}"

# On redéfini le chemin des sources
S="${WORKDIR}/${PN}-version-${PV}/"


src_compile() {
	eqmake5 RosaImageWriter.pro
	emake
}

src_install() {
	#insinto /usr/bin
	dobin RosaImageWriter

	#Ajout politique pour lancer en root le logiciel
	insinto "/usr/share/polkit-1/actions"
	newins ${FILESDIR}/RosaImageWriter.policy RosaImageWriter.policy

	#Icone
	newicon ${S}/res/icon-rosa.svg RosaImageWriter.svg

	# menu
	domenu ${FILESDIR}/RosaImageWriter.desktop
}
