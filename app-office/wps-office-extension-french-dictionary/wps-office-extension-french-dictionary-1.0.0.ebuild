# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit

DESCRIPTION=""
HOMEPAGE=""
SRC_URI="http://wps-community.org/download/dicts/fr_FR.zip"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="app-office/wps-office"
RDEPEND="${DEPEND}"

S=${WORKDIR}

src_install() {
	insinto /opt/kingsoft/wps-office/office6/dicts
	doins -r fr_FR
}
