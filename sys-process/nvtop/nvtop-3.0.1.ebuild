# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="GPUs process monitoring for AMD, Intel and NVIDIA"
HOMEPAGE="https://github.com/Syllo/nvtop"
SRC_URI="https://github.com/Syllo/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
KEYWORDS="amd64 x86"

LICENSE="GPL-3"
SLOT="0"

IUSE="unicode video_cards_intel video_cards_amdgpu video_cards_nvidia"

RDEPEND="
	video_cards_intel?  ( virtual/udev )
	video_cards_amdgpu? ( x11-libs/libdrm[video_cards_amdgpu] )
	video_cards_nvidia? ( x11-drivers/nvidia-drivers )
	sys-libs/ncurses:0=
"

DEPEND="${RDEPEND}"

BDEPEND="
	virtual/pkgconfig
"

src_configure() {
	local mycmakeargs=(
		-DCMAKE_INSTALL_PREFIX="${EPREFIX}/usr"
		-DCURSES_NEED_WIDE=$(usex unicode)
		-DINTEL_SUPPORT=$(usex video_cards_intel)
		-DNVIDIA_SUPPORT=$(usex video_cards_nvidia)
		-DAMDGPU_SUPPORT=$(usex video_cards_amdgpu)
	)

	cmake_src_configure
}
