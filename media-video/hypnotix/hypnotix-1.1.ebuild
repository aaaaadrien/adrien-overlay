# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python3_{7,8} )

inherit gnome2-utils python-single-r1 virtualx xdg

DESCRIPTION="IPTV streaming application with support for live TV"
HOMEPAGE="https://github.com/linuxmint/${PN}"
SRC_URI="https://github.com/linuxmint/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
REQUIRED_USE="${PYTHON_REQUIRED_USE}"
RESTRICT=test

COMMON_DEPEND="
	${PYTHON_DEPS}
	>=x11-libs/xapps-1.4.0
	media-video/mpv
"
RDEPEND="${COMMON_DEPEND}
	$(python_gen_cond_dep '
		dev-python/polib[${PYTHON_USEDEP}]
		dev-python/pygobject:3[${PYTHON_USEDEP}]
	')
"
BDEPEND="
	>=dev-util/intltool-0.40.1
	sys-devel/gettext
	virtual/pkgconfig
"

src_compile() {
	emake
}

src_install() {
	dobin usr/bin/hypnotix
	insinto "/usr/lib/hypnotix"
	doins  "usr/lib/hypnotix/common.py"
	doins  "usr/lib/hypnotix/hypnotix.py"
	doins  "usr/lib/hypnotix/mpv.py"
	chmod +x ${D}/usr/lib/hypnotix/hypnotix.py

	domenu "usr/share/applications/hypnotix.desktop"
}

pkg_postinst() {
	xdg_pkg_postinst
	gnome2_schemas_update
}

pkg_postrm() {
	xdg_pkg_postrm
	gnome2_schemas_update
}
