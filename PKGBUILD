# Maintainer: Aleksandr Mezin <mezin.alexander@gmail.com>
# Contributor: Amiel Kyamko <junkfactory@gmail.com>
pkgname=gnome-shell-extension-ddterm
pkgver=57
pkgrel=1
pkgdesc='Another Drop Down Terminal Extension for GNOME Shell'
arch=('any')
url="https://github.com/ddterm/${pkgname}"
license=('GPL-3.0-or-later')
depends=('gnome-shell>=45' 'gjs' 'gtk3' 'vte3' 'libhandy')
install="${pkgname}.install"
makedepends=('meson' 'git' 'gtk4' 'libxslt' 'xorg-server-xvfb')
checkdepends=('python-pytest' 'python-gobject' 'wl-clipboard')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/ddterm/gnome-shell-extension-ddterm/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=('131557afef69dbd225194c72779a72555a8c28d98bdf3767bd1258a66675088b')

build() {
    arch-meson "${pkgname}-${pkgver}" build -Dlinters=disabled "-Dtests=$( ((CHECKFUNC)) && echo enabled || echo disabled )"

    # gtk-builder-tool needs X or Wayland
    LIBGL_ALWAYS_SOFTWARE=1 xvfb-run -- meson compile -C build
}

check() {
    LIBGL_ALWAYS_SOFTWARE=1 xvfb-run -- meson test -C build --print-errorlogs
}

package() {
    meson install -C build --no-rebuild --destdir "${pkgdir}"
}
