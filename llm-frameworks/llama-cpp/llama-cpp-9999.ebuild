# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

EGIT_REPO_URI="https://github.com/ggerganov/llama.cpp.git"

inherit cmake flag-o-matic git-r3

DESCRIPTION="Port of Facebook's LLaMA model in C/C++"
HOMEPAGE="https://github.com/ggerganov/llama.cpp"

LICENSE="MIT"
SLOT="0"
IUSE="cpu_flags_x86_avx cpu_flags_x86_avx2 cpu_flags_x86_avx512bw cpu_flags_x86_f16c cpu_flags_x86_fma3 +lto mpi cublas cublas-fp16"

REQUIRED_USE="
	cublas-fp16? ( cublas )
	!cublas? ( !cublas-fp16 )
"

RDEPEND="
	mpi? (
		virtual/mpi[cxx(+),threads(+)]
	)
	cublas? (
		>=dev-util/nvidia-cuda-toolkit-11.8.0
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

	elog "Git pull completed. Repository with sources is located at \"${EGIT_DIR}\", commit \"${EGIT_VERSION}\"."
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

		-DLLAMA_CUBLAS="$(usex cublas)"
		-DLLAMA_CUDA_F16="$(usex cublas-fp16)"
		-DLLAMA_HIPBLAS=OFF
		-DLLAMA_CLBLAST=OFF
		-DLLAMA_MPI="$(usex mpi)"
	)

	cmake_src_configure
}

src_install() {
	cmake_src_install

	# Do not compress .key file in this directory.
	docompress -x "/usr/share/doc/${PF}/llama-star/"
}

pkg_postinst() {
	elog "README.md and content of \"docs/\" folder were installed to \"/usr/share/doc/${PF}/llama-star/\"."

	elog "If you see runtime errors such as this:"
	elog " * the provided PTX was compiled with an unsupported toolchain."
	elog ""
	elog "It means your current nvidia-cuda-toolkit is incompatible with your drivers"
	elog "(in other words, most likey drivers are outdated). In this case,"
	elog "update drivers to versions mentioned in https://docs.nvidia.com/cuda/cuda-toolkit-release-notes/index.html#cuda-toolkit-major-component-versions ."
	elog "See also bug https://bugs.gentoo.org/854345 ."
}
