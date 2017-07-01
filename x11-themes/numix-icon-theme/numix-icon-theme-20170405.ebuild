# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6

DESCRIPTION="Official icon theme from the Numix project."
HOMEPAGE="https://numixproject.org"

GIT_PV="${PV:2:2}-${PV:4:2}-${PV:6:2}"
SRC_URI="https://github.com/numixproject/${PN}/archive/${GIT_PV}.tar.gz -> ${P}.tar.gz"
KEYWORDS="amd64 x86"
S="${WORKDIR}/${PN}-${GIT_PV}"

LICENSE="GPL-3"
SLOT="0"

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	insinto /usr/share/icons
	doins -r Numix Numix-Light
	dodoc readme.md
}
