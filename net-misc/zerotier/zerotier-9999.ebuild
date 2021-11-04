# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit flag-o-matic llvm systemd toolchain-funcs

HOMEPAGE="https://www.zerotier.com/"
DESCRIPTION="A software-based managed Ethernet switch for planet Earth"

if [[ ${PV} != 9999* ]] ; then
	SRC_URI="https://github.com/zerotier/ZeroTierOne/archive/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~arm ~arm64 ~x86"
	S="${WORKDIR}/ZeroTierOne-${PV}"
else
	EGIT_REPO_URI="https://github.com/zerotier/ZeroTierOne"
	inherit git-r3
fi

EGIT_BRANCH="dev"

LICENSE="BSL-1.1"
SLOT="0"
IUSE="+clang"

RDEPEND="
	dev-libs/json-glib
	net-libs/libnatpmp
	net-libs/miniupnpc:=
	clang? ( sys-devel/clang )"

DEPEND="${RDEPEND}"

DOCS=( README.md AUTHORS.md )

pkg_setup() {
	llvm_pkg_setup
	if use clang && ! tc-is-clang ; then
		export CC=${CHOST}-clang
		export CXX=${CHOST}-clang++
		append-cflags -fPIE
		append-cppflags -fPIE
	else
		tc-export CXX CC
	fi
}

src_compile() {
	append-ldflags -Wl,-z,noexecstack
	append-cflags -fPIE
	append-cxxflags -fPIE
	emake CXX="${CXX}" STRIP=: one
}

src_test() {
	emake selftest
	./zerotier-selftest || die
}

src_install() {
	default
	# remove pre-zipped man pages
	rm "${ED}"/usr/share/man/{man1,man8}/* || die

	newinitd "${FILESDIR}/${PN}".init "${PN}"
	systemd_dounit "${FILESDIR}/${PN}".service
	doman doc/zerotier-{cli.1,idtool.1,one.8}
}
