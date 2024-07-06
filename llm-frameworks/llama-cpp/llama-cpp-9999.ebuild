# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

EGIT_REPO_URI="https://github.com/ggerganov/llama.cpp.git"

inherit cmake cuda flag-o-matic git-r3

DESCRIPTION="Port of Facebook's LLaMA model in C/C++"
HOMEPAGE="https://github.com/ggerganov/llama.cpp"

LICENSE="MIT"
SLOT="0"
IUSE="cpu_flags_x86_avx cpu_flags_x86_avx2 cpu_flags_x86_avx512bw cpu_flags_x86_f16c cpu_flags_x86_fma3 cuda cuda-fp16 +lto"

REQUIRED_USE="
	cuda-fp16? ( cuda )
	!cuda? ( !cuda-fp16 )
"

RDEPEND="
	cuda? (
		>=dev-util/nvidia-cuda-toolkit-11.8.0[profiler(+)]
	)
"

DEPEND="${RDEPEND}"

DOCS=(
	"README.md"
	"docs/"
)

src_unpack() {
	elog "Starting Git pull..."

	git-r3_src_unpack

	elog "Git pull completed. Repository with sources is located at \"${EGIT_DIR}\", commit \"${EGIT_VERSION}\"."
}

src_prepare() {
	# No need, will be detected by "lto" USE-flag and managed by CMake.
	filter-lto

	if use cuda; then
		cuda_src_prepare
		cuda_add_sandbox
	fi

	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DLLAMA_CCACHE=OFF
		# Seems to be the most supported option in ecosystem.
		-DBUILD_SHARED_LIBS=OFF

		-DGGML_CUDA="$(usex cuda)"
		-DGGML_CUDA_F16="$(usex cuda-fp16)"
		-DGGML_HIPBLAS=OFF

		# Dynamically link to libraries
		-DGGML_STATIC=OFF

		# Passes -march=native
		-DGGML_NATIVE=ON
		# LTO
		-DGGML_LTO="$(usex lto)"
		# Start of X86 instructions
		-DGGML_AVX="$(usex cpu_flags_x86_avx)"
		-DGGML_AVX2="$(usex cpu_flags_x86_avx2)"
		# Passes -mavx512f and -mavx512bw
		-DGGML_AVX512="$(usex cpu_flags_x86_avx512bw)"
		-DGGML_AVX512_VBMI=OFF
		-DGGML_AVX512_VNNI=OFF
		# Passes -mfma
		-DGGML_FMA="$(usex cpu_flags_x86_fma3)"
		# Passes -mf16c
		-DGGML_F16C="$(usex cpu_flags_x86_f16c)"

		# Mac only
		-DGGML_METAL=OFF
	)

	cmake_src_configure
}

src_install() {
	cmake_src_install

	# Do not compress ".pdf" and ".key" files in this directory.
	docompress -x "/usr/share/doc/${PF}/docs/development/llama-star/"
}

pkg_postinst() {
	elog "README.md and \"docs/\" folder were installed to \"/usr/share/doc/${PF}/\"."

	if use cuda; then
		elog ""
		elog "If you see runtime errors such as this:"
		elog " * the provided PTX was compiled with an unsupported toolchain."
		elog ""
		elog "It means your current nvidia-cuda-toolkit is incompatible with your drivers"
		elog "(in other words, most likey drivers are outdated). In this case,"
		elog "update drivers to versions mentioned in https://docs.nvidia.com/cuda/cuda-toolkit-release-notes/index.html#cuda-toolkit-major-component-versions ."
		elog "See also bug https://bugs.gentoo.org/854345 ."
	fi
}
