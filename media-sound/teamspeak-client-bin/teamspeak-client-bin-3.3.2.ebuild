# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit eutils unpacker

DESCRIPTION="TeamSpeak Client - Voice Communication Software"
HOMEPAGE="http://www.teamspeak.com/"
SRC_URI="
	amd64? ( https://files.teamspeak-services.com/releases/client/${PV}/TeamSpeak3-Client-linux_amd64-${PV}.run )
	x86? ( https://files.teamspeak-services.com/releases/client/${PV}/TeamSpeak3-Client-linux_x86-${PV}.run )"

LICENSE="teamspeak3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="alsa pulseaudio"

REQUIRED_USE="|| ( alsa pulseaudio )"

RDEPEND="
	dev-qt/qtcore:5
	dev-qt/qtgui:5[accessibility]
	dev-qt/qtnetwork:5
	dev-qt/qtsql:5[sqlite]
	dev-qt/qtwidgets:5
	sys-libs/glibc
	sys-libs/zlib
	alsa? ( media-libs/alsa-lib )
	pulseaudio? ( media-sound/pulseaudio )"

RESTRICT="mirror strip"

S="${WORKDIR}"

#pkg_nofetch() {
#	elog "Please download ${A}"
#	elog "from ${HOMEPAGE}?page=downloads and place this"
#	elog "file in ${DISTDIR}"
#}

src_prepare() {
	default

	# Remove unwanted soundbackends.
	if ! use alsa ; then
		rm soundbackends/libalsa* || die
	fi

	if ! use pulseaudio ; then
		rm soundbackends/libpulseaudio* || die
	fi

	# Rename the tsclient to its shorter version, required by the teamspeak3 script we install.
	mv ts3client_linux_* ts3client || die "Couldn't rename ts3client to its shorter version."
}

src_install() {
	insinto /opt/teamspeak3-client
	doins -r *

	fperms +x /opt/teamspeak3-client/ts3client

	dobin "${FILESDIR}/teamspeak3"

	make_desktop_entry teamspeak3 TeamSpeak3 \
		"/opt/teamspeak3-client/pluginsdk/docs/client_html/images/logo.png" \
		Network
}
