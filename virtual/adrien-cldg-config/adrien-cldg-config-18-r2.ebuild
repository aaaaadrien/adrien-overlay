# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="Package to install correct profile for CLDG experimental ISO"
HOMEPAGE="http://www.linuxtricks.fr"
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}"

src_install() {
	insinto /etc/portage/package.keywords
	doins ${FILESDIR}/gnome-keywords
	insinto /etc/portage/package.use
	doins ${FILESDIR}/gnome-use
}
