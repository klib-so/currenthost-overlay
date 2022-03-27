# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Note: This ebuild was adapted from grafana-bin. If you find anything untoward with regards teamcity, this is probably
# why. File a bug at https://github.com/klib-so/currenthost-overlay/issues

EAPI="7"

inherit user # systemd

MY_PN=${PN/-bin/}
S=${WORKDIR}/${MY_PN}-${PV}

DESCRIPTION="Powerful continuous integration for DevOps-centric teams"
HOMEPAGE="https://www.jetbrains.com/teamcity/"
SRC_URI="https://download-cdn.jetbrains.com/teamcity/${PN}-${PV}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"

#QA_EXECSTACK="usr/share/teamcity/vendor/phantomjs/phantomjs"
#QA_PREBUILT="usr/bin/teamcity-*"
#QA_PRESTRIPPED=${QA_EXECSTACK}

pkg_setup() {
	enewgroup teamcity
	enewuser teamcity -1 -1 /usr/share/teamcity teamcity
}

src_install() {
	keepdir /etc/teamcity
	insinto /etc/teamcity
	newins "${S}"/conf/sample.ini teamcity.ini
	rm "${S}"/conf/sample.ini || die

	# Frontend assets
	insinto /usr/share/${MY_PN}
	doins -r public conf

	dobin bin/teamcity-cli
	dobin bin/teamcity-server

	newconfd "${FILESDIR}"/teamcity.confd teamcity
	newinitd "${FILESDIR}"/teamcity.initd.3 teamcity
	#systemd_newunit "${FILESDIR}"/teamcity.service teamcity.service

	keepdir /var/{lib,log}/teamcity
	#keepdir /var/lib/teamcity/{dashboards,plugins}
	fowners teamcity:teamcity /var/{lib,log}/teamcity
	#fowners teamcity:teamcity /var/lib/teamcity/{dashboards,plugins}
	fperms 0750 /var/{lib,log}/teamcity
	#fperms 0750 /var/lib/teamcity/{dashboards,plugins}
}

# postinst() {
# 	elog "${PN} has built-in log rotation. Please see [log.file] section of"
# 	elog "/etc/teamcity/teamcity.ini for related settings."
# 	elog
# 	elog "You may add your own custom configuration for app-admin/logrotate if you"
# 	elog "wish to use external rotation of logs. In this case, you also need to make"
# 	elog "sure the built-in rotation is turned off."
# }
