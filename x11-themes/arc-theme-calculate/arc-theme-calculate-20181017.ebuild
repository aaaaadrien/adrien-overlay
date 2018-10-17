# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit autotools

DESCRIPTION="The Arc Theme forked and optimized to fit Calculate Linux identity guidelines."
HOMEPAGE="https://github.com/aaaaadrien/arc-theme-calculate"
SRC_URI="https://github.com/aaaaadrien/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 arm x86"

# Supports various GTK+3 versions and uses pkg-config to determine which
# set of files to install. Updates will break it but only this fix will
# help. https://github.com/horst3180/arc-theme/pull/436
DEPEND="virtual/pkgconfig"

RDEPEND=""

src_prepare() {
	default
	eautoreconf
}

src_configure() {
	econf \
		--disable-unity
}
