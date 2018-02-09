# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit eutils unpacker

DESCRIPTION="Additional proprietary codecs for Vivaldi web browser, snapshot release."
HOMEPAGE="http://www.vivaldi.net"
SRC_URI="https://github.com/aaaaadrien/adrien-overlay/blob/c02c7aa2109de7c9f733643c0748c6e49ab5f398/www-plugins/vivaldi-ffmpeg-codecs/files/chromium-codecs-ffmpeg-extra_${PV}-0ubuntu1~ppa1~16.04.1_i386.deb"


LICENSE="LGPL2.1"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND="www-client/vivaldi"
RDEPEND="${DEPEND}"

S=${WORKDIR}

src_unpack() {
   unpack_deb ${A}
}

src_install() {
   cd ${S}
   mkdir -p ${D}/opt/vivaldi/
   cp ${S}/usr/lib/chromium-browser/libffmpeg.so ${D}/opt/vivaldi/libffmpeg.so
}
