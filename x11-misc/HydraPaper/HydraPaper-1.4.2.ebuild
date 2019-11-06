# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
inherit ninja-utils meson

DESCRIPTION="Set two different backgrounds for each monitor on GNOME"
HOMEPAGE="https://gitlab.com/gabmus/${PN}"
SRC_URI="https://gitlab.com/gabmus/HydraPaper/-/archive/${PV}/HydraPaper-${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPLv3+"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=x11-libs/gtk+-3.20
		dev-util/ninja
		>=dev-util/meson-0.40.0"
RDEPEND="${DEPEND}"
