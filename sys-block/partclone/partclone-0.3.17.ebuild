# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit autotools 
	MY_PV="5e00059"
	#[[ -n ${PV%%*_p*} ]] && MY_PV="${PV}"
	SRC_URI="https://github.com/Thomas-Tsai/${PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz	"
	KEYWORDS="amd64"

DESCRIPTION="Partition cloning tool"
HOMEPAGE="https://partclone.org"

LICENSE="GPL-2"
SLOT="0"
IUSE="
apfs btrfs +e2fs exfat f2fs fat fuse hfs minix ncurses nilfs2 ntfs reiser4
reiserfs static xfs
"

RDEPEND="
	dev-libs/openssl:*
	e2fs? ( sys-fs/e2fsprogs )
	btrfs? ( sys-apps/util-linux )
	fuse? ( sys-fs/fuse:0 )
	ncurses? ( sys-libs/ncurses:0 )
	nilfs2? ( sys-fs/nilfs-utils )
	ntfs? ( sys-fs/ntfs3g )
	reiserfs? ( sys-fs/progsreiserfs )
	reiser4? ( sys-fs/reiser4progs )
	xfs? ( sys-apps/util-linux )
	static? (
		dev-libs/openssl:*[static-libs]
		e2fs? (
			sys-fs/e2fsprogs[static-libs]
			sys-libs/e2fsprogs-libs[static-libs]
		)
		btrfs? ( sys-apps/util-linux[static-libs] )
		fuse? ( sys-fs/fuse:0[static-libs] )
		ncurses? ( sys-libs/ncurses:0[static-libs] )
		nilfs2? ( sys-fs/nilfs-utils[static-libs] )
		ntfs? ( sys-fs/ntfs3g[static-libs] )
		reiserfs? ( sys-fs/progsreiserfs[static-libs] )
		reiser4? ( sys-fs/reiser4progs[static-libs] )
	)
"
DEPEND="
	${RDEPEND}
"
DOCS=( AUTHORS ChangeLog HACKING NEWS README.md TODO )

src_prepare() {
	default
	eautoreconf
}

src_configure() {
	local myconf=(
		$(use_enable e2fs extfs)
		$(use_enable apfs)
		$(use_enable btrfs)
		$(use_enable exfat)
		$(use_enable f2fs)
		$(use_enable fat)
		$(use_enable fuse)
		$(use_enable hfs hfsp)
		$(use_enable minix)
		$(use_enable ncurses ncursesw)
		$(use_enable nilfs2)
		$(use_enable ntfs)
		$(use_enable reiserfs)
		$(use_enable reiser4)
		$(use_enable static)
		$(use_enable xfs)
	)
	econf "${myconf[@]}"
}
