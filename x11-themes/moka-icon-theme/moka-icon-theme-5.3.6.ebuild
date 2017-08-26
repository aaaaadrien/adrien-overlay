# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6

inherit eutils autotools

DESCRIPTION="Moka is a stylized Linux desktop icon set, and the titular icon theme of the Moka Project. They are designed to be clear, simple and consistent."
HOMEPAGE="http://snwh.org"
SRC_URI="https://github.com/snwh/moka-icon-theme/archive/v${PV}.tar.gz -> ${P}.tar.gz"
KEYWORDS="amd64 x86"

LICENSE="LGPL-3.0"
SLOT="0"
IUSE=""

DEPEND="x11-themes/faba-icon-theme"
RDEPEND="${DEPEND}"

src_prepare(){
	eapply_user
	eautoreconf
}
