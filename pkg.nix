{ fetchurl, stdenv, pkgconfig, intltool, libpulseaudio, gtkmm3
, libcanberra-gtk3, gnome3, wrapGAppsHook, autoconf, automake, ... }:

stdenv.mkDerivation rec {
  pname = "pavucontrol";
  version = "4.0";

  src = ./.;

  buildInputs = [ libpulseaudio gtkmm3 libcanberra-gtk3
                  gnome3.adwaita-icon-theme ];

  nativeBuildInputs = [ autoconf automake pkgconfig intltool wrapGAppsHook ];

  configureFlags = [ "--disable-lynx" ];
  preConfigure = "ls -al";

  meta = with stdenv.lib; {
    description = "PulseAudio Volume Control";

    longDescription = ''
      PulseAudio Volume Control (pavucontrol) provides a GTK
      graphical user interface to connect to a PulseAudio server and
      easily control the volume of all clients, sinks, etc.
    '';

    homepage = "http://freedesktop.org/software/pulseaudio/pavucontrol/";

    license = stdenv.lib.licenses.gpl2Plus;

    maintainers = with maintainers; [ abbradar globin ];
    platforms = platforms.linux;
  };
}
