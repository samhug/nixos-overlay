self: super:

let
  inherit (self) callPackage;
in
{
  ndm = callPackage ./ndm {};
  zfs-remote-keyloader = callPackage ./zfs-remote-keyloader {};
}
