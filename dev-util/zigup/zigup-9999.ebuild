# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3 zig

EGIT_REPO_URI="https://github.com/marler8997/zigup"

HOMEPAGE="https://github.com/marler8997/zigup"
DESCRIPTION="Download and manage zig compilers."
DOCS=( README.md )

LICENSE="public-domain"
SLOT="0"

BDEPEND=">=dev-lang/zig-9999"

RESTRICT="network-sandbox"

src_compile() {
	zig build -Dfetch || die
	zig_src_compile
}
