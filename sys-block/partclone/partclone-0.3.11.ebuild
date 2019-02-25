# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit autotools

DESCRIPTION="Partition cloning tool"
HOMEPAGE="http://partclone.org"
SRC_URI="https://github.com/Thomas-Tsai/partclone/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="btrfs reiserfs reiser4 hfs fat minix ntfs jfs static vmfs xfs f2fs nilfs2"

RDEPEND="${common_depends}
	sys-fs/e2fsprogs
	btrfs? ( sys-fs/btrfs-progs )
	fat? ( sys-fs/dosfstools )
	ntfs? ( sys-fs/ntfs3g )
	hfs? ( sys-fs/hfsutils )
	jfs? ( sys-fs/jfsutils )
	reiserfs? ( sys-fs/progsreiserfs )
	reiser4? ( sys-fs/reiser4progs )
	xfs? ( >=sys-fs/xfsprogs-3.1.11-r1 )
	nilfs2? ( >=sys-fs/nilfs-utils-2.1.5-r1 )
	f2fs? ( >=sys-libs/e2fsprogs-libs-1.42.13 )
	static? ( sys-fs/e2fsprogs[static-libs]
			sys-libs/e2fsprogs-libs[static-libs]
			sys-fs/xfsprogs[static-libs]
			sys-libs/ncurses[static-libs]
			sys-fs/ntfs3g[static-libs]
		)"
DEPEND=""

src_prepare() {
	default

	eautoreconf
}

src_configure()
{
	local myconf

	myconf="${myconf} --enable-extfs --enable-ncursesw --enable-fs-test"
	use xfs && myconf="${myconf} --enable-xfs"
	use reiserfs && myconf="${myconf} --enable-reiserfs"
	use reiser4 && myconf="${myconf} --enable-reiser4"
	use hfs && myconf="${myconf} --enable-hfsp"
	use fat && myconf="${myconf} --enable-fat --enable-exfat"
	use ntfs && myconf="${myconf} --enable-ntfs"
	use minix && myconf="${myconf} --enable-minix"
	use jfs && myconf="${myconf} --enable-jfs"
	use btrfs && myconf="${myconf} --enable-btrfs"
	use vmfs && myconf="${myconf} --enable-vmfs"
	use f2fs && myconf="${myconf} --enable-f2fs"
	use nilfs2 && myconf="${myconf} --enable-nilfs2"
	use static && myconf="${myconf} --enable-static"

	econf ${myconf} || die "econf failed"
}

src_install()
{
	#emake install || die "make install failed"
	#emake DIST_ROOT="${D}" install || die "make install failed"
	cd ${S}/src
	dosbin partclone.dd partclone.restore partclone.chkimg partclone.info partclone.imager
	dosbin partclone.extfs
	dosym /usr/sbin/partclone.extfs /usr/sbin/partclone.ext4
	dosym /usr/sbin/partclone.extfs /usr/sbin/partclone.ext4dev
	use xfs && dosbin partclone.xfs
	use reiserfs && dosbin partclone.reiserfs
	use reiser4 && dosbin partclone.reiser4
	use hfs && dosbin partclone.hfsp
	use fat && (dosbin partclone.fat
				dosym /usr/sbin/partclone.fat /usr/sbin/partclone.fat12
				dosym /usr/sbin/partclone.fat /usr/sbin/partclone.fat16
				dosym /usr/sbin/partclone.fat /usr/sbin/partclone.fat32)
	use ntfs && dosbin partclone.ntfs
	use ntfs && (dosbin partclone.ntfsfixboot
				 dosym /usr/sbin/partclone.ntfsfixboot /usr/sbin/partclone.ntfsreloc)
	use btrfs && dosbin partclone.btrfs
	use f2fs && dosbin partclone.f2fs
	use nilfs2 && dosbin partclone.nilfs2
}

