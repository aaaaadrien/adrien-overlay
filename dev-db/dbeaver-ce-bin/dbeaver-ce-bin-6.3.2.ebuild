# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5
inherit eutils unpacker toolchain-funcs

DESCRIPTION="Free universal database tool and SQL client http://dbeaver.io"
HOMEPAGE="https://github.com/dbeaver/dbeaver"
SRC_URI="
	amd64? ( https://github.com/dbeaver/dbeaver/releases/download/${PV}/dbeaver-ce_${PV}_amd64.deb -> ${P}-amd64.deb )
"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64"
RESTRICT="bindist mirror"

DEPEND="virtual/jre:1.8
		x11-libs/gtk+:2
"
RDEPEND="${DEPEND}"

QA_PREBUILT="*"
S=${WORKDIR}

src_unpack() {
	unpack_deb ${A}
}

src_install() {
	mkdir -p "${ED}"
	cp -r . "${ED}/"
}
