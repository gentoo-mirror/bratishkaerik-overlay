# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Virtual for Zig language compiler"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~arm64"

BDEPEND=""
RDEPEND="|| ( ~dev-lang/zig-${PV} ~dev-lang/zig-bin-0.10.0.1740 )"
