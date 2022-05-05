# Copyright 2019-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="A robust, optimal, and maintainable programming language"
HOMEPAGE="https://ziglang.org/"
KEYWORDS="-* ~amd64 ~arm64"

LICENSE="MIT"
SLOT="0"

RDEPEND="!!dev-lang/zig"

RESTRICT="network-sandbox"

src_unpack() {
	MASTER_VERSION="$(curl -s https://ziglang.org/download/index.json | jq --raw-output '.master.version')"

	use amd64 && MY_V="zig-linux-x86_64-${MASTER_VERSION}"
	use arm64 && MY_V="zig-linux-aarch64-${MASTER_VERSION}"
	wget "https://ziglang.org/builds/${MY_V}.tar.xz" || die

	unpack ./"${MY_V}.tar.xz"
	mv "${MY_V}" "${S}" || die
}

QA_PREBUILT="opt/${P}/zig"

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
