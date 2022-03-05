# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3 zig

EGIT_REPO_URI="https://github.com/nektro/zigmod"
HOMEPAGE="https://aquila.red/"
DESCRIPTION="A package manager for the Zig programming language."

LICENSE="MIT"
SLOT="0"

RDEPEND=">=dev-lang/zig-9999"

DOCS=( README.md )

RESTRICT="network-sandbox"

src_compile() {
        zig build -Dbootstrap || die
        ./zig-out/bin/zigmod ci || die
	zig build || die
}
