# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Git-based wiki engine written in Go using mycomarkup (pre-built package)"
HOMEPAGE="https://mycorrhiza.wiki"

KEYWORDS="~amd64 ~x86"

SRC_URI="amd64? ( https://github.com/bouncepaw/mycorrhiza/releases/download/v${PV}/mycorrhiza-v${PV}-linux-amd64.tar.gz )
	x86? ( https://github.com/bouncepaw/mycorrhiza/releases/download/v${PV}/mycorrhiza-v${PV}-linux-386.tar.gz )
"

S="${WORKDIR}"

LICENSE="AGPL-3 MIT Apache-2.0 BSD BSD-2"
SLOT="0"
DOCS=( README.md )

RDEPEND="
	dev-vcs/git
	!!www-apps/mycorrhiza
"

DEPEND="${RDEPEND}"

src_install() {
	dobin mycorrhiza
}

pkg_postinst() {
	elog "Quick start: /usr/bin/mycorrhiza /your/wiki/directory"
	elog
	elog "It will initialize a Git repository, set useful default settings"
	elog "And run a server on http://localhost:1737"
	elog "More information here: https://mycorrhiza.wiki/"
	elog "Also your wiki has built-in documentation :)"
	elog "You can view this documentation at http://localhost:1737/help"
}
