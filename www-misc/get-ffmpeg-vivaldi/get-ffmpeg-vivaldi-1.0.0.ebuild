# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Get ffmpeg for Vivaldi to play x264 videos"
HOMEPAGE="https://github.com/aaaaadrien/get-ffmpeg-vivaldi"
SRC_URI="https://github.com/aaaaadrien/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	dobin ${PN}
}
