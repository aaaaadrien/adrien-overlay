# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit eutils

DESCRIPTION="Caja icon to launch Caja with root user"
HOMEPAGE="https://www.linuxtricks.fr"
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="mate-base/caja
		mate-extra/mate-polkit"
RDEPEND="${DEPEND}"


src_unpack() {
	mkdir ${WORKDIR}/${P}
}

#src_prepare() {
#}

#src_compile() {
#}

src_install() {
	
	insinto "/usr/share/polkit-1/actions"
	newins ${FILESDIR}/${PN}.policy org.mate.${PN}.policy

	domenu ${FILESDIR}/${PN}.desktop
}
