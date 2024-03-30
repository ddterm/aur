# Maintainer: Aleksandr Mezin <mezin.alexander@gmail.com>
# Contributor: Amiel Kyamko <junkfactory@gmail.com>
pkgname=gnome-shell-extension-ddterm
pkgver=54
pkgrel=1
pkgdesc='Another Drop Down Terminal Extension for GNOME Shell'
arch=('any')
url="https://github.com/ddterm/${pkgname}"
license=('GPL-3.0-or-later')
depends=('gnome-shell>=45.0' 'gjs' 'gtk3' 'vte3' 'libhandy')
install="${pkgname}.install"
makedepends=('meson' 'git' 'gtk4' 'libxslt' 'xorg-server-xvfb')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/ddterm/gnome-shell-extension-ddterm/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=('42c9fbee87bf6c856a551370877fbea728d766b4056b22c6786428ede88922f6')

build() {
    arch-meson "${pkgname}-${pkgver}" build

    # gtk-builder-tool needs X or Wayland
    LIBGL_ALWAYS_SOFTWARE=1 xvfb-run -- meson compile -C build
}

package() {
    meson install -C build --destdir "${pkgdir}"
}
