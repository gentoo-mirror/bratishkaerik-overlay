# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3

EGIT_REPO_URI="https://github.com/nektro/zigmod"

HOMEPAGE="https://aquila.red/"
DESCRIPTION="A package manager for the Zig programming language."
LICENSE="MIT"
SLOT="0"

BDEPEND="~dev-lang/zig-9999"
RDEPEND="${BDEPEND}"

QA_FLAGS_IGNORED='usr/bin/zigmod'

src_unpack() {
	git-r3_src_unpack
	cd "${S}"
	zig build -Drelease -Duse-full-name --verbose || die
}

src_install() {
	DESTDIR="${D}" zig build install -Drelease -Duse-full-name --prefix "${EPREFIX}"/usr --verbose || die

	dodoc -r docs/
	dodoc README.md
}
