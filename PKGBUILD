pkgname=vim
pkgver=9.1.1723
pkgrel=2
pkgdesc="Vi Improved, a highly configurable, improved version of the vi text editor"
arch=('x86_64')
url="https://www.vim.org/"
license=('vim')
depends=(
    'acl'
    'attr'
    'glibc'
    'gpm'
    'libgcrypt'
    'ncurses'
    'zlib'
)
makedepends=(
    'gawk'
    'libgcrypt'
    'lua'
    'perl'
    'python'
    'ruby'
    'tcl'
)
backup=(etc/vimrc)
source=(https://github.com/vim/vim/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz
    vimrc)
sha256sums=(057b339a2fa78729ff595393333d34a7d25ae77d833f55c2d89b03a2f55203bd
    a4398cf6e8655629ab96b0c5f63cba7cbb5d653e50ea25210510f487426bdd11)

prepare() {
    cd ${pkgname}-${pkgver}

    echo '#define SYS_VIMRC_FILE "/etc/vimrc"' >> src/feature.h
}

build() {
    cd ${pkgname}-${pkgver}

    local configure_args=(
        --with-features=huge
        --with-tlib=ncursesw
        --disable-gui
        --enable-gpm
        --enable-acl
        --enable-luainterp=dynamic
        --enable-perlinterp=dynamic
        --enable-python3interp=dynamic
        --enable-tclinterp=dynamic
        --enable-rubyinterp=dynamic
        --with-compiledby='Flarebird Linux'
        ${configure_options}
    )

    ./configure "${configure_args[@]}"

    make
}

package() {
    cd ${pkgname}-${pkgver}

    make DESTDIR=${pkgdir} install

    ln -sv vim ${pkgdir}/usr/bin/vi
    for L in  ${pkgdir}/usr/share/man/{,*/}man1/vim.1; do
        ln -sv vim.1 $(dirname $L)/vi.1
    done

    install -vdm755 ${pkgdir}/usr/share/doc
    ln -sv ../vim/vim91/doc ${pkgdir}/usr/share/doc/${pkgname}-${pkgver}

    install -vDm644 ${srcdir}/vimrc ${pkgdir}/etc/vimrc

    sed -i "s/mouse=a/mouse-=a/g" ${pkgdir}/usr/share/vim/vim91/defaults.vim

    rm ${pkgdir}/usr/share/applications/gvim.desktop
}
