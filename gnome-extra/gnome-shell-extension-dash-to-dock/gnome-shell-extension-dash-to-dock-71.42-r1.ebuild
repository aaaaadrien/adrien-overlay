# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit gnome2-utils eutils

MY_PN="${PN/gnome-shell-extension-/}"
MY_PV="71"
MY_COMMIT="b5df5d2ea09074f88b32af32d3b9326334a4f75a"
DESCRIPTION="A dock for the Gnome Shell."
HOMEPAGE="https://micheleg.github.io/dash-to-dock/"
#SRC_URI="https://extensions.gnome.org/extension-data/dash-to-dockmicxgx.gmail.com.v${PV}.shell-extension.zip -> ${P}.zip"
#SRC_URI="https://extensions.gnome.org/extension-data/dash-to-dockmicxgx.gmail.com.v${MY_PV}.shell-extension.zip -> ${P}.zip"
SRC_URI="https://github.com/halfmexican/dash-to-dock-pop/archive/${MY_COMMIT}.zip -> ${P}.zip"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

COMMON_DEPEND="dev-libs/glib:2"
RDEPEND="${COMMON_DEPEND}
	app-eselect/eselect-gnome-shell-extensions
	>=gnome-base/gnome-shell-40
"
DEPEND="${COMMON_DEPEND}"
BDEPEND="
	dev-util/intltool
	sys-devel/gettext
"

#PATCHES=( "${FILESDIR}"/v71-gnome42.patch )

S="${WORKDIR}"

src_prepare() {
	default
	# Set correct version
	export VERSION="${PV}"
}

#src_compile() {
#:;
#}

src_install() {
	insinto /usr/share/gnome-shell/extensions/dash-to-dock@micxgx.gmail.com
	doins -r *.js{,on} *.ui *.css
	insinto /usr/share/locale
	doins -r locale/*
	insinto /usr/share/glib-2.0/schemas
	doins schemas/org.gnome.shell.extensions.dash-to-dock.gschema.xml
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
