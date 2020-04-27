{ stdenv
, cpio
, rpm
, autoPatchelfHook
}:

stdenv.mkDerivation {
  pname = "termproxy";
  version = "4.0.3";

  src = builtins.fetchurl {
    url = "http://download.wavelink.com/Files/wltn_linux_termproxy_4_0_3.i386.rpm";
    sha256 = "14dzfjfg2laarx4dbxq3w17pndz5lvl8f9cixvi0r8cqq15mg7jn";
  };

  nativeBuildInputs = [
    cpio
    rpm
    autoPatchelfHook
  ];

  # extract the rpm file tree to the local directory
  unpackPhase = ''
    rpm2cpio $src | cpio -idm './opt/wavelink/termproxy/*'
  '';

  doInstallCheck = true;
  installCheckPhase = ''
    $out/bin/termproxy -h &2>/dev/null
  '';

  installPhase = ''
    mkdir -p $out/bin
    install ./opt/wavelink/termproxy/termproxy $out/bin
    rm ./opt/wavelink/termproxy/termproxy
    mv ./opt/wavelink/termproxy/* $out/
  '';

  meta = {
    description = "WaveLink client connection persistence proxy";
    homepage = "http://www.wavelink.com/download-connectpro_session-persistence-software/";
    license = {
      fullName = "WaveLink ConnectPro TermProxy License";
      free = false;
    };
    longDescription = ''The ConnectPro Server allows you to avoid dropped connections and"
      automatically reconnect by acting as an intermediary connection server
      between the client device and the host application server.'';
  };
}
