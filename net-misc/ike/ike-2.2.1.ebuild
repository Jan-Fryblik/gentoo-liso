EAPI=2

CMAKE_IN_SOURCE_BUILD="1"
inherit cmake-utils linux-info versionator

MY_PV=$(replace_version_separator 3 '-' ${PV/rc})
MY_PV=$(replace_version_separator 4 '-' ${MY_PV})
MY_P=${PN}-${MY_PV}

DESCRIPTION="Shrew soft VPN Client"
HOMEPAGE="http://www.shrew.net/"
SRC_URI="http://www.shrew.net/download/${PN}/${MY_P}-release.tbz2"

LICENSE="shrew"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="ldap nat"

COMMON_DEPEND="dev-libs/libedit
		dev-libs/openssl
		ldap? ( net-nds/openldap )"
DEPEND="${COMMON_DEPEND}
		dev-util/cmake
		>=sys-devel/bison-2.3
		sys-devel/flex"
RDEPEND="${COMMON_DEPEND}"

DOCS="CONTRIB.TXT README.TXT TODO.TXT"
CONFIG_CHECK="INET_XFRM_MODE_TRANSPORT INET_XFRM_MODE_TUNNEL NET_IPIP INET_ESP INET_IPCOMP INET_AH"

S="${WORKDIR}/${PN}"

src_configure(){
	mycmakeargs+=( $(cmake-utils_use ldap LDAP)
		$(cmake-utils_use nat NATT)
		"-DMANDIR=/usr/share/man")
		
		cmake-utils_src_configure
}

src_install(){
		cmake-utils_src_install
		doinitd ${S}/script/linux/iked || die
}
