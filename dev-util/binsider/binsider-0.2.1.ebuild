# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Autogenerated by pycargoebuild 0.13.4

EAPI=8

CRATES="
	addr2line@0.24.2
	adler2@2.0.0
	aho-corasick@1.1.3
	allocator-api2@0.2.18
	android-tzdata@0.1.1
	android_system_properties@0.1.5
	ansi-to-tui@6.0.0
	anstream@0.6.15
	anstyle-parse@0.2.5
	anstyle-query@1.1.1
	anstyle-wincon@3.0.4
	anstyle@1.0.8
	anyhow@1.0.89
	arboard@3.4.1
	async-channel@1.9.0
	async-channel@2.3.1
	async-executor@1.13.1
	async-global-executor@2.4.1
	async-io@2.3.4
	async-lock@3.4.0
	async-std@1.13.0
	async-task@4.7.1
	atomic-waker@1.1.2
	autocfg@1.4.0
	backtrace@0.3.74
	better-panic@0.3.0
	bitflags@2.6.0
	block2@0.5.1
	blocking@1.6.1
	bumpalo@3.16.0
	byteorder@1.5.0
	bytes@1.7.2
	bytesize@1.3.0
	cassowary@0.3.0
	castaway@0.2.3
	cc@1.1.28
	cesu8@1.1.0
	cfg-if@1.0.0
	cfg_aliases@0.2.1
	chrono@0.4.38
	clap@4.5.20
	clap_builder@4.5.20
	clap_derive@4.5.18
	clap_lex@0.7.2
	clipboard-win@5.4.0
	colorchoice@1.0.2
	combine@4.6.7
	comfy-table@7.1.1
	compact_str@0.8.0
	concurrent-queue@2.5.0
	console@0.15.8
	core-foundation-sys@0.8.7
	core-foundation@0.10.0
	crossbeam-channel@0.5.13
	crossbeam-deque@0.8.5
	crossbeam-epoch@0.9.18
	crossbeam-queue@0.3.11
	crossbeam-utils@0.8.20
	crossbeam@0.8.4
	crossterm@0.27.0
	crossterm@0.28.1
	crossterm_winapi@0.9.1
	darling@0.20.10
	darling_core@0.20.10
	darling_macro@0.20.10
	derive-getters@0.5.0
	derive_builder@0.20.2
	derive_builder_core@0.20.2
	derive_builder_macro@0.20.2
	derive_setters@0.1.6
	diff@0.1.13
	document-features@0.2.10
	either@1.13.0
	elf@0.7.4
	encode_unicode@0.3.6
	equivalent@1.0.1
	errno@0.3.9
	error-code@3.3.1
	event-listener-strategy@0.5.2
	event-listener@2.5.3
	event-listener@5.3.1
	fastrand@2.1.1
	fnv@1.0.7
	foldhash@0.1.3
	font8x8@0.3.1
	form_urlencoded@1.2.1
	fs-err@2.11.0
	futures-channel@0.3.31
	futures-core@0.3.31
	futures-io@0.3.31
	futures-lite@2.3.0
	gethostname@0.4.3
	gimli@0.31.1
	glob@0.3.1
	gloo-timers@0.3.0
	goblin@0.8.2
	hashbrown@0.15.0
	heck@0.5.0
	heh@0.6.1
	hermit-abi@0.3.9
	hermit-abi@0.4.0
	hex@0.4.3
	home@0.5.9
	iana-time-zone-haiku@0.1.2
	iana-time-zone@0.1.61
	ident_case@1.0.1
	idna@0.5.0
	instability@0.3.2
	is_terminal_polyfill@1.70.1
	itertools@0.13.0
	itoa@1.0.11
	jni-sys@0.3.0
	jni@0.21.1
	js-sys@0.3.71
	kv-log-macro@1.0.7
	lazy_static@1.5.0
	lddtree@0.3.5
	libc@0.2.159
	linux-personality@2.0.0
	linux-raw-sys@0.4.14
	litrs@0.4.1
	lock_api@0.4.12
	log@0.4.22
	lru@0.12.5
	lurk-cli@0.3.9
	memchr@2.7.4
	memmap2@0.9.5
	minimal-lexical@0.2.1
	miniz_oxide@0.8.0
	mio@1.0.2
	ndk-context@0.1.1
	nix@0.29.0
	nom@7.1.3
	num-traits@0.2.19
	objc-sys@0.3.5
	objc2-app-kit@0.2.2
	objc2-core-data@0.2.2
	objc2-core-image@0.2.2
	objc2-encode@4.0.3
	objc2-foundation@0.2.2
	objc2-metal@0.2.2
	objc2-quartz-core@0.2.2
	objc2@0.5.2
	object@0.36.5
	once_cell@1.20.2
	parking@2.2.1
	parking_lot@0.12.3
	parking_lot_core@0.9.10
	paste@1.0.15
	percent-encoding@2.3.1
	pin-project-lite@0.2.14
	pin-utils@0.1.0
	piper@0.2.4
	plain@0.2.3
	polling@3.7.3
	pretty_assertions@1.4.1
	proc-macro2@1.0.87
	quote@1.0.37
	ratatui@0.28.1
	redox_syscall@0.5.7
	regex-automata@0.4.8
	regex-syntax@0.8.5
	regex@1.11.0
	rust-strings@0.6.0
	rustc-demangle@0.1.24
	rustix@0.38.37
	rustversion@1.0.17
	ryu@1.0.18
	same-file@1.0.6
	scopeguard@1.2.0
	scroll@0.12.0
	scroll_derive@0.12.0
	serde@1.0.210
	serde_derive@1.0.210
	serde_json@1.0.128
	serde_repr@0.1.19
	shlex@1.3.0
	signal-hook-mio@0.2.4
	signal-hook-registry@1.4.2
	signal-hook@0.3.17
	simdutf8@0.1.5
	slab@0.4.9
	smallvec@1.13.2
	smawk@0.3.2
	static_assertions@1.1.0
	strsim@0.11.1
	strum@0.26.3
	strum_macros@0.26.4
	syn@2.0.79
	syscalls@0.6.18
	sysinfo@0.32.0
	termbg@0.5.1
	terminal_size@0.4.0
	textwrap@0.16.1
	thiserror-impl@1.0.64
	thiserror@1.0.64
	tinyvec@1.8.0
	tinyvec_macros@0.1.1
	tracing-core@0.1.32
	tracing@0.1.40
	tui-big-text@0.6.0
	tui-input@0.10.1
	tui-popup@0.5.0
	unicode-bidi@0.3.17
	unicode-ident@1.0.13
	unicode-linebreak@0.1.5
	unicode-normalization@0.1.24
	unicode-segmentation@1.12.0
	unicode-truncate@1.1.0
	unicode-width@0.1.14
	unicode-width@0.2.0
	url@2.5.2
	users@0.11.0
	utf8parse@0.2.2
	value-bag@1.9.0
	walkdir@2.5.0
	wasi@0.11.0+wasi-snapshot-preview1
	wasm-bindgen-backend@0.2.94
	wasm-bindgen-futures@0.4.44
	wasm-bindgen-macro-support@0.2.94
	wasm-bindgen-macro@0.2.94
	wasm-bindgen-shared@0.2.94
	wasm-bindgen@0.2.94
	web-sys@0.3.71
	webbrowser@1.0.2
	which@6.0.3
	winapi-i686-pc-windows-gnu@0.4.0
	winapi-util@0.1.9
	winapi-x86_64-pc-windows-gnu@0.4.0
	winapi@0.3.9
	windows-core@0.52.0
	windows-core@0.57.0
	windows-implement@0.57.0
	windows-interface@0.57.0
	windows-result@0.1.2
	windows-sys@0.45.0
	windows-sys@0.52.0
	windows-sys@0.59.0
	windows-targets@0.42.2
	windows-targets@0.48.5
	windows-targets@0.52.6
	windows@0.57.0
	windows_aarch64_gnullvm@0.42.2
	windows_aarch64_gnullvm@0.48.5
	windows_aarch64_gnullvm@0.52.6
	windows_aarch64_msvc@0.42.2
	windows_aarch64_msvc@0.48.5
	windows_aarch64_msvc@0.52.6
	windows_i686_gnu@0.42.2
	windows_i686_gnu@0.48.5
	windows_i686_gnu@0.52.6
	windows_i686_gnullvm@0.52.6
	windows_i686_msvc@0.42.2
	windows_i686_msvc@0.48.5
	windows_i686_msvc@0.52.6
	windows_x86_64_gnu@0.42.2
	windows_x86_64_gnu@0.48.5
	windows_x86_64_gnu@0.52.6
	windows_x86_64_gnullvm@0.42.2
	windows_x86_64_gnullvm@0.48.5
	windows_x86_64_gnullvm@0.52.6
	windows_x86_64_msvc@0.42.2
	windows_x86_64_msvc@0.48.5
	windows_x86_64_msvc@0.52.6
	winsafe@0.0.19
	x11rb-protocol@0.13.1
	x11rb@0.13.1
	yansi@1.0.1
"

inherit cargo

DESCRIPTION="Analyze ELF binaries like a boss"
HOMEPAGE="https://binsider.dev https://github.com/orhun/binsider"
SRC_URI="
	https://github.com/orhun/binsider/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
	${CARGO_CRATE_URIS}
"

LICENSE="|| ( Apache-2.0 MIT )"
# Dependent crate licenses
LICENSE+=" Apache-2.0 BSD-2 Boost-1.0 MIT Unicode-DFS-2016 ZLIB"
SLOT="0"
KEYWORDS="~amd64"
