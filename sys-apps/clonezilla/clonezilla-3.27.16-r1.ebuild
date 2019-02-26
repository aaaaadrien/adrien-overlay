# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="The Free and Open Source Software for Disk Imaging and Cloning"
HOMEPAGE="http://clonezilla.org/"
SRC_URI="http://free.nchc.org.tw/drbl-core/src/stable/${PN}-${PV}.tar.xz"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="sys-block/partclone
sys-apps/drbl
		sys-fs/ntfs3g
		sys-block/partimage
		app-arch/pigz
net-fs/sshfs
sys-block/parted
sys-apps/gptfdisk
sys-fs/dosfstools
app-arch/gzip
app-arch/bzip2
app-arch/lbzip2
app-arch/lrzip
app-arch/pxz
app-arch/xz-utils
app-arch/lzop
sys-fs/ecryptfs-utils"
RDEPEND="${DEPEND}"
BDEPEND=""
