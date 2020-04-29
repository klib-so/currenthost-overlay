# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils user

DESCRIPTION="Fast and Lightweight Log processor and forwarder"
HOMEPAGE="https://fluentbit.io"
LICENSE="Apache-2.0"

SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="debug +examples +inotify jemalloc luajit server ssl trace valgrind"
SRC_URI="https://github.com/fluent/fluent-bit/archive/v1.2.2.tar.gz"

DOCS=( README.md CONTRIBUTING.md MAINTAINERS.md conf)

DEPEND=""

pkg_setup() {
        enewgroup fluent
        enewuser fluent -1 -1 /usr/share/fluent fluent
}


src_configure() {
	#econf -DFLB_HTTP_SERVER
	cmake-utils_src_configure
}

src_install() {
	keepdir /etc/fluent-bit
	insinto /etc/${PN}
	doins ${FILESDIR}/${PN}.conf
	doins ${WORKDIR}/${PN}-${PVR}/conf/{parsers.conf,plugins.conf}
		einstalldocs
        dobin ${WORKDIR}/${PN}-${PVR}_build/bin/fluent-bit
        newconfd "${FILESDIR}"/${PN}.confd ${PN}
        newinitd "${FILESDIR}"/${PN}.initd ${PN}
#        systemd_newunit "${FILESDIR}"/grafana.service grafana.service
#
	keepdir /var/{lib,log}/${PN}
	fowners fluent:fluent /var/{lib,log}/${PN}
	fperms 0750 /var/{lib,log}/${PN}
}

