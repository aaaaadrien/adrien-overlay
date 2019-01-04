# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit git-r3 eutils l10n

DESCRIPTION="Languages Pack for WPS Office"
HOMEPAGE="https://github.com/wps-community/wps_i18n"
EGIT_REPO_URI="https://github.com/wps-community/wps_i18n.git"

#prévoir des USE pour plusieurs langues + paquet générique
LANGS=" ar bn_BD ca_ES cs_CZ de_DE es es_ES es_PE fr_FR gl_ES hu_HU it_IT ja_JP ko_KR nl pl_PL pt_BR pt_PT ro_RO ru_RU sk tr_TR uk_UA zh_TW"

LICENSE="WPS-EULA"
SLOT="0"
KEYWORDS="amd64 x86"
#IUSE="l10n_ar l10n_bn_BD l10n_ca_ES l10n_cs_CZ l10n_de_DE l10n_en_US l10n_es l10n_es_ES l10n_es_PE l10n_fr_FR l10n_gl_ES l10n_hu_HU l10n_it_IT l10n_ja_JP l10n_ko_KR l10n_nl l10n_pl_PL l10n_pt_BR l10n_pt_PT l10n_ro_RO l10n_ru_RU l10n_sk l10n_tr_TR l10n_uk_UA l10n_zh_CN l10n_zh_TW"

DEPEND="app-office/wps-office
		dev-qt/qtcore:5
		dev-qt/linguist:5"
RDEPEND="${DEPEND}"

S=${WORKDIR}

src_compile() {
	local lang
	for lang in ${LANGS}
	do
		#if use l10n_${lang}
		#then
			cd ${S}/${P}/$lang
			emake
			# Suppression du makefile
			rm -f ${S}/${P}/$lang/Makefile
		#fi
	done
}
src_install() {
	insinto /opt/kingsoft/wps-office/office6/mui
	local lang
	for lang in ${LANGS}
	do
		#if use l10n_${lang}
		#then
			doins -r ${S}/${P}/$lang
		#fi
	done
}
