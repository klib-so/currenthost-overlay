# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{7..9} )

inherit distutils-r1

DESCRIPTION="Model-driven deployment, config management, and command execution framework"
HOMEPAGE="https://www.ansible.com/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="amd64 ~arm arm64 ~ppc64 ~riscv x86 ~x64-macos"
RESTRICT="test"

RDEPEND=">=app-admin/ansible-base-2.11.1
	<app-admin/ansible-base-2.12"

python_compile() {
	local -x ANSIBLE_SKIP_CONFLICT_CHECK=1
	distutils-r1_python_compile
}
python_install() {
	local -x ANSIBLE_SKIP_CONFLICT_CHECK=1
	distutils-r1_python_install
}



Questions or comments?
Please feel free to contact us.

© 2001–2021 Gentoo Foundation, Inc.
Gentoo is a trademark of the Gentoo Foundation, Inc. The contents of this document, unless otherwise expressly stated, are licensed under the CC-BY-SA-4.0 license. The Gentoo Name and Logo Usage Guidelines apply.
