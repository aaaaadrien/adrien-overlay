# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Polices MS Office 2007 (Calibri, Cambria, Candara, Consola, Constan, Corbel)"
HOMEPAGE="https://www.microsoft.com"
SRC_URI=""

LICENSE="MSttfEULA"
SLOT="0"
KEYWORDS="amd64 x86 arm"
IUSE=""

DEPEND="app-arch/cabextract"
RDEPEND="${DEPEND}"
BDEPEND=""

S=${WORKDIR}
FONT_S=${WORKDIR}
FONT_SUFFIX="ttf"

src_install() {
	insinto "/usr/share/fonts/office2007/"
	for f in calibri cambria candara consola constan corbel
	do
		for ext in .ttf b.ttf i.ttf li.ttf l.ttf z.ttf
		do
			if [ -e "${FILESDIR}/$f$ext" ]
			then
				newins ${FILESDIR}/$f$ext $f$ext
			fi
		done
	done

}
