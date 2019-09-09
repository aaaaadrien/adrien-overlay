# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit eutils

DESCRIPTION="All-In-One Solution for Remote Access and Support over the Internet"
HOMEPAGE="http://anydesk.de/"
SRC_URI="
        amd64? ( http://download.anydesk.com/linux/${PN}-${PV}-amd64.tar.gz )"

LICENSE=""
SLOT="0"
KEYWORDS="amd64"

QA_PREBUILT="usr/bin/anydesk"

IUSE=""


DEPEND="x11-libs/gtkglext"
RDEPEND="${DEPEND}"

src_install() {
	dobin anydesk 
	domenu ${FILESDIR}/AnyDesk.desktop
	domenu ${FILESDIR}/AnyDesk-root.desktop
	doicon icons/hicolor/scalable/apps/${PN}.svg

	# New policykit test adrien
	insinto "/usr/share/polkit-1/actions"
	newins polkit-1/com.philandro.anydesk.policy com.philandro.anydesk.policy

}
