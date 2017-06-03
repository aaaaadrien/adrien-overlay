# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5
inherit autotools-utils eutils

DESCRIPTION="Simple MTP fuse filesystem driver"
HOMEPAGE="https://github.com/phatina/simple-mtpfs"
SRC_URI="https://github.com/phatina/${PN}/archive/${P}.tar.gz"

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

S="${WORKDIR}/${PN}-${P}"

AUTOTOOLS_AUTORECONF=1
