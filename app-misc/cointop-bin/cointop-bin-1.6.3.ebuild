# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

#inherit go-module
inherit eutils

DESCRIPTION="A fast and lightweight terminal based UI for tracking cryptocurrencies"
HOMEPAGE="https://github.com/miguelmota/cointop"
# need network, i take bin
#SRC_URI="https://github.com/miguelmota/cointop/archive/v${PV}.tar.gz -> ${P}.tar.gz"
SRC_URI="https://github.com/miguelmota/cointop/releases/download/v${PV}/cointop_${PV}_linux_amd64.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

#src_compile() {
#	ewarn "Need to enable FEATURES=-network-sandbox"
#	export -n GOCACHE XDG_CACHE_HOME
#	go build -o bin/cointop main.go || die "build failed"
#}

#src_install() {
#	einstalldocs
#	dobin bin/cointop
#}

S="${WORKDIR}"
src_install() {
   dobin cointop
}
