# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Papirus icon theme for Linux"

HOMEPAGE="https://github.com/PapirusDevelopmentTeam/papirus-icon-theme"
SRC_URI="https://github.com/PapirusDevelopmentTeam/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL-3.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	default_src_prepare
	# Adrien modif pour ajouter le bon icon de menu
	cp -f ${S}/Papirus/48x48/apps/distributor-logo-gentoo.svg  ${S}/Papirus/16x16/panel/start-here.svg || die
}

src_install() {
	insinto /usr/share/icons
	doins -r {ePapirus,Papirus,Papirus-Adapta,Papirus-Adapta-Nokto,Papirus-Dark,Papirus-Light} || die
}

pkg_preinst() { gnome2_icon_savelist; }
pkg_postinst() { gnome2_icon_cache_update; }
pkg_postrm() { gnome2_icon_cache_update; }
