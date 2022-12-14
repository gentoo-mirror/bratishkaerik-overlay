# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3

EGIT_REPO_URI="https://github.com/mattnite/gyro"

HOMEPAGE="https://astrolabe.pm/ https://github.com/mattnite/gyro"
DESCRIPTION="A Zig package manager with an index, build runner, and build dependencies"
IUSE="+zsh-completion"

LICENSE="MIT"
SLOT="0"

BDEPEND="|| ( ~dev-lang/zig-0.10.0 ~dev-lang/zig-bin-0.10.0 )"
RDEPEND="${BDEPEND}"

QA_FLAGS_IGNORED='usr/bin/gyro'

src_compile() {
	zig build -Drelease-safe --verbose || die
}

src_test() {
	zig build test --verbose || die
}

src_install() {
	dobin zig-out/bin/gyro
	dodoc README.md
	insinto /usr/share/zsh/site-functions
	use zsh-completion && doins completions/_gyro
}
