self: super:

let
  inherit (self) callPackage callPackage_i686;
in
{
  co2_logger = callPackage ./co2_logger {};
  csvdiff = callPackage ./csvdiff {};
  etlcmd = callPackage ./etlcmd {};
  evcxrKernelWith = callPackage ./jupyter-kernels/evcxr.nix;
  get-keepass-entry = callPackage ./get-keepass-entry {};
  ndm = callPackage ./ndm {};
  pomerium = callPackage ./pomerium.nix {};
  termproxy = callPackage_i686 ./termproxy {};
  wy60 = callPackage ./wy60 {};
  zfs-remote-keyloader = callPackage ./zfs-remote-keyloader {};
}
