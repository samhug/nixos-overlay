self: super:

let
  inherit (self) callPackage;
in
{
  coredns = callPackage ./coredns {};
  etlcmd = callPackage ./etlcmd {};
  gobgp = callPackage ./gobgp {};
  ndm = callPackage ./ndm {};
  wy60 = callPackage ./wy60 {};
  zfs-remote-keyloader = callPackage ./zfs-remote-keyloader {};
}
