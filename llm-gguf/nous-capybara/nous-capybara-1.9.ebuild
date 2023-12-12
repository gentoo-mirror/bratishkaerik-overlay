# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

# Commit ID on Hugging Face
HF_COMMIT="43aef7505b6aa31b3cf2fa95b7e6c6b4119730cc"

HF_MODEL_FILE_NAME="nous-capybara-3b-v1.9.q2_k.gguf"

DESCRIPTION="Nous Capybara 3B v1.9, GGUF q2_k quantized"
HOMEPAGE="https://huggingface.co/afrideva/Nous-Capybara-3B-V1.9-GGUF"
SRC_URI="https://huggingface.co/afrideva/Nous-Capybara-3B-V1.9-GGUF/resolve/${HF_COMMIT}/${HF_MODEL_FILE_NAME}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="mirror"

src_unpack() {
	mkdir "${S}" || die
	cp "${DISTDIR}/${HF_MODEL_FILE_NAME}" "${S}/${HF_MODEL_FILE_NAME}" || die
}

src_install() {
	insinto /usr/share/large-language-models/gguf/
	doins "nous-capybara-3b-v1.9.q2_k.gguf"
}

pkg_postinst() {
	elog "Model was installed into \"/usr/share/large-language-models/gguf/\" directory."
}
