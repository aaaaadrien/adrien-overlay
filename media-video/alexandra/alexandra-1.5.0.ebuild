# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

PLOCALES="cs de fr"

inherit qmake-utils l10n

DESCRIPTION="Small, fast, but powerful video library, written in C++ with Qt5."
HOMEPAGE="https://github.com/jeka-js/alexandra"
SRC_URI="https://github.com/jeka-js/alexandra/archive/${PV}.tar.gz -> ${P}.tar.gz"
KEYWORDS="amd64 x86"
LICENSE="GPL-2"
SLOT="0"

# Deps in makefile seemed to be -core, -network, -script, -gui, -webkit, but the
# given packages seem to be deprecated...
DEPEND="dev-qt/qtcore:5
	dev-qt/qtgui:5
	dev-qt/qtnetwork:5
	dev-qt/qtwidgets:5
	dev-qt/qtscript:5
	media-libs/libmediainfo
"

# -DMEDIAINFO_SUPPORT

RDEPEND="${DEPEND}"

gen_translation() {
	lrelease ${PN}-${1}.ts
	eend $? || die "failed to generate $1 translation"
}

src_compile() {
	eqmake5 ${PN}.pro
	emake

	cd "${S}"/lang
	l10n_for_each_locale_do gen_translation
}

install_locale() {
	insinto /usr/share/${PN}/translations
	doins "${S}"/src/translations/${PN}-${1}.qm
	eend $? || die "failed to install $1 translation"
}

src_install() {
	#dobin ${PN}
	emake INSTALL_ROOT="${D}" install || die
	domenu linux/${PN}.desktop
	doicon linux/${PN}.png
	dodoc Changelog

	l10n_for_each_locale_do install_locale
}
