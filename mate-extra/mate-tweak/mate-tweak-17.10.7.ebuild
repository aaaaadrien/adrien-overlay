# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

PYTHON_COMPAT=( python3_{3,4,5} )

inherit distutils-r1

DESCRIPTION="MATE desktop tweak tool, a fork of mintDesktop"
HOMEPAGE="http://git.mate-desktop.org/mate-tweak/"
SRC_URI="http://git.mate-desktop.org/mate-tweak/snapshot/${PN}-${PV}.tar.bz2"

LICENSE="GPL-2+"
KEYWORDS="x86 amd64"
SLOT="0"

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]
	sys-devel/gettext
    dev-python/python-distutils-extra
	dev-util/intltool"
RDEPEND="dev-libs/glib:2
	dev-python/psutil
	dev-python/pygobject:3
	dev-python/setproctitle
	gnome-base/dconf
	mate-base/caja
	>=mate-base/mate-desktop-1.14
	mate-base/mate-panel
	mate-extra/mate-media
	sys-process/psmisc
	x11-libs/gdk-pixbuf:2
	x11-libs/gtk+:3
	>=x11-libs/libnotify-0.7"

#S="${WORKDIR}/ubuntu-mate-${PN}-${HASH}"
#RESTRICT="mirror"
