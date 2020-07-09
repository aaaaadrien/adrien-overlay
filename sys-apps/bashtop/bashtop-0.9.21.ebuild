# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Linux/OSX/FreeBSD resource monitor"
HOMEPAGE="https://github.com/aristocratos/${PN}"

SRC_URI="https://github.com/aristocratos/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
KEYWORDS="x86 amd64"

LICENSE="GPL-3+"
SLOT="0"

IUSE=""

DEPEND=""

RDEPEND="
   sys-apps/sed
   >=app-shells/bash-4.4
   sys-apps/coreutils
"

src_prepare() {
   sed -i.bck0 "s@= /usr/local@= /usr@" Makefile || die
   sed -i.bck1 "s@share/doc/bashtop@share/doc/${P}@" Makefile || die
   default
}
