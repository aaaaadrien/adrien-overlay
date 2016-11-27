# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6
inherit cmake-utils eutils

DESCRIPTION="a volley-game with colorful blobs"
HOMEPAGE="http://blobby.sourceforge.net"
SRC_URI="mirror://sourceforge/blobby/${PN}-linux-${PV/_}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND="dev-games/physfs
	dev-libs/boost
	media-libs/libsdl2
	virtual/opengl"
DEPEND="${RDEPEND}"

S="${WORKDIR}/blobby-${PV/_}"

PATCHES=( "${FILESDIR}"/${P}-fix_install.patch
	"${FILESDIR}"/${P}-fix_release.patch )

src_install() {
	cmake-utils_src_install
	newicon data/Icon.bmp ${PN}.bmp
	#doicon data/Icon.bmp
	make_desktop_entry /usr/bin/blobby "Blobby Volley 2" /usr/share/pixmaps/${PN}.bmp Game
}
