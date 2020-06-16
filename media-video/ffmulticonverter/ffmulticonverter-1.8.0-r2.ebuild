# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

PYTHON_COMPAT=( python3_{4,5,6,7,8} )

inherit eutils distutils-r1

DESCRIPTION="FF Multi Converter is a simple graphical application which enables you to convert audio, video, image and document files between all popular formats"
HOMEPAGE="https://sourceforge.net/projects/ffmulticonv/"
SRC_URI="mirror://sourceforge/project/ffmulticonv/${P}.tar.gz"

LICENSE="GPLv3"
SLOT="0"

KEYWORDS="x86 amd64"

IUSE="ffmpeg libav imagemagick unoconv"

DEPEND="dev-lang/python
	dev-python/PyQt5
	ffmpeg? ( media-video/ffmpeg )
	libav? ( media-video/libav )
	imagemagick? ( media-gfx/imagemagick )
	unoconv? ( app-office/unoconv )"
RDEPEND="${DEPEND}"

