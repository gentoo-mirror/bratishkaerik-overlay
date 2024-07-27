# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit linux-mod-r1

COMMIT="0b12ea54b7d6dcbfa4ce94eb403b1447565407f1"

DESCRIPTION="Linux kernel module for USB adapters based on RTL8811AU and RTL8821AU"
HOMEPAGE="https://github.com/morrownr/8821au-20210708"

SRC_URI="https://github.com/morrownr/8821au-20210708/archive/${COMMIT}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/8821au-20210708-${COMMIT}"

LICENSE="GPL-2"
SLOT=0
KEYWORDS="~amd64"

MODULES_KERNEL_MIN=5.12

src_compile() {
	local modlist=( 8821au=net/wireless )
	local modargs=( KSRC="${KV_OUT_DIR}" )

	linux-mod-r1_src_compile
}
