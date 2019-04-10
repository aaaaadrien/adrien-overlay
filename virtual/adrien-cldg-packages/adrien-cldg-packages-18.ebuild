# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="Install Basic GNOME packages on Calculate Linux"
HOMEPAGE="http://www.linuxtricks.fr"
SRC_URI=""

LICENSE=""
SLOT="1"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="virtual/adrien-cldg-config
		gnome-base/gnome
		gnome-base/gnome-core-apps
		gnome-base/gnome-extra-apps
		gnome-base/gnome-shell
		gnome-base/nautilus
		gnome-extra/gnome-shell-extension-dash-to-dock
		gnome-extra/gnome-shell-extension-dash-to-panel
		gnome-extra/gnome-shell-extension-desktop-icons
		gnome-extra/gnome-shell-extensions
		x11-terms/gnome-terminal"
RDEPEND="${DEPEND}"


