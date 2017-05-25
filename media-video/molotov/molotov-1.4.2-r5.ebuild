# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit eutils

DESCRIPTION="Nous allons vous faire adorer la télé !"
HOMEPAGE="https://www.molotov.tv"
SRC_URI="https://desktop-auto-upgrade.s3.amazonaws.com/linux/${PV}/molotov"

LICENSE=""
SLOT="0"
KEYWORDS="x86 amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_unpack() {
# On dépack pas c'est un appimage
echo ${A}
echo ${S}
mkdir ${WORKDIR}/${P}
}

#src_prepare() {
#echo 1
#}

#src_compile() {
#echo 2
#}

src_install() {
# C'est pas très propre
	mkdir -p ${D}/opt/${PN}
	insinto /opt/${PN}
	newins ${DISTDIR}/${A} ${PN}
	chmod +x ${D}/opt/${PN}/${PN}
	
	#doins ${FILESDIR}/${PN}-launcher.sh
	#chmod +x ${D}/opt/${PN}/${PN}-launcher.sh

# Les icones
	for res in 16 24 32 48 64 96 128 256 512; do
		newicon -s $res ${FILESDIR}/${PN}-$res.png ${PN}.png
	done

# le menu
	domenu ${FILESDIR}/${PN}.desktop
}

