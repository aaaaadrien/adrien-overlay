# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit eutils 

DESCRIPTION="Snoopy will log execve() calls into syslog."
HOMEPAGE="https://github.com/a2o/snoopy"
SRC_URI="https://github.com/a2o/snoopy/archive/snoopy-${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="x86 amd64"
IUSE=""

DEPEND="net-misc/socat"
RDEPEND="${DEPEND}"

src_configure() {
	if [[ -x ${ECONF_SOURCE:-.}/configure ]] ; then
		econf
	fi
}

src_compile() {
	if [ -f Makefile ] || [ -f GNUmakefile ] || [ -f makefile ] ; then
		emake || die "emake failed"
	fi
}

src_install() {
	#make DESTDIR="${D}" install
	if [[ -f Makefile ]] || [[ -f GNUmakefile ]] || [[ -f makefile ]]; then
		emake DESTDIR="${D}" install
	fi
	einstalldocs
	#newinitd "${FILESDIR}/snoopy.initd" snoopy

}

pkg_postinst() {
	einfo "To enable snoopy use snoopy-enable"
	einfo "To disable snoopy use snoopy-disable"
	einfo "All actions ars stored in auth.log file"
}
