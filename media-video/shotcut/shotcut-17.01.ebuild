# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6
PLOCALES="ca cs da de el en es fr gd it nl oc pl pt_BR pt_PT ru sk uk zh_CN zh_TW"

inherit l10n qmake-utils versionator

DESCRIPTION="A free, open source, cross-platform video editor"
HOMEPAGE="http://www.shotcut.org/"
if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/mltframework/${PN}.git"
	KEYWORDS=""
else
	MY_PV=$(replace_version_separator 2 '-')
	MY_P=${PN}-${MY_PV}

	SRC_URI="https://github.com/mltframework/${PN}/archive/v${MY_PV}.tar.gz -> ${MY_P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="GPL-3"
SLOT="0"
IUSE=""

RDEPEND="
	dev-qt/qtcore:5
	dev-qt/qtdeclarative:5
	dev-qt/qtgui:5
	dev-qt/qtmultimedia:5
	dev-qt/qtnetwork:5
	dev-qt/qtopengl:5
	dev-qt/qtsql:5
	dev-qt/qtwebkit:5
	dev-qt/qtwebsockets:5
	dev-qt/qtwidgets:5
	dev-qt/qtxml:5
	media-libs/ladspa-sdk
	media-libs/libsdl:0
	media-libs/libvpx
	media-libs/mlt
	media-libs/x264
	media-plugins/frei0r-plugins
	media-sound/jack-audio-connection-kit
	media-sound/lame
	media-video/ffmpeg
"

DEPEND="${RDEPEND}"

DOCS=( README.md )

src_prepare() {
	local tsdir="${S}/translations"
	local mylrelease="$(qt5_get_bindir)"/lrelease

	prepare_locale() {
		"${mylrelease}" "${tsdir}/${PN}_${1}.ts" || die "preparing ${1} locale failed"
	}

	l10n_find_plocales_changes "${tsdir}" "${PN}_" '.ts'
	l10n_for_each_locale_do prepare_locale

	eqmake5 "PREFIX=/usr"

	default
}

src_install() {
	newicon "${S}/icons/shotcut-logo-64.png" "${PN}.png"
	make_desktop_entry shotcut "Shotcut"
	emake INSTALL_ROOT="${D}" install
}
