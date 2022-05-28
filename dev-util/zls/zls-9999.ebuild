# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3 zig

EGIT_REPO_URI="https://github.com/zigtools/zls"

HOMEPAGE="https://github.com/zigtools/zls"
DESCRIPTION="Zig LSP implementation + Zig Language Server"
DOCS=( README.md )

LICENSE="MIT"
SLOT="0"

BDEPEND="=dev-lang/zig-9999"
RDEPEND="${BDEPEND}"

pkg_postinst() {
	elog "Quick start: /usr/bin/zls config"
	elog "It will configure ZLS"
}
