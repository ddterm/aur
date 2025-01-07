# Maintainer: Aleksandr Mezin <mezin.alexander@gmail.com>
# Contributor: Amiel Kyamko <junkfactory@gmail.com>
pkgname=gnome-shell-extension-ddterm
pkgver=56
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
  # Fix tests
  "https://github.com/ddterm/gnome-shell-extension-ddterm/commit/31143523ae009dea36ea9dd9e47502af46858629.patch"
)
sha256sums=('0bbb84042d0e00ca3f393929e38cd5b63716cfbb42e400031526ef13c90919f6'
            '21b561df9b32a19ecf93826d814a6cf3f98477cfcb547f67992f29d6dd3d195a')

prepare() {
    cd "${pkgname}-${pkgver}"

    patch -p1 -i ../31143523ae009dea36ea9dd9e47502af46858629.patch
}

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
