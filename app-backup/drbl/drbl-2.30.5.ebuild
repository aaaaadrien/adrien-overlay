# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="DRBL is open source solution to managing the deployment of many clients"
HOMEPAGE=""
SRC_URI="http://free.nchc.org.tw/drbl-core/src/stable/drbl-${PV}.tar.xz"

LICENSE="GPL3"
SLOT="0"
KEYWORDS="*amd64 *x86"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	emake install DESTDIR="${D}"
}
