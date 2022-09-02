# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3

EGIT_REPO_URI="https://github.com/zigtools/zls"

HOMEPAGE="https://github.com/zigtools/zls"
DESCRIPTION="Zig LSP implementation + Zig Language Server"

LICENSE="MIT"
SLOT="0"

BDEPEND="~dev-lang/zig-9999"

QA_FLAGS_IGNORED="usr/bin/zls"

src_compile() {
	zig-stage1 build -Drelease-safe -Ddata_version=master --verbose || die
}

src_test() {
	zig-stage1 build test --verbose || die
}

src_install() {
	DESTDIR="${D}" zig-stage1 build install --prefix "${EPREFIX}"/usr --verbose || die
	dodoc README.md
}

pkg_postinst() {
	elog "For creating or updating config: zls --config"
}
