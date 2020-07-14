# Maintainer: pwfrank
pkgname=st-fpw
_pkgname=st
pkgver=0.8.3
pkgrel=1
pkgdesc='A simple virtual terminal emulator for X.'
arch=('i686' 'x86_64' 'armv7h')
license=('MIT')
depends=('libxft' 'libxext' 'xorg-fonts-misc' 'dmenu' 'xclip')
makedepends=('ncurses')
url="https://github.com/pwfrank/st-build"
source=($_pkgname-$pkgver.tar.gz
st.desktop
st-scrollback-20200419-72e3f6c.diff
st-xresources-20200604-9ba7ecf.diff
st-keyboard_select-0.8.2.diff
st-alpha-0.8.2.diff
st-externalpipe-20181016-3be4cf1.diff
st-alpha-swap-0.8.3.diff
st-blinking-cursor-20180605.diff
st-boxdraw_v2-0.8.3.diff
st-clipboard-0.8.3.diff
st-misc-0.8.2.diff
config.h
)
sha256sums=('939ae3da237e7c9489694853c205c7cbd5f2a2f0c17fe41a07477f1df8e28552'
            '1a5dbc0848b4aaec7773f87bd85ef90ed969a9889eccef2feade9a60aaea9362'
            '1e41fe17a5ef5a8194eea07422b49d815e2c2bb4d58d84771f793be423005310'
            '5045a621db6a73c7d70bbdedd9feae6cd5103c495b0271fd0eb41f864b2f1c6e'
            '3cfb92172c5d5aba75e80035147cc3afa7548d86b9009a62a91b8cc429ad2b4a'
            'd8edf8ad876e10dc0258978248fffc0aeba0adff9c1c9bac7b0f946453beea5d'
            '9c49b29901d19d92251e3d6d2e9075cfc9a98bc50c10c2344ec63ef0c917e61a'
            '108bfe612036a12eed7128452bc17fff91d468e2416a9920ae6434649199bf62'
            'b134dd8d3531c7c152ed0bff2dd269b685a666f1909d34cc928405d6cbe67757'
            '2bca0a20b6a3198eea36bb2c408e504aabf8306ac613110f307e3cff138628f3'
            '0f5ce33953abce74a9da3088ea35bf067a9a4cfeb9fe6ea9800268ce69e436c0'
            '527a9e391cade6c170209ce7666f5c36594d9f617ea65c70d53a1f9c2bd1ca43'
            '55b0c388f972d4ebba9ae4fe49be3673ed515427ab53e2e1c4feeab48b18c417')

provides=('st')
conflicts=('st')

prepare() {
  cd $srcdir/$_pkgname-$pkgver
  sed -i '/tic /d' Makefile
  patch -i $srcdir/st-scrollback-20200419-72e3f6c.diff
  patch -i $srcdir/st-xresources-20200604-9ba7ecf.diff
  patch -i $srcdir/st-keyboard_select-0.8.2.diff
  patch -i $srcdir/st-alpha-0.8.2.diff
  #patch -i $srcdir/st-externalpipe-20181016-3be4cf1.diff
  patch -i $srcdir/st-alpha-swap-0.8.3.diff
  patch -i $srcdir/st-blinking-cursor-20180605.diff
  patch -i $srcdir/st-boxdraw_v2-0.8.3.diff
  patch -i $srcdir/st-clipboard-0.8.3.diff
  patch -i $srcdir/st-misc-0.8.2.diff
  cp $srcdir/config.h $srcdir/$_pkgname-$pkgver/config.h
  cp $srcdir/$_pkgname.desktop $srcdir/$_pkgname-$pkgver/$_pkgname.desktop
}

build() {
  cd $srcdir/$_pkgname-$pkgver
  make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
  cd $srcdir/$_pkgname-$pkgver
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
  install -Dm644 README "$pkgdir/usr/share/doc/$_pkgname/README"
  install -Dm644 $_pkgname.desktop "$pkgdir/usr/share/applications/$_pkgname.desktop"
  # remove to avoid conflict with ncurses
  #rm "${pkgdir}/usr/share/terminfo/s/st" "${pkgdir}/usr/share/terminfo/s/st-256color"
}
