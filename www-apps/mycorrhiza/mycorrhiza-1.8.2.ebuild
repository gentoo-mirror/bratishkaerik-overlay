# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit go-module

EGO_SUM=(
        "github.com/andybalholm/brotli v1.0.2/go.mod"
        "github.com/andybalholm/brotli v1.0.3/go.mod"
        "github.com/bouncepaw/mycomarkup/v3 v3.6.2"
        "github.com/bouncepaw/mycomarkup/v3 v3.6.2/go.mod"
        "github.com/davecgh/go-spew v1.1.0"
        "github.com/davecgh/go-spew v1.1.0/go.mod"
        "github.com/go-ini/ini v1.63.2"
        "github.com/go-ini/ini v1.63.2/go.mod"
        "github.com/golang/snappy v0.0.3/go.mod"
        "github.com/gorilla/feeds v1.1.1"
        "github.com/gorilla/feeds v1.1.1/go.mod"
        "github.com/gorilla/mux v1.8.0"
        "github.com/gorilla/mux v1.8.0/go.mod"
        "github.com/klauspost/compress v1.13.4/go.mod"
        "github.com/klauspost/compress v1.13.5/go.mod"
        "github.com/kr/pretty v0.2.1"
        "github.com/kr/pretty v0.2.1/go.mod"
        "github.com/kr/pty v1.1.1/go.mod"
        "github.com/kr/text v0.1.0"
        "github.com/kr/text v0.1.0/go.mod"
        "github.com/pmezard/go-difflib v1.0.0"
        "github.com/pmezard/go-difflib v1.0.0/go.mod"
        "github.com/stretchr/objx v0.1.0/go.mod"
        "github.com/stretchr/testify v1.7.0"
        "github.com/stretchr/testify v1.7.0/go.mod"
        "github.com/valyala/bytebufferpool v1.0.0"
        "github.com/valyala/bytebufferpool v1.0.0/go.mod"
        "github.com/valyala/fasthttp v1.30.0/go.mod"
        "github.com/valyala/quicktemplate v1.7.0"
        "github.com/valyala/quicktemplate v1.7.0/go.mod"
        "github.com/valyala/tcplisten v1.0.0/go.mod"
        "golang.org/x/crypto v0.0.0-20210513164829-c07d793c2f9a/go.mod"
        "golang.org/x/crypto v0.0.0-20211108221036-ceb1ce70b4fa"
        "golang.org/x/crypto v0.0.0-20211108221036-ceb1ce70b4fa/go.mod"
        "golang.org/x/net v0.0.0-20210226172049-e18ecbb05110/go.mod"
        "golang.org/x/net v0.0.0-20210510120150-4163338589ed/go.mod"
        "golang.org/x/sys v0.0.0-20201119102817-f84b799fce68/go.mod"
        "golang.org/x/sys v0.0.0-20210423082822-04245dca01da/go.mod"
        "golang.org/x/sys v0.0.0-20210514084401-e8d321eab015/go.mod"
        "golang.org/x/sys v0.0.0-20210615035016-665e8c7367d1/go.mod"
        "golang.org/x/sys v0.0.0-20211109184856-51b60fd695b3"
        "golang.org/x/sys v0.0.0-20211109184856-51b60fd695b3/go.mod"
        "golang.org/x/term v0.0.0-20201126162022-7de9c90e9dd1/go.mod"
        "golang.org/x/term v0.0.0-20210927222741-03fcf44c2211"
        "golang.org/x/term v0.0.0-20210927222741-03fcf44c2211/go.mod"
        "golang.org/x/text v0.3.3/go.mod"
        "golang.org/x/text v0.3.6/go.mod"
        "golang.org/x/text v0.3.7"
        "golang.org/x/text v0.3.7/go.mod"
        "golang.org/x/tools v0.0.0-20180917221912-90fa682c2a6e/go.mod"
        "gopkg.in/check.v1 v0.0.0-20161208181325-20d25e280405/go.mod"
        "gopkg.in/yaml.v3 v3.0.0-20200313102051-9f266ea9e77c"
        "gopkg.in/yaml.v3 v3.0.0-20200313102051-9f266ea9e77c/go.mod"
        )
go-module_set_globals

DESCRIPTION="Git-based wiki engine written in Go using mycomarkup"
HOMEPAGE="https://mycorrhiza.wiki"

KEYWORDS="~amd64 ~x86"
SRC_URI="
	https://github.com/bouncepaw/mycorrhiza/archive/v${PV}.tar.gz -> ${P}.tar.gz
	${EGO_SUM_SRC_URI}
"

LICENSE="AGPL-3 MIT Apache-2.0 BSD BSD-2"
SLOT="0"
DOCS=( README.md )

BDEPEND=">=dev-lang/go-1.16.0"

RDEPEND="
	dev-vcs/git
	!!www-apps/mycorrhiza-bin
"

DEPEND="${RDEPEND}"

src_compile() {
	go build -ldflags '-s' . || die
}

src_install() {
	dobin mycorrhiza
}

pkg_postinst() {
	elog "Quick start: /usr/bin/mycorrhiza /your/wiki/directory"
	elog
	elog "It will initialize a Git repository, set useful default settings"
        elog "And run a server on http://localhost:1737"
	elog "More information here: https://mycorrhiza.wiki/"
	elog "Also your wiki has built-in documentation :)"
	elog "You can view this documentation at http://localhost:1737/help"
}
