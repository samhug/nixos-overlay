self: super:

let
  inherit (self) callPackage;
in
{
  ndm = callPackage ./ndm {};
}
