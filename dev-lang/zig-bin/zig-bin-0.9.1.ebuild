# Copyright 2019-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="A robust, optimal, and maintainable programming language"
HOMEPAGE="https://ziglang.org/"
SRC_URI="
	amd64? ( https://ziglang.org/download/${PV}/zig-linux-x86_64-${PV}.tar.xz )
	arm? ( https://ziglang.org/download/${PV}/zig-linux-armv7a-${PV}.tar.xz )
	arm64? ( https://ziglang.org/download/${PV}/zig-linux-aarch64-${PV}.tar.xz )
	x86? ( https://ziglang.org/download/${PV}/zig-linux-i386-${PV}.tar.xz )"
KEYWORDS="-* ~amd64 ~arm ~arm64 ~x86"

LICENSE="MIT"
SLOT="0"

RDEPEND="!!dev-lang/zig"
DEPEND=""

src_unpack() {
	unpack ${A}

	mv "${WORKDIR}/"* "${S}"
}

src_install() {
	insinto /opt/
	doins -r "${S}"

	dosym "../../opt/${P}/zig" /usr/bin/zig
	fperms 0755 /usr/bin/zig

        # install the @zig-rebuild set for Portage
	insinto /usr/share/portage/config/sets
	newins "${FILESDIR}"/zig-sets.conf zig.conf
}

pkg_postinst() {
	[[ -z ${REPLACING_VERSIONS} ]] && return
	elog "After ${CATEGORY}/${PN} is updated it is recommended to rebuild"
	elog "all packages compiled with previous versions of ${CATEGORY}/${PN}"
	elog "due to the static linking nature of Zig."
	elog "If this is not done, the packages compiled with the older"
	elog "version of the compiler will not be updated until they are"
	elog "updated individually, which could mean they will have"
	elog "vulnerabilities."
	elog "Run 'emerge @zig-rebuild' to rebuild all 'zig' packages"
}
