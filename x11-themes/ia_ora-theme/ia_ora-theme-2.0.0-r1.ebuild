# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: 

EAPI="5"

inherit autotools eutils

DESCRIPTION="Fork of Mandriva's Ia Ora Mandriva Theme "
HOMEPAGE="https://github.com/aaaaadrien/ia_ora-theme"
SRC_URI="https://github.com/aaaaadrien/ia_ora-theme/archive/${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="x11-libs/gtk+:2"
RDEPEND="${DEPEND}"

S=${WORKDIR}/${P}

#src_prepare() {
#}

src_install() {
	emake DESTDIR="${D}" install
	rm -f "${D}usr/$(get_libdir)/gtk-2.0/2.10.0/engines/libia_ora.la" \
		|| die "removing .la file"
	dodoc AUTHORS README ChangeLog
}
