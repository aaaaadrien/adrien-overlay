# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit eutils unpacker

DESCRIPTION="Additional proprietary codecs for Vivaldi web browser, snapshot release."
HOMEPAGE="http://www.vivaldi.net"
UBUNTU_VER="0ubuntu1~ppa2~16.04.1"
SRC_URI="http://ppa.launchpad.net/saiarcot895/chromium-beta/ubuntu/pool/main/c/chromium-browser/chromium-codecs-ffmpeg-extra_${PV}-${UBUNTU_VER}_amd64.deb"


LICENSE="LGPL2.1"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND="www-client/vivaldi-snapshot"
RDEPEND="${DEPEND}"

S=${WORKDIR}

src_unpack() {
   unpack_deb ${A}
}

src_install() {
   cd ${S}
   mkdir -p ${D}/opt/vivaldi-snapshot/
   cp ${S}/usr/lib/chromium-browser/libffmpeg.so ${D}/opt/vivaldi-snapshot/libffmpeg.so
}
