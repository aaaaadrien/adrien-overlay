# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="Virtual package to test some things"
HOMEPAGE="http://www.linuxtricks.fr"
SRC_URI=""

LICENSE=""
SLOT="2"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

pkg_preinst() {
	einfo "Hello Adrien ! Package in version ${PV}"
}
# DISTDIR="/tmp/adrien-overlay" ebuild *.ebuild manifest
# ebuild *.ebuild manifest clean fetch unpack compile install
