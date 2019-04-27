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
IUSE="games"

DEPEND="
		media-sound/alsa-utils
		"
RDEPEND="${DEPEND}"

S="${WORKDIR}"

src_install() {
	#insinto /etc/portage/package.keywords
	#doins ${FILESDIR}/gnome-keywords
	#insinto /etc/portage/package.use
	#doins ${FILESDIR}/gnome-use
	#if ! use games ; then
	#	doins ${FILESDIR}/gnome-use-nogames
	#fi
	#doins ${FILESDIR}/gnome-cls-use
	#insinto /etc/portage/make.conf
	#doins ${FILESDIR}/gnome-makeconf
	exeinto /etc/calculate
	doexe ${FILESDIR}/cldg-adrien.sh
	insinto /etc/calculate
	doins ${FILESDIR}/calculate-install.desktop
	insinto /etc/xdg/autostart
	doins ${FILESDIR}/cldg-adrien.desktop
}

pkg_postinst() {
	#ewarn "If you use CLS, to install GNOME as CLDG ISO, you can emerge this packages"
	#ewarn "emerge -a gnome-shell gnome-core-apps gnome-shell-extensions gnome-terminal nautilus"
	#ewarn "For extra apps such as games : emerge -a gnome-base/gnome-extra-apps"
	ewarn "To use CLDG Packages, please enable adrien-overlay CLDGA profile"
}

