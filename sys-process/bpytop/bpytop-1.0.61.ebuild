# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{7,8,9} pypy3 )

inherit python-r1

DESCRIPTION="Linux/OSX/FreeBSD resource monitor"
HOMEPAGE="https://github.com/aristocratos/${PN}"
SRC_URI="https://github.com/aristocratos/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=""
RDEPEND=">=dev-python/psutil-5.7.0[${PYTHON_USEDEP}]"
BDEPEND=""

src_install() {
	python_foreach_impl python_newscript "${PN}.py" "${PN}"
	dodoc CHANGELOG.md CONTRIBUTING.md README.md
	insinto "/usr/share/${PN}"
	doins -r themes
}
