# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="The Free and Open Source Software for Disk Imaging and Cloning"
HOMEPAGE="https://clonezilla.org"
SRC_URI="https://free.nchc.org.tw/drbl-core/src/stable/clonezilla-${PV}.tar.xz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="*amd64 *x86"

DEPEND="app-backup/drbl
		sys-block/partclone"
RDEPEND="${DEPEND}"
BDEPEND=""
