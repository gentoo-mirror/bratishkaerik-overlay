# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3 zig

EGIT_REPO_URI="https://github.com/mattnite/gyro"

HOMEPAGE="https://astrolabe.pm/"
DESCRIPTION="A Zig package manager with an index, build runner, and build dependencies."
DOCS=( README.md )

LICENSE="MIT"
SLOT="0"

BDEPEND="=virtual/zig-9999"
RDEPEND="${BDEPEND}"
