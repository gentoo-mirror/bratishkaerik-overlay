# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# @ECLASS: zig.eclass
# @AUTHOR:
# BratishkaErik <bratishkaerik@getgoogleoff.me>
# @SUPPORTED_EAPIS: 7 8
# @MAINTAINER:
# BratishkaErik <bratishkaerik@getgoogleoff.me>
# @BLURB: common functions for zig builds

case ${EAPI} in
	7|8) ;;
	*) die "${ECLASS}: EAPI ${EAPI:-0} not supported" ;;
esac

inherit flag-o-matic

EXPORT_FUNCTIONS src_compile src_test src_install

# @FUNCTION: zig-src_compile
# @DESCRIPTION:
# Calls zig build to compile a zig project.
zig_src_compile() {
	zig build ${ZIGFLAGS} --verbose || die "build failed"
}

# @FUNCTION: zig_src_compile_no_release_mode_choice
# @DESCRIPTION:
# Workaround for setPreferredReleaseMode() in build.zig
# From documentation:
# This provides the -Drelease option to the build user and does not give them the choice.
zig_src_compile_no_release_mode_choice() {
	_filter-var ZIGFLAGS "-Drelease*"
	export ZIGFLAGS+="-Drelease=true"
	zig_src_compile
}


# @FUNCTION: zig-src_test
# @DESCRIPTION:
# Calls zig build to test a zig project.
zig_src_test() {
	zig build test --verbose || die "test failed"
}

# @FUNCTION: zig-src_install
# @DESCRIPTION:
# Calls zig build to install a zig project.
zig_src_install() {
	debug-print-function ${FUNCNAME} "$@"

	DESTDIR="${D}" zig build install --prefix "/usr" --verbose
	echo "$@" >&2
	"$@" || die "install failed"
}
