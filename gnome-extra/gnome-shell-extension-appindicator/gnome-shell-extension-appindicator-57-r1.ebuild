# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit xdg-utils meson

DESCRIPTION="Support legacy, AppIndicators and KStatusNotifierItems in Gnome"
HOMEPAGE="https://github.com/ubuntu/gnome-shell-extension-appindicator"
SRC_URI="https://github.com/ubuntu/gnome-shell-extension-appindicator/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64"

RDEPEND="
	app-eselect/eselect-gnome-shell-extensions
	>=gnome-base/gnome-shell-45
"
BDEPEND="
	app-misc/jq
"

src_prepare() {
	default
}

src_install() {
	meson_src_install
	rm "${ED}"/usr/share/glib-2.0/schemas/gschemas.compiled || die
}

pkg_preinst() {
	xdg_schemas_savelist
}

pkg_postinst() {
	xdg_schemas_update
	ebegin "Updating list of installed extensions"
	eselect gnome-shell-extensions update
	eend $?
}

pkg_postrm() {
	xdg_schemas_update
}
