# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
GST_ORG_MODULE=gst-plugins-good

inherit gstreamer-meson

DESCRIPION="JACK audio server source/sink plugin for GStreamer"
KEYWORDS="~amd64 ~arm ~arm64 ~ia64 ~ppc ~ppc64 ~riscv ~sparc ~x86"
IUSE=""

RDEPEND="virtual/jack[${MULTILIB_USEDEP}]"
DEPEND="${RDEPEND}"
