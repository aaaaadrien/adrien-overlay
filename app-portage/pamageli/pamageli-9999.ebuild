# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit eutils


DESCRIPTION="PAckage MAnager for GEntoo LInux (and Calculate Linux)"
HOMEPAGE="https://github.com/aaaaadrien/pamageli"

if [[ ${PV} == "9999" ]]; then
	EGIT_REPO_URI="https://github.com/aaaaadrien/pamageli.git"
	inherit git-r3
	KEYWORDS=""

else
	SRC_URI="https://github.com/aaaaadrien/pamageli/archive/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="amd64 x86"
fi

LICENSE="MIT"
SLOT="0"
IUSE=""

DEPEND="app-shells/bash
		app-portage/eix
		app-portage/portage-utils
		app-portage/gentoolkit"
RDEPEND="${DEPEND}"

src_compile()
{
    return
}

src_install() {
	dobin "bin/${PN}"
	dobin "bin/${PN}-launcher-gui"
	doicon "share/icons/${PN}.svg"
	domenu "share/applications/${PN}.desktop"
	insinto /usr/share/pamageli/
	for l in fr
	do
		doins share/pamageli/$l.lang
	done
}
