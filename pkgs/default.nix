self: super:

let
  inherit (self) callPackage;
in
{
  gobgp = callPackage ./gobgp {};
  ndm = callPackage ./ndm {};
  zfs-remote-keyloader = callPackage ./zfs-remote-keyloader {};
}
