# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="EXPERIMENTAL !! Package to install files for CLDG ISO (from CLS) by Adrien.D"
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
	doins ${FILESDIR}/gnome-cls-use
	#insinto /etc/portage/make.conf
	#doins ${FILESDIR}/gnome-makeconf
	insinto /etc/profile.d
	dobin ${FILESDIR}/gnome-keyboard.sh
}

pkg_postinst() {
	ewarn "If you use CLS, to install GNOME as CLDG ISO, you can emerge this packages"
	ewarn "emerge -a gnome-shell gnome-core-apps gnome-shell-extensions gnome-terminal nautilus"
	ewarn "For extra apps such as games : emerge -a gnome-base/gnome-extra-apps"
}

