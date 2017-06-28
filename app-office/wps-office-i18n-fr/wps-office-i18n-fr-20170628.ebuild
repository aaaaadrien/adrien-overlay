# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit git-r3 eutils l10n

DESCRIPTION="French Language Pack"
HOMEPAGE="https://github.com/wps-community/wps_i18n"
EGIT_REPO_URI="https://github.com/wps-community/wps_i18n.git"

#prévoir des USE pour plusieurs langues + paquet générique

LICENSE="WPS-EULA"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="app-office/wps-office"
RDEPEND="${DEPEND}"

S=${WORKDIR}

src_compile() {
	cd ${S}/${P}/fr_FR
	emake
	# Suppression du makefile
	rm -f ${S}/${P}/fr_FR/Makefile
}
src_install() {
	insinto /opt/kingsoft/wps-office/office6/mui
	doins -r ${S}/${P}/fr_FR
}
