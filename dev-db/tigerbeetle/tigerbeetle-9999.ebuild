# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3 zig

EGIT_REPO_URI="https://github.com/coilhq/tigerbeetle"

HOMEPAGE="https://www.tigerbeetle.com/"
DESCRIPTION="A distributed financial accounting database."
DOCS=( README.md )

LICENSE="Apache-2.0"
SLOT="0"

BDEPEND="=dev-lang/zig-0.9.1"
