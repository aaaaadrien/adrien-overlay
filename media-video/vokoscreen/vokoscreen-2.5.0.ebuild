# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="vokoscreen is an easy to use screencast creator to record educational videos, live recordings of browser, installation, videoconferences, etc."
HOMEPAGE="http://linuxecke.volkoh.de/vokoscreen/vokoscreen.html"
SRC_URI="https://github.com/vkohaupt/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

inherit qmake-utils l10n


DEPEND="dev-qt/qtcore:5
	dev-qt/qtgui:5
	dev-qt/qtnetwork:5
	dev-qt/qtwidgets:5
	dev-qt/qtscript:5
	dev-qt/qttranslations:5
	media-sound/pulseaudio
"

RDEPEND="${DEPEND}"


