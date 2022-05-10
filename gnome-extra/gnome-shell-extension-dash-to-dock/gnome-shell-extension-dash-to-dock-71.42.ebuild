# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit gnome2-utils

MY_PN="${PN/gnome-shell-extension-/}"
DESCRIPTION="A dock for the Gnome Shell."
HOMEPAGE="https://micheleg.github.io/dash-to-dock/"
#SRC_URI="https://extensions.gnome.org/extension-data/dash-to-dockmicxgx.gmail.com.v${PV}.shell-extension.zip -> ${P}.zip"
MY_COMMIT="004f257"
SRC_URI="https://github.com/micheleg/dash-to-dock/archive/${MY_COMMIT}.tar.gz"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="amd64"
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

S="${WORKDIR}/dash-to-dock-004f257c3dea5f1851dadd753be87afc555b3dfb/"

PATCHES=("${FILESDIR}"/1656.patch )


src_prepare() {
	default
	# Set correct version
	export VERSION="${PV}"
}

#src_compile() {
#:;
#}

src_install() {
	local uu=$(awk -F'"' '/uuid/ {print $4}' metadata.json)
	insinto /usr/share/gnome-shell/extensions/${uu}
	doins -r *.js{,on} *.ui *.css
	#insinto /usr/share/locale
	#doins -r locale/*
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
