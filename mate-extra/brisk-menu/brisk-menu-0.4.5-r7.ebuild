# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
inherit eutils

DESCRIPTION="Modern, efficient menu for the MATE Desktop Environment."
HOMEPAGE="https://github.com/solus-project/${PN}"
SRC_URI="https://github.com/solus-project/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=mate-base/mate-desktop-1.16
		>=mate-base/mate-panel-1.16
		>=x11-libs/gtk+-3.18"
RDEPEND="${DEPEND}"

src_prepare() {
	#default_src_prepare
	
	cd ${S}
	./autogen.sh

}

src_compile(){
	emake INSTALL_ROOT="${D}"
}

src_install() {
	emake DESTDIR="${D}" install
}
