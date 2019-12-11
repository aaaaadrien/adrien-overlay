# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit eutils  unpacker

DESCRIPTION="Plateforme collaborative en ligne gratuite"
HOMEPAGE="https://teams.microsoft.com/"
SRC_URI="https://packages.microsoft.com/repos/ms-teams/pool/main/t/${PN}/${PN}_${PV}_amd64.deb"

LICENSE="MS-Teams"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

QA_PREBUILT="*"
S=${WORKDIR}

src_unpack() {
	unpack_deb ${A}
}

src_install() {
	echo ${D}
	echo ${S}
	dobin ${S}/usr/bin/${PN}
	domenu  ${S}/usr/share/applications/${PN}.desktop
	# A faire plus propre si possible
	insinto /usr/share/pixmaps
	newins ${S}/usr/share/pixmaps/${PN}.png ${PN}.png
	
	# A faire aussi plus propre
	mkdir ${D}/usr/share/teams
	mv ${S}/usr/share/teams/* ${D}/usr/share/teams/
}
