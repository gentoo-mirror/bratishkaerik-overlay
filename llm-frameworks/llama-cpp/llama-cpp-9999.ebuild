# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

EGIT_REPO_URI="https://github.com/ggerganov/llama.cpp.git"

inherit cmake flag-o-matic git-r3

DESCRIPTION="Port of Facebook's LLaMA model in C/C++"
HOMEPAGE="https://github.com/ggerganov/llama.cpp"

LICENSE="MIT"
SLOT="$(ver_cut 1-2)"
IUSE="cpu_flags_x86_avx cpu_flags_x86_avx2 cpu_flags_x86_avx512bw cpu_flags_x86_f16c cpu_flags_x86_fma3 +lto mpi"

RDEPEND="
	mpi? (
		virtual/mpi[cxx(+),threads(+)]
	)
"

DEPEND="
	${RDEPEND}
"

#BDEPEND=""

DOCS=(
	docs/BLIS.md
	docs/token_generation_performance_tips.md
	docs/llama-star/

	README.md
)

src_unpack() {
	elog "Starting Git pull..."

	git-r3_src_unpack

	elog "Git repository with sources is located at \"${EGIT_DIR}\", commit \"${EGIT_VERSION}\"."
}

src_configure() {
	# No need, will be detected by "lto" USE-flag and managed by CMake.
	filter-lto

	local mycmakeargs=(
		# General:
		# Installs tests and examples.
		-DLLAMA_STANDALONE=ON

		# Seems to be the most supported option in ecosystem.
		-DBUILD_SHARED_LIBS=OFF

		# Dynamically link to libraries
		-DLLAMA_STATIC=OFF
		# Passes -march=native
		-DLLAMA_NATIVE=ON
		-DLLAMA_LTO="$(usex lto)"

		# Sanitizers:
		-DLLAMA_SANITIZE_THREAD=OFF
		-DLLAMA_SANITIZE_ADDRESS=OFF
		-DLLAMA_SANITIZE_UNDEFINED=OFF

		# X86 instructions:
		-DLLAMA_AVX="$(usex cpu_flags_x86_avx)"
		-DLLAMA_AVX2="$(usex cpu_flags_x86_avx2)"
		# Passes -mavx512f and -mavx512bw
		-DLLAMA_AVX512="$(usex cpu_flags_x86_avx512bw)"
		-DLLAMA_AVX512_VBMI=OFF
		-DLLAMA_AVX512_VNNI=OFF
		# Passes -mfma
		-DLLAMA_FMA="$(usex cpu_flags_x86_fma3)"

		-DLLAMA_F16C="$(usex cpu_flags_x86_f16c)"

		# Libraries:
		# Mac only
		-DLLAMA_ACCELERATE=OFF
		-DLLAMA_METAL=OFF

		-DLLAMA_BLAS=OFF
		-DLLAMA_BLAS_VENDOR="Generic"
		-DLLAMA_CUBLAS=OFF
		-DLLAMA_CUDA_F16=OFF
		-DLLAMA_HIPBLAS=OFF
		-DLLAMA_CLBLAST=OFF
		-DLLAMA_MPI="$(usex mpi)"

		-DCMAKE_INSTALL_PREFIX="${EPREFIX}/usr/$(get_libdir)/llama-cpp/${PV}"
	)

	cmake_src_configure
}

src_install() {
	cmake_src_install

	# Do not compress .key file here.
	docompress -x "/usr/share/doc/${PF}/llama-star/"
}

pkg_postinst() {
	elog "llama.cpp was installed to \"${EPREFIX}/usr/$(get_libdir)/llama-cpp/${PV}/\"."
	elog "README.md and content of \"docs/\" folder were installed to \"/usr/share/doc/${PF}/llama-star/\"."
}
