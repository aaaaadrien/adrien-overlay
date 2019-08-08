# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

VALA_USE_DEPEND="vapigen"
VALA_MIN_API_VERSION="0.42"

# A vérifier
inherit gnome2 vala

DESCRIPTION="Outil de restauration système sous Linux"
HOMEPAGE="https://github.com/teejee2008/${PN}"
SRC_URI="${HOMEPAGE}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

#Verifier la syntaxe
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

# Noter les dépendances
DEPEND="x11-libs/gtk+
		net-misc/rsync
		"
RDEPEND="${DEPEND}"
BDEPEND=">=dev-lang/vala-0.42
		>=x11-libs/vte-0.54.4[vala]"

src_prepare() {
	# Vu github, on remplace --thread 
	sed -e 's/--thread/& Core\/AppExcludeEntry.vala/' -i 'src/makefile'
	# Y a peut être plus élégant vu que le binaire valac s'appelle valac-0.42 sur ma Calculate
	mkdir ${S}/valabin
	ln -s $(echo $(whereis valac-) | cut -d' ' -f2) ${S}/valabin/valac
	vala_src_prepare
	default
}

src_configure() {
	PATH="${S}/valabin/:$PATH"
}
