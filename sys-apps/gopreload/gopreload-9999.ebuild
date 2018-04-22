# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6
inherit eutils systemd git-r3

DESCRIPTION="Preloads files needed for given programs. "
HOMEPAGE="https://github.com/kokoko3k/gopreload"
SRC_URI=""

EGIT_REPO_URI="https://github.com/kokoko3k/${PN}.git"
EGIT_BRANCH="master"


SLOT="0"
IUSE=""

DEPEND="dev-util/strace
	x11-misc/wmctrl"
RDEPEND="${DEPEND}"

# Only installs fonts.
RESTRICT="mirror"

src_install(){
	dodir /
	cp -R  "${S}/etc" "${D}/" || die "Install failed!"
	cp -R  "${S}/usr" "${D}/" || die "Install failed!"
	systemd_newunit "${S}/usr/lib/systemd/system/${PN}.service" ${PN}.service
}
