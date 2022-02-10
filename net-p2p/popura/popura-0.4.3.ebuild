# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit go-module linux-info systemd

EGO_SUM=(
        "github.com/Arceliar/ironwood v0.0.0-20211125050254-8951369625d0"
        "github.com/Arceliar/ironwood v0.0.0-20211125050254-8951369625d0/go.mod"
        "github.com/Arceliar/phony v0.0.0-20210209235338-dde1a8dca979"
        "github.com/Arceliar/phony v0.0.0-20210209235338-dde1a8dca979/go.mod"
        "github.com/BurntSushi/xgb v0.0.0-20160522181843-27f122750802/go.mod"
        "github.com/VividCortex/ewma v1.1.1/go.mod"
        "github.com/VividCortex/ewma v1.2.0"
        "github.com/VividCortex/ewma v1.2.0/go.mod"
        "github.com/cheggaaa/pb/v3 v3.0.8"
        "github.com/cheggaaa/pb/v3 v3.0.8/go.mod"
        "github.com/fatih/color v1.10.0/go.mod"
        "github.com/fatih/color v1.12.0"
        "github.com/fatih/color v1.12.0/go.mod"
        "github.com/gologme/log v1.2.0"
        "github.com/gologme/log v1.2.0/go.mod"
        "github.com/hashicorp/go-syslog v1.0.0"
        "github.com/hashicorp/go-syslog v1.0.0/go.mod"
        "github.com/hjson/hjson-go v3.1.0+incompatible"
        "github.com/hjson/hjson-go v3.1.0+incompatible/go.mod"
        "github.com/kardianos/minwinsvc v1.0.0"
        "github.com/kardianos/minwinsvc v1.0.0/go.mod"
        "github.com/lxn/walk v0.0.0-20210112085537-c389da54e794/go.mod"
        "github.com/lxn/win v0.0.0-20210218163916-a377121e959e/go.mod"
        "github.com/mattn/go-colorable v0.1.8"
        "github.com/mattn/go-colorable v0.1.8/go.mod"
        "github.com/mattn/go-isatty v0.0.12/go.mod"
        "github.com/mattn/go-isatty v0.0.13"
        "github.com/mattn/go-isatty v0.0.13/go.mod"
        "github.com/mattn/go-runewidth v0.0.12/go.mod"
        "github.com/mattn/go-runewidth v0.0.13"
        "github.com/mattn/go-runewidth v0.0.13/go.mod"
        "github.com/miekg/dns v1.1.27/go.mod"
        "github.com/miekg/dns v1.1.41"
        "github.com/miekg/dns v1.1.41/go.mod"
        "github.com/mitchellh/mapstructure v1.4.1"
        "github.com/mitchellh/mapstructure v1.4.1/go.mod"
        "github.com/rivo/uniseg v0.1.0/go.mod"
        "github.com/rivo/uniseg v0.2.0"
        "github.com/rivo/uniseg v0.2.0/go.mod"
        "github.com/vishvananda/netlink v1.1.0"
        "github.com/vishvananda/netlink v1.1.0/go.mod"
        "github.com/vishvananda/netns v0.0.0-20191106174202-0a2b9b5464df/go.mod"
        "github.com/vishvananda/netns v0.0.0-20210104183010-2eb08e3e575f"
        "github.com/vishvananda/netns v0.0.0-20210104183010-2eb08e3e575f/go.mod"
        "github.com/yggdrasil-network/yggdrasil-go v0.4.3"
        "github.com/yggdrasil-network/yggdrasil-go v0.4.3/go.mod"
        "github.com/yuin/goldmark v1.4.0/go.mod"
        "github.com/zhoreeq/meshname v0.2.0"
        "github.com/zhoreeq/meshname v0.2.0/go.mod"
        "golang.org/x/crypto v0.0.0-20190308221718-c2843e01d9a2/go.mod"
        "golang.org/x/crypto v0.0.0-20190510104115-cbcb75029529/go.mod"
        "golang.org/x/crypto v0.0.0-20191011191535-87dc89f01550/go.mod"
        "golang.org/x/crypto v0.0.0-20210421170649-83a5a9bb288b/go.mod"
        "golang.org/x/crypto v0.0.0-20210921155107-089bfa567519"
        "golang.org/x/crypto v0.0.0-20210921155107-089bfa567519/go.mod"
        "golang.org/x/exp v0.0.0-20190731235908-ec7cb31e5a56/go.mod"
        "golang.org/x/image v0.0.0-20190227222117-0694c2d4d067/go.mod"
        "golang.org/x/image v0.0.0-20190802002840-cff245a6509b/go.mod"
        "golang.org/x/mobile v0.0.0-20190312151609-d3739f865fa6/go.mod"
        "golang.org/x/mobile v0.0.0-20220112015953-858099ff7816/go.mod"
        "golang.org/x/mod v0.1.0/go.mod"
        "golang.org/x/mod v0.1.1-0.20191105210325-c90efee705ee/go.mod"
        "golang.org/x/mod v0.4.2/go.mod"
        "golang.org/x/net v0.0.0-20190311183353-d8887717615a/go.mod"
        "golang.org/x/net v0.0.0-20190404232315-eb5bcb51f2a3/go.mod"
        "golang.org/x/net v0.0.0-20190620200207-3b0461eec859/go.mod"
        "golang.org/x/net v0.0.0-20190923162816-aa69164e4478/go.mod"
        "golang.org/x/net v0.0.0-20210226172049-e18ecbb05110/go.mod"
        "golang.org/x/net v0.0.0-20210805182204-aaa1db679c0d/go.mod"
        "golang.org/x/net v0.0.0-20210927181540-4e4d966f7476/go.mod"
        "golang.org/x/net v0.0.0-20211011170408-caeb26a5c8c0/go.mod"
        "golang.org/x/net v0.0.0-20211101193420-4a448f8816b3"
        "golang.org/x/net v0.0.0-20211101193420-4a448f8816b3/go.mod"
        "golang.org/x/sync v0.0.0-20190423024810-112230192c58/go.mod"
        "golang.org/x/sync v0.0.0-20210220032951-036812b2e83c"
        "golang.org/x/sync v0.0.0-20210220032951-036812b2e83c/go.mod"
        "golang.org/x/sys v0.0.0-20190215142949-d0b11bdaac8a/go.mod"
        "golang.org/x/sys v0.0.0-20190412213103-97732733099d/go.mod"
        "golang.org/x/sys v0.0.0-20190606203320-7fc4e5ec1444/go.mod"
        "golang.org/x/sys v0.0.0-20190924154521-2837fb4f24fe/go.mod"
        "golang.org/x/sys v0.0.0-20200116001909-b77594299b42/go.mod"
        "golang.org/x/sys v0.0.0-20200217220822-9197077df867/go.mod"
        "golang.org/x/sys v0.0.0-20200223170610-d5e6a3e2c0ae/go.mod"
        "golang.org/x/sys v0.0.0-20200602225109-6fdc65e7d980/go.mod"
        "golang.org/x/sys v0.0.0-20201018230417-eeed37f84f13/go.mod"
        "golang.org/x/sys v0.0.0-20201119102817-f84b799fce68/go.mod"
        "golang.org/x/sys v0.0.0-20210303074136-134d130e1a04/go.mod"
        "golang.org/x/sys v0.0.0-20210403161142-5e06dd20ab57/go.mod"
        "golang.org/x/sys v0.0.0-20210423082822-04245dca01da/go.mod"
        "golang.org/x/sys v0.0.0-20210615035016-665e8c7367d1/go.mod"
        "golang.org/x/sys v0.0.0-20210809222454-d867a43fc93e/go.mod"
        "golang.org/x/sys v0.0.0-20210927094055-39ccf1dd6fa6/go.mod"
        "golang.org/x/sys v0.0.0-20211007075335-d3039528d8ac/go.mod"
        "golang.org/x/sys v0.0.0-20211102192858-4dd72447c267"
        "golang.org/x/sys v0.0.0-20211102192858-4dd72447c267/go.mod"
        "golang.org/x/term v0.0.0-20201126162022-7de9c90e9dd1/go.mod"
        "golang.org/x/text v0.3.0/go.mod"
        "golang.org/x/text v0.3.3/go.mod"
        "golang.org/x/text v0.3.6/go.mod"
        "golang.org/x/text v0.3.8-0.20211004125949-5bd84dd9b33b"
        "golang.org/x/text v0.3.8-0.20211004125949-5bd84dd9b33b/go.mod"
        "golang.org/x/tools v0.0.0-20180917221912-90fa682c2a6e/go.mod"
        "golang.org/x/tools v0.0.0-20190312151545-0bb0c0a6e846/go.mod"
        "golang.org/x/tools v0.0.0-20191119224855-298f0cb1881e/go.mod"
        "golang.org/x/tools v0.0.0-20191216052735-49a3e744a425/go.mod"
        "golang.org/x/tools v0.1.7/go.mod"
        "golang.org/x/tools v0.1.8-0.20211022200916-316ba0b74098/go.mod"
        "golang.org/x/xerrors v0.0.0-20190717185122-a985d3407aa7/go.mod"
        "golang.org/x/xerrors v0.0.0-20191011141410-1b5146add898/go.mod"
        "golang.org/x/xerrors v0.0.0-20200804184101-5ec99f83aff1/go.mod"
        "golang.zx2c4.com/wireguard v0.0.0-20211012062646-82d2aa87aa62/go.mod"
        "golang.zx2c4.com/wireguard v0.0.0-20211017052713-f87e87af0d9a"
        "golang.zx2c4.com/wireguard v0.0.0-20211017052713-f87e87af0d9a/go.mod"
        "golang.zx2c4.com/wireguard/windows v0.4.12"
        "golang.zx2c4.com/wireguard/windows v0.4.12/go.mod"
        )
go-module_set_globals

DESCRIPTION="Popura: alternative Yggdrasil network client"
HOMEPAGE="https://github.com/popura-network/Popura/"

SRC_URI="
        https://github.com/popura-network/Popura/archive/v${PV}+popura1.tar.gz -> ${P}+popura1.tar.gz
        ${EGO_SUM_SRC_URI}
"

S="${WORKDIR}/Popura-${PV}-popura1"

LICENSE="LGPL-3 MPL-2.0 MIT Apache-2.0 BSD ZLIB"
SLOT="0"
KEYWORDS="~amd64"
DOCS=( README.md )

DEPEND="
	acct-user/yggdrasil
	acct-group/yggdrasil
"

RDEPEND="
        dev-vcs/git
        !!net-p2p/yggdrasil-go
"

BDEPEND=">=dev-lang/go-1.16.0"

pkg_setup() {
	linux-info_pkg_setup
	if ! linux_config_exists; then
		eerror "Unable to check your kernel for TUN support"
	else
		CONFIG_CHECK="~TUN"
		ERROR_TUN="Your kernel lacks TUN support."
	fi
}

src_compile() {
        PKGNAME="${PN}" PKGVER="${PV}+popura1" \
        GOFLAGS="-trimpath -buildmode=pie -mod=readonly" \
        ./build -l "-linkmode external -extldflags \"${LDFLAGS}\""
}

src_install() {
	dobin {yggdrasil,yggdrasilctl}
	systemd_dounit "contrib/systemd/yggdrasil.service"
        systemd_dounit "contrib/systemd/yggdrasil-default-config.service"
	doinitd "contrib/openrc/yggdrasil"
}
