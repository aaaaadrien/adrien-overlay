# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit eutils

DESCRIPTION="Nemo extension to rotate/resize image files"
HOMEPAGE="https://github.com/linuxmint/nemo-extensions"
SRC_URI="https://github.com/linuxmint/nemo-extensions/archive/${PV}.tar.gz"
S="${WORKDIR}/nemo-extensions-${PV}/${PN}"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="doc"

DEPEND="media-gfx/imagemagick
	>=dev-util/intltool-0.25
	sys-devel/autoconf-archive
	>=gnome-extra/nemo-${PV}[introspection]"
RDEPEND="${DEPEND}"

src_prepare() {
	if [[ ! -e configure ]] ; then
		./autogen.sh || die
	fi
}