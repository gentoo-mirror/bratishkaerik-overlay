# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit go-module git-r3

EGIT_REPO_URI="https://github.com/bouncepaw/mycorrhiza"

DESCRIPTION="Git-based wiki engine written in Go using mycomarkup"
HOMEPAGE="https://mycorrhiza.wiki"

LICENSE="AGPL-3 MIT Apache-2.0 BSD BSD-2"
SLOT="0"
DOCS=( README.md )

BDEPEND=">=dev-lang/go-1.16.0"

RDEPEND="
	dev-vcs/git
	!!www-apps/mycorrhiza-bin
"

DEPEND="${RDEPEND}"

src_unpack() {
	git-r3_src_unpack
	go-module_live_vendor
}

src_compile() {
	go build -ldflags '-s' . || die
}

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
