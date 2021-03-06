# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit xorg-3

DESCRIPTION="X rendering operation stress test utility"

KEYWORDS="~alpha amd64 arm arm64 ~hppa ~ia64 ~mips ppc ppc64 ~s390 sparc x86"
IUSE=""

RDEPEND="x11-libs/libX11
	x11-libs/libXmu
	x11-libs/libXft
	x11-libs/libXrender
	x11-libs/libXext"
DEPEND="${RDEPEND}
	x11-base/xorg-proto"
