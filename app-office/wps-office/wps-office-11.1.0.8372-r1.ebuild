# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
inherit fdo-mime font gnome2-utils unpacker versionator

MY_BRANCH=$(get_version_component_range 4)

DESCRIPTION="WPS Office is an office productivity suite"
HOMEPAGE="http://linux.wps.cn/ http://wps-community.org/"

KEYWORDS="amd64 x86"

SRC_URI="
	x86? ( http://kdl.cc.ksosoft.com/wps-community/download/${MY_BRANCH}/${PN}_${PV}_i386.deb )
	amd64? ( http://kdl.cc.ksosoft.com/wps-community/download/${MY_BRANCH}/${PN}_${PV}_amd64.deb )
"

SLOT="0"
RESTRICT="strip mirror"
LICENSE="WPS-EULA"
IUSE="+sharedfonts"

UNBUNDLED_LIBS="
	media-libs/phonon
"

NATIVE_DEPEND="
	app-arch/bzip2
	dev-libs/expat
	dev-libs/glib:2
	dev-libs/libffi
	dev-libs/libxml2:2
	media-libs/fontconfig:1.0
	media-libs/freetype:2
	media-libs/glu
	media-libs/gst-plugins-base
	media-libs/gstreamer
	media-libs/libpng:1.2
	virtual/opengl
	media-libs/tiff:3
	sys-apps/util-linux
	sys-libs/zlib
	x11-libs/libdrm
	x11-libs/libICE
	x11-libs/libSM
	x11-libs/libX11
	x11-libs/libXau
	x11-libs/libxcb
	x11-libs/libXdamage
	x11-libs/libXdmcp
	x11-libs/libXext
	x11-libs/libXfixes
	x11-libs/libXrender
	x11-libs/libXxf86vm
	media-libs/libmng
	net-print/cups
"
RDEPEND="
	${UNBUNDLED_LIBS}
	${NATIVE_DEPEND}
	net-nds/openldap
	dev-db/sqlite:3
"
DEPEND=""

S="${WORKDIR}"

src_install() {
	exeinto /usr/bin
	exeopts -m0755
	doexe "${S}"/usr/bin/wps
	doexe "${S}"/usr/bin/wpp
	doexe "${S}"/usr/bin/et

	if ! use sharedfonts; then
		insinto /opt/kingsoft/wps-office/office6/fonts
		doins -r "${S}"/usr/share/fonts/wps-office/*
		rm -rf "${S}"/usr/share/fonts || die
	fi

	insinto /usr
	doins -r "${S}"/usr/share

	insinto /
	doins -r "${S}"/opt
	fperms 0755 /opt/kingsoft/wps-office/office6/{wps,wpp,et}
}

pkg_preinst() {
	gnome2_icon_savelist
}

pkg_postinst() {
	use sharedfonts && font_pkg_postinst
	fdo-mime_desktop_database_update
	fdo-mime_mime_database_update
	gnome2_icon_cache_update
}

pkg_postrm() {
	fdo-mime_desktop_database_update
	gnome2_icon_cache_update
}
