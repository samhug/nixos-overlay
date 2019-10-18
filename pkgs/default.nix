self: super:

let
  inherit (self) callPackage;
in
{
  co2_logger = callPackage ./co2_logger {};
  coredns = callPackage ./coredns {};
  csvdiff = callPackage ./csvdiff {};
  evcxr_jupyter = callPackage ./evcxr_jupyter {};
  etlcmd = callPackage ./etlcmd {};
  get-keepass-entry = callPackage ./get-keepass-entry {};
  gobgp = callPackage ./gobgp {};
  mosh = callPackage ./mosh { inherit (super) mosh; };
  ndm = callPackage ./ndm {};
  termproxy = callPackage ./termproxy {};
  wy60 = callPackage ./wy60 {};
  zfs-remote-keyloader = callPackage ./zfs-remote-keyloader {};
}
