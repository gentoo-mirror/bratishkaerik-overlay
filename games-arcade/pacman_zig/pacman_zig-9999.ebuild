# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3 zig

EGIT_REPO_URI="https://github.com/floooh/pacman.zig"

HOMEPAGE="https://github.com/floooh/pacman.zig"
DESCRIPTION="Simple Pacman clone written in Zig."
DOCS=( README.md )

LICENSE="MIT"
SLOT="0"

BDEPEND="
	=dev-lang/zig-9999
	x11-libs/libX11
	x11-libs/libXi
	x11-libs/libXcursor
	media-libs/libglvnd[X(+)]
	media-libs/alsa-lib
"
