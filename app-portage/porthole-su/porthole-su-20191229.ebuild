# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit eutils

DESCRIPTION="Porthole icon to launch Porthole with root user"
HOMEPAGE="https://www.linuxtricks.fr"
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="app-portage/porthole
		sys-auth/polkit"
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
	newins ${FILESDIR}/${PN}.policy org.portage.${PN}.policy

	domenu ${FILESDIR}/${PN}.desktop
}
