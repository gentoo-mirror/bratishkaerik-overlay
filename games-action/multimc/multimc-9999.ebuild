# Copyright 2019-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit desktop java-pkg-2 xdg cmake git-r3

DESCRIPTION="An advanced Qt5-based open-source launcher for Minecraft"
HOMEPAGE="https://multimc.org
	https://github.com/MultiMC/MultiMC5"

EGIT_REPO_URI="https://github.com/MultiMC/MultiMC5"

LICENSE="Apache-2.0 LGPL-2.1-with-linking-exception LGPL-3"
SLOT="0"

COMMON_DEPEND="
	dev-qt/qtcore:5
	dev-qt/qtwidgets:5
	dev-qt/qtconcurrent:5
	dev-qt/qtnetwork:5
	dev-qt/qtgui:5
	dev-qt/qttest:5
	dev-qt/qtxml:5
"
DEPEND="${COMMON_DEPEND}
	>=virtual/jdk-1.8.0
"
RDEPEND="${COMMON_DEPEND}
	sys-libs/zlib
	>=virtual/jre-1.8.0
	virtual/opengl
	x11-libs/libXrandr
"

src_unpack() {
        git-r3_src_unpack
}

src_prepare() {
	cmake_src_prepare
	sed -r -i 's/-Werror([a-z=-]+)?//g' CMakeLists.txt || die
}

src_configure() {
	local mycmakeargs=(
		-DMultiMC_LAYOUT=lin-system
	)
	cmake_src_configure
}

src_install() {
	cmake_src_install
	domenu launcher/package/linux/multimc.desktop
	doicon -s scalable launcher/resources/multimc/scalable/multimc.svg
}
