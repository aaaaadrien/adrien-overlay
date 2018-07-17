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
#		dev-util/dialog"
RDEPEND="${DEPEND}"

src_compile()
{
    return
}

src_install() {
	dobin "usr/bin/${PN}"
	dobin "usr/bin/${PN}-launcher-gui"
	doicon "usr/share/icons/${PN}.svg"
	domenu "usr/share/applications/${PN}.desktop"
	insinto /usr/share/pamageli/
	for l in fr
	do
		doins usr/share/pamageli/$l.lang
	done
	
	# Fichiers de config
	insinto /etc/pamageli
	doins etc/pamageli/pamageli.conf.default
}
