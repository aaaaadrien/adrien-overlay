# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Papirus icon theme for Linux"

HOMEPAGE="https://github.com/PapirusDevelopmentTeam/papirus-icon-theme"
SRC_URI="https://github.com/PapirusDevelopmentTeam/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL-3.0"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	default_src_prepare

	# pour avvoir l'icône Gentoo du menu
	local res x
	for x in Papirus ePapirus Papirus-Dark Papirus-Light; do
		for res in 16 22 24 32 48 64; do
			#echo "${x}"
			cp  ${S}/Papirus/symbolic/places/start-here-symbolic.svg ${S}/"${x}"/${res}x${res}/places/start-here.svg || die
		done
	done
}
