_pkgbase=goodix
pkgname=${_pkgbase}-chuwi-hi12-dkms
pkgver=5.11.16
pkgrel=1
pkgdesc="An in-tree driver for the goodix touchscreen with fixes to use Chuwi Hi12 (DKMS)"
arch=('x86_64')
url="https://www.kernel.org/"
license=('GPL2')
depends=('dkms')
conflicts=("${_pkgbase}")
source=("https://www.kernel.org/pub/linux/kernel/v5.x/linux-${pkgver}.tar.xz"
	'goodix-chuwi-hi12.patch'
	'Makefile'
        'dkms.conf')
sha512sums=('f27f4376a777f6e20ef8355bb3b01379026d2cda751c9f7bd35015cfd16f12f62aa46c4c855c7bf83bec6c90463cac38584a3a346a9ede43826a1d744b2189d0'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
  cd linux-${pkgver}
  # Patch
  patch -p1 -i "${srcdir}"/goodix-chuwi-hi12.patch
}

package() {
  # Copy dkms.conf
  install -Dt "${pkgdir}/usr/src/${_pkgbase}-${pkgver}" -m644 dkms.conf

  # Set name and version
  sed -e "s/@_PKGBASE@/${_pkgbase}/" \
      -e "s/@PKGVER@/${pkgver}/" \
      -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf

  # Copy sources (including Makefile)
  cp "linux-${pkgver}/drivers/input/touchscreen/Kconfig" "${pkgdir}/usr/src/${_pkgbase}-${pkgver}"
  cp "linux-${pkgver}/drivers/input/touchscreen/goodix.c" "${pkgdir}/usr/src/${_pkgbase}-${pkgver}"
  cp "Makefile" "${pkgdir}/usr/src/${_pkgbase}-${pkgver}"
}
