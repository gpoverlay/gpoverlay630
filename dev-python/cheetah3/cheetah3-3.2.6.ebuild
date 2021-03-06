# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{8..10} )
inherit distutils-r1

DESCRIPTION="Python-powered template engine and code generator"
HOMEPAGE="https://cheetahtemplate.org/ https://pypi.org/project/Cheetah3/"
SRC_URI="https://github.com/CheetahTemplate3/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
KEYWORDS="amd64 ~arm ~arm64 ~riscv x86"
SLOT="0"

RDEPEND="
	dev-python/markdown[${PYTHON_USEDEP}]
	!dev-python/cheetah
"
BDEPEND="${RDEPEND}"

DOCS=( ANNOUNCE.rst README.rst TODO )

PATCHES=(
	"${FILESDIR}/${P}-fix-py3.10-tests.patch"
)

python_prepare_all() {
	# Disable broken tests.
	sed \
		-e "/Unicode/d" \
		-e "s/if not sys.platform.startswith('java'):/if False:/" \
		-e "/results =/a\\    sys.exit(not results.wasSuccessful())" \
		-i Cheetah/Tests/Test.py || die "sed failed"

	distutils-r1_python_prepare_all
}

python_test() {
	cp -r "${S}/Cheetah/Tests/ImportHooksTemplates" \
		"${BUILD_DIR}/lib/Cheetah/Tests/ImportHooksTemplates" || die

	"${EPYTHON}" Cheetah/Tests/Test.py || die "Tests fail with ${EPYTHON}"
}
