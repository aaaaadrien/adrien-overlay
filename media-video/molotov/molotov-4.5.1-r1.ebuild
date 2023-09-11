# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit desktop

DESCRIPTION="Nous allons vous faire adorer la tele !"
HOMEPAGE="https://www.molotov.tv"
SRC_URI="http://desktop-auto-upgrade.molotov.tv/linux/Molotov-${PV}.AppImage"

LICENSE="molotov"
SLOT="0"
KEYWORDS="amd64"

QA_PREBUILT="opt/molotov/molotov"

IUSE=""

DEPEND="sys-fs/fuse"
RDEPEND="${DEPEND}"

S=${WORKDIR}

src_prepare() {
	cp "${DISTDIR}/Molotov-${PV}.AppImage" "${WORKDIR}/molotov"
	eapply_user
}

src_install() {
# C'est pas très propre
	mkdir -p ${D}/opt/${PN}
	insinto /opt/${PN}
	newins ${DISTDIR}/${A} ${PN}
	chmod +x ${D}/opt/${PN}/${PN}
	
	doins ${FILESDIR}/${PN}-launcher.sh
	chmod +x ${D}/opt/${PN}/${PN}-launcher.sh

	dosym ${D}/opt/${PN}/${PN}-launcher.sh /usr/bin/${PN}

# Les icones
	for res in 16 24 32 48 64 96 128 256 512; do
		newicon -s $res ${FILESDIR}/${PN}-$res.png ${PN}.png
	done

# le menu
	domenu ${FILESDIR}/${PN}.desktop
}

