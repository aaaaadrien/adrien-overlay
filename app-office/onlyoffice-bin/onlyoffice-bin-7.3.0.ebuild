# Copyright 2020-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit desktop unpacker xdg

MY_P="ONLYOFFICE-DesktopEditors-"${PV}""

DESCRIPTION="Onlyoffice is an office productivity suite (binary version)"
HOMEPAGE="https://www.onlyoffice.com/"
SRC_URI="
	amd64? (
		https://github.com/ONLYOFFICE/DesktopEditors/releases/download/v"${PV}"/onlyoffice-desktopeditors_amd64.deb -> "${P}"_amd64.deb
	)
"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="amd64"
RESTRICT="mirror strip"

RDEPEND="
	app-accessibility/at-spi2-atk:2
	app-accessibility/at-spi2-core:2
	!app-office/onlyoffice
	dev-libs/atk
	dev-libs/expat
	dev-libs/glib:2
	dev-libs/nspr
	dev-libs/nss
	dev-libs/wayland
	dev-qt/qtgui:5
	dev-qt/qtdeclarative:5
	dev-qt/qtwayland:5
	media-libs/alsa-lib
	media-libs/fontconfig
	media-libs/freetype
	media-libs/gst-plugins-base:1.0
	media-libs/gstreamer:1.0
	media-libs/harfbuzz
	media-libs/libglvnd
	media-libs/libpulse
	net-print/cups
	sys-apps/dbus
	x11-libs/cairo
	x11-libs/gdk-pixbuf:2
	x11-libs/gtk+:3
	x11-libs/libdrm
	x11-libs/libICE
	x11-libs/libSM
	x11-libs/libX11
	x11-libs/libxcb
	x11-libs/libXcomposite
	x11-libs/libXcursor
	x11-libs/libXdamage
	x11-libs/libXext
	x11-libs/libXfixes
	x11-libs/libXi
	x11-libs/libXrandr
	x11-libs/libXrender
	x11-libs/libXScrnSaver
	x11-libs/libXtst
	x11-libs/pango
"

S="${WORKDIR}"

QA_PREBUILT="
	opt/onlyoffice/desktopeditors/DesktopEditors
	opt/onlyoffice/desktopeditors/editors_helper
	opt/onlyoffice/desktopeditors/libascdocumentscore.so
	opt/onlyoffice/desktopeditors/libcef.so
	opt/onlyoffice/desktopeditors/libEGL.so
	opt/onlyoffice/desktopeditors/libGLESv2.so
	opt/onlyoffice/desktopeditors/libhunspell.so
	opt/onlyoffice/desktopeditors/libicudata.so
	opt/onlyoffice/desktopeditors/libicudata.so.52
	opt/onlyoffice/desktopeditors/libicudata.so.52.1
	opt/onlyoffice/desktopeditors/libicui18n.so
	opt/onlyoffice/desktopeditors/libicui18n.so.52
	opt/onlyoffice/desktopeditors/libicui18n.so.52.1
	opt/onlyoffice/desktopeditors/libicuuc.so
	opt/onlyoffice/desktopeditors/libicuuc.so.52
	opt/onlyoffice/desktopeditors/libicuuc.so.52.1
	opt/onlyoffice/desktopeditors/libooxmlsignature.so
	opt/onlyoffice/desktopeditors/libqgsttools_p.so
	opt/onlyoffice/desktopeditors/libqgsttools_p.so.1
	opt/onlyoffice/desktopeditors/libqgsttools_p.so.1.0
	opt/onlyoffice/desktopeditors/libqgsttools_p.so.1.0.0
	opt/onlyoffice/desktopeditors/libQt5Core.so.5
	opt/onlyoffice/desktopeditors/libQt5DBus.so.5
	opt/onlyoffice/desktopeditors/libQt5Gui.so.5
	opt/onlyoffice/desktopeditors/libQt5Multimedia.so.5
	opt/onlyoffice/desktopeditors/libQt5MultimediaWidgets.so.5
	opt/onlyoffice/desktopeditors/libQt5Network.so.5
	opt/onlyoffice/desktopeditors/libQt5OpenGL.so.5
	opt/onlyoffice/desktopeditors/libQt5PrintSupport.so.5
	opt/onlyoffice/desktopeditors/libQt5Svg.so.5
	opt/onlyoffice/desktopeditors/libQt5Widgets.so.5
	opt/onlyoffice/desktopeditors/libQt5X11Extras.so.5
	opt/onlyoffice/desktopeditors/libQt5XcbQpa.so.5
	opt/onlyoffice/desktopeditors/libqtascdocumentscore.so
	opt/onlyoffice/desktopeditors/libvideoplayer.so
	opt/onlyoffice/desktopeditors/bearer/libqconnmanbearer.so
	opt/onlyoffice/desktopeditors/bearer/libqgenericbearer.so
	opt/onlyoffice/desktopeditors/bearer/libqnmbearer.so
	opt/onlyoffice/desktopeditors/converter/libDjVuFile.so
	opt/onlyoffice/desktopeditors/converter/libdoctrenderer.so
	opt/onlyoffice/desktopeditors/converter/libgraphics.so
	opt/onlyoffice/desktopeditors/converter/libHtmlFile.so
	opt/onlyoffice/desktopeditors/converter/libHtmlRenderer.so
	opt/onlyoffice/desktopeditors/converter/libicudata.so.58
	opt/onlyoffice/desktopeditors/converter/libicuuc.so.58
	opt/onlyoffice/desktopeditors/converter/libkernel.so
	opt/onlyoffice/desktopeditors/converter/libPdfReader.so
	opt/onlyoffice/desktopeditors/converter/libPdfWriter.so
	opt/onlyoffice/desktopeditors/converter/libUnicodeConverter.so
	opt/onlyoffice/desktopeditors/converter/libXpsFile.so
	opt/onlyoffice/desktopeditors/converter/x2t
	opt/onlyoffice/desktopeditors/iconengines/libqsvgicon.so
	opt/onlyoffice/desktopeditors/imageformats/libqsvg.so
	opt/onlyoffice/desktopeditors/imageformats/libqico.so
	opt/onlyoffice/desktopeditors/imageformats/libqicns.so
	opt/onlyoffice/desktopeditors/imageformats/libqwbmp.so
	opt/onlyoffice/desktopeditors/imageformats/libqjpeg.so
	opt/onlyoffice/desktopeditors/imageformats/libqtiff.so
	opt/onlyoffice/desktopeditors/imageformats/libqtga.so
	opt/onlyoffice/desktopeditors/imageformats/libqwebp.so
	opt/onlyoffice/desktopeditors/imageformats/libqgif.so
	opt/onlyoffice/desktopeditors/mediaservice/libgstcamerabin.so
	opt/onlyoffice/desktopeditors/mediaservice/libgstaudiodecoder.so
	opt/onlyoffice/desktopeditors/mediaservice/libgstmediacapture.so
	opt/onlyoffice/desktopeditors/mediaservice/libgstmediaplayer.so
	opt/onlyoffice/desktopeditors/platforminputcontexts/libibusplatforminputcontextplugin.so
	opt/onlyoffice/desktopeditors/platforminputcontexts/libqtvirtualkeyboardplugin.so
	opt/onlyoffice/desktopeditors/platforminputcontexts/libcomposeplatforminputcontextplugin.so
	opt/onlyoffice/desktopeditors/platforms/libqoffscreen.so
	opt/onlyoffice/desktopeditors/platforms/libqlinuxfb.so
	opt/onlyoffice/desktopeditors/platforms/libqvnc.so
	opt/onlyoffice/desktopeditors/platforms/libqxcb.so
	opt/onlyoffice/desktopeditors/platforms/libqminimal.so
	opt/onlyoffice/desktopeditors/platformthemes/libqgtk3.so
	opt/onlyoffice/desktopeditors/playlistformats/libqtmultimedia_m3u.so
	opt/onlyoffice/desktopeditors/printsupport/libcupsprintersupport.so
	opt/onlyoffice/desktopeditors/swiftshader/libEGL.so
	opt/onlyoffice/desktopeditors/swiftshader/libGLESv2.so
	opt/onlyoffice/desktopeditors/xcbglintegrations/libqxcb-glx-integration.so
"

src_install() {
	domenu usr/share/applications/onlyoffice-desktopeditors.desktop
	for size in {16,24,32,48,64,128,256}; do
		newicon -s "${size}" opt/onlyoffice/desktopeditors/asc-de-"${size}".png onlyoffice-desktopeditors.png
	done

	dobin usr/bin/desktopeditors usr/bin/onlyoffice-desktopeditors
	doins -r opt
	fperms +x /opt/onlyoffice/desktopeditors/{DesktopEditors,editors_helper,converter/x2t}
}
