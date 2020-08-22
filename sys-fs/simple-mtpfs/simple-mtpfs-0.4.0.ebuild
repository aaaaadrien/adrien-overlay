# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
inherit eutils

DESCRIPTION="Simple MTP fuse filesystem driver"
HOMEPAGE="https://github.com/phatina/simple-mtpfs"
SRC_URI="https://github.com/phatina/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND="
	media-libs/libmtp
	>=sys-fs/fuse-2.8
"
DEPEND="${RDEPEND}
	virtual/pkgconfig
"

AUTOTOOLS_AUTORECONF=1
