# Maintainer: Aleksandr Mezin <mezin.alexander@gmail.com>
# Contributor: Amiel Kyamko <junkfactory@gmail.com>
pkgname=gnome-shell-extension-ddterm
pkgver=58
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
sha256sums=('ecc2745cf495174b690887fbd1ee4ed2d83719a6dbc13c21b01ff42346bab69a')

build() {
    arch-meson "${pkgname}-${pkgver}" build -Dlinters=disabled "-Dtests=$( ((CHECKFUNC)) && echo enabled || echo disabled )"

    # gtk-builder-tool needs X or Wayland
    LIBGL_ALWAYS_SOFTWARE=1 xvfb-run --auto-display --server-args=-noreset --wait=0 -- meson compile -C build
}

check() {
    LIBGL_ALWAYS_SOFTWARE=1 xvfb-run --auto-display --server-args=-noreset --wait=0 -- meson test -C build --print-errorlogs
}

package() {
    meson install -C build --no-rebuild --destdir "${pkgdir}"
}
