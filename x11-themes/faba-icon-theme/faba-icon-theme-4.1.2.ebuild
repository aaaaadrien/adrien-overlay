# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6

inherit eutils autotools

DESCRIPTION="Faba is a sexy and modern icon theme with Tango influences. All variations and supplementary themes for Faba, require this base theme."
HOMEPAGE="http://snwh.org"
SRC_URI="https://github.com/snwh/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
KEYWORDS="amd64 x86"
RESTRICT="mirror"


LICENSE="LGPL-3.0"
SLOT="0"
IUSE=""

DEPEND="
	x11-themes/gnome-icon-theme
	x11-themes/hicolor-icon-theme"
RDEPEND="${DEPEND}"

src_prepare(){
	eapply_user
	eautoreconf
}
