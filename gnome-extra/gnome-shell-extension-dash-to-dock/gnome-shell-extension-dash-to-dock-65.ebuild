# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit gnome2-utils

MY_PN="${PN/gnome-shell-extension-/}"
DESCRIPTION="A dock for the Gnome Shell."
HOMEPAGE="https://github.com/micheleg/${MY_PN}/"
SRC_URI="https://github.com/micheleg/${MY_PN}/archive/extensions.gnome.org-v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

COMMON_DEPEND="dev-libs/glib:2"
RDEPEND="${COMMON_DEPEND}
	app-eselect/eselect-gnome-shell-extensions
	<gnome-base/gnome-shell-3.31.0
"
DEPEND="${COMMON_DEPEND}"
BDEPEND="
	dev-util/intltool
	sys-devel/gettext
"

S="${WORKDIR}/dash-to-dock-extensions.gnome.org-v${PV}"

src_prepare() {
	default
	# Set correct version
	export VERSION="${PV}"
}

pkg_preinst() {
	gnome2_schemas_savelist
}

pkg_postinst() {
	gnome2_schemas_update
	ebegin "Updating list of installed extensions"
	eselect gnome-shell-extensions update
	eend $?
}

pkg_postrm() {
	gnome2_schemas_update
}
