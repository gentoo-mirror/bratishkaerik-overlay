# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# @ECLASS: zig.eclass
# @AUTHOR:
# BratishkaErik <bratishkaerik@getgoogleoff.me>
# @BLURB: common functions for zig builds

EXPORT_FUNCTIONS src_compile src_test src_install

BDEPEND=">=dev-lang/zig-9999"

# @FUNCTION: zig-src_compile
# @DESCRIPTION:
# Calls zig build to compile a zig project.
zig_src_compile() {
	zig build ${ZIGFLAGS} --verbose || die "build failed"
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
