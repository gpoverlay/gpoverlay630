# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6
USE_RUBY="ruby24 ruby25 ruby26 ruby27"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"
RUBY_FAKEGEM_RECIPE_TEST="rspec3"
RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"

RUBY_FAKEGEM_GEMSPEC="cucumber-core.gemspec"

inherit ruby-fakegem eapi7-ver

DESCRIPTION="Executable feature scenarios"
HOMEPAGE="https://cucumber.io/"
SRC_URI="https://github.com/cucumber/cucumber-ruby-core/archive/v${PV}.tar.gz -> ${P}.tar.gz"
RUBY_S="cucumber-ruby-core-${PV}"
LICENSE="Ruby"

KEYWORDS="amd64 arm arm64 ~hppa ppc ppc64 ~s390 sparc x86"
SLOT="$(ver_cut 1-2)"
IUSE="test"

ruby_add_bdepend "
	test? (
		>=dev-ruby/unindent-1.0
	)"

ruby_add_rdepend "
	>=dev-ruby/backports-3.8.0
	>=dev-util/cucumber-tag_expressions-1.1.0
	dev-ruby/gherkin:5
"

all_ruby_prepare() {
	# Avoid dependency on kramdown to keep dependency list manageable for all arches.
	rm -f spec/readme_spec.rb || die

	sed -i -e '1igem "gherkin"' $(find spec -name "*_spec.rb") || die
}
