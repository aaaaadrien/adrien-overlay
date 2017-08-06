# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit git-r3 eutils l10n

DESCRIPTION="French Language Pack"
HOMEPAGE="https://github.com/wps-community/wps_i18n"
EGIT_REPO_URI="https://github.com/wps-community/wps_i18n.git"

#prévoir des USE pour plusieurs langues + paquet générique
LANGS=" ar bn_BD ca_ES cs_CZ de_DE en_US es es_ES es_PE fr_FR gl_ES hu_HU it_IT ja_JP ko_KR nl pl_PL pt_BR pt_PT ro_RO ru_RU sk tr_TR uk_UA zh_CN zh_TW"

LICENSE="WPS-EULA"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="$(echo ${LANGS//\ /\ l10n_})"

DEPEND="app-office/wps-office"
RDEPEND="${DEPEND}"

S=${WORKDIR}

src_compile() {
	local lang
	for lang in ${LANGS}
	do
		if use l10n_${lang}
		then
			cd ${S}/${P}/$lang
			emake
			# Suppression du makefile
			rm -f ${S}/${P}/$lang/Makefile
		fi
	done
}
src_install() {
	insinto /opt/kingsoft/wps-office/office6/mui
	local lang
	for lang in ${LANGS}
	do
		if use l10n_${lang}
		then
			doins -r ${S}/${P}/$lang
		fi
	done
}
