# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

KDE_ORG_COMMIT=a2593ff9cf5d0af885c20c2e9f9faa6ca4f1c1a3
inherit qt5-build

DESCRIPTION="Set of next generation Qt Quick controls for the Qt5 framework"

if [[ ${QT5_BUILD_TYPE} == release ]]; then
	KEYWORDS="~amd64 ~arm ~arm64 ~ppc64 ~riscv ~x86"
fi

IUSE="widgets"

DEPEND="
	~dev-qt/qtcore-${PV}
	~dev-qt/qtdeclarative-${PV}
	~dev-qt/qtgui-${PV}
	widgets? ( ~dev-qt/qtwidgets-${PV} )
"
RDEPEND="${DEPEND}
	~dev-qt/qtgraphicaleffects-${PV}
"

src_prepare() {
	qt_use_disable_mod widgets widgets \
		src/imports/platform/platform.pro

	qt5-build_src_prepare
}
