# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

COMMIT=e8307b2ff312bf4efb0d58a7ae148c72a5119daf
inherit cmake

DESCRIPTION="Automatic BPM detection utility"
HOMEPAGE="https://github.com/aaaaadrien/bpmdetect"
SRC_URI="https://github.com/aaaaadrien/${PN}/archive/${COMMIT}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/${PN}-${COMMIT}"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND="
	dev-qt/qtcore:5
	dev-qt/qtgui:5
	dev-qt/qtmultimedia:5
	dev-qt/qtwidgets:5
	media-libs/flac
	media-libs/libmad
	media-libs/libvorbis
	media-libs/portaudio
	media-libs/taglib
"
DEPEND="${RDEPEND}"
BDEPEND="
	virtual/pkgconfig
"

src_install() {
	einstalldocs
	dobin "${BUILD_DIR}"/src/${PN}
}
