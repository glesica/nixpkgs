{ stdenv, fetchurl, autoreconfHook, pkgconfig, gtk3, hicolor-icon-theme }:

stdenv.mkDerivation rec {
  name = "screen-message-${version}";
  version = "0.25";

  src = fetchurl {
    url = "mirror://debian/pool/main/s/screen-message/screen-message_${version}.orig.tar.gz";
    sha256 = "1lw955qq5pq010lzmaf32ylj2iprgsri9ih4hx672c3f794ilab0";
  };

  nativeBuildInputs = [ autoreconfHook pkgconfig ];
  buildInputs = [ gtk3 hicolor-icon-theme ];

  # screen-message installs its binary in $(prefix)/games per default
  makeFlags = [ "execgamesdir=$(out)/bin" ];

  meta = {
    homepage = "https://www.joachim-breitner.de/en/projects#screen-message";
    description = "Displays a short text fullscreen in an X11 window";
    license = stdenv.lib.licenses.gpl2Plus;
    maintainers = [ stdenv.lib.maintainers.fpletz ];
    platforms = stdenv.lib.platforms.unix;
  };
}
