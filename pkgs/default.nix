self: super:

let
  inherit (self) callPackage;
in
{
  ndm = callPackage ./ndm {};
  remote-zfs-unlock = callPackage ./remote-zfs-unlock {};
}
