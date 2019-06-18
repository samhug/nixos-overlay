self: super:

let
  inherit (self) callPackage;
in
{
  co2_logger = callPackage ./co2_logger {};
  coredns = callPackage ./coredns {};
  etlcmd = callPackage ./etlcmd {};
  gobgp = callPackage ./gobgp {};
  ndm = callPackage ./ndm {};
  termproxy = callPackage ./termproxy {};
  wy60 = callPackage ./wy60 {};
  zfs-remote-keyloader = callPackage ./zfs-remote-keyloader {};
}
