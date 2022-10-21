# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3

EGIT_REPO_URI="https://github.com/marler8997/zigup"

HOMEPAGE="https://github.com/marler8997/zigup"
DESCRIPTION="Download and manage zig compilers"

LICENSE="public-domain"
SLOT="0"

BDEPEND="~dev-lang/zig-9999"

QA_FLAGS_IGNORED='usr/bin/zigup'

src_unpack() {
	git-r3_src_unpack
	cd "${S}" || die
	zig build -Dfetch || die
}

src_compile() {
	zig build -Drelease-safe --verbose || die
}

src_test() {
	zig build test -Drelease-safe --verbose || die
}

src_install() {
	DESTDIR="${D}" zig build install --prefix "${EPREFIX}"/usr -Drelease-safe --verbose || die
	dodoc README.md
}
