# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
inherit autotools

DESCRIPTION="Alarm Clock is a fully-featured alarm clock for GNOME."
HOMEPAGE="https://github.com/joh/alarm-clock"
SRC_URI="https://github.com/joh/alarm-clock/archive/0.3.4.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2.0"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="dev-libs/glib
	x11-libs/gtk+:2
	gnome-base/gconf
	x11-themes/gnome-icon-theme
	media-libs/gstreamer:1.0
	x11-libs/libnotify
	dev-libs/libxml2
	dev-libs/libunique:1"
RDEPEND="${DEPEND}"

src_prepare() {
	default
	eautoreconf
}

src_configure() {
	econf
}
