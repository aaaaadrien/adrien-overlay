# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5
inherit eutils


DESCRIPTION="Audio Recorder Application"
HOMEPAGE="https://launchpad.net/~audio-recorder"
SRC_URI="https://launchpad.net/~${PN}/+archive/ubuntu/ppa/+files/${PN}_${PV}~bionic.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND=""
DEPEND="media-sound/pulseaudio
		media-libs/gst-plugins-good
		media-libs/gst-plugins-base
		dev-libs/libappindicator:3"

S=${WORKDIR}

src_configure() {
	cd ${S}/trunk
	econf || die "econf failed"
}

src_compile() {
	cd ${S}/trunk
	emake || die "emake failed"
}

src_install() {
	cd ${S}/trunk
	emake DESTDIR="${D}" install
}

