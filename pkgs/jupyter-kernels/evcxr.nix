{ stdenv
, lib
, evcxr
, name ? "nixpkgs"
}:
let

  defaultRustKernel = stdenv.mkDerivation {
    name = "evcxr_jupyter-kernel-default";
    phases = "installPhase";

    buildInputs = [ evcxr ];

    installPhase = ''
      HOME=$PWD ${evcxr}/bin/evcxr_jupyter --install
      mkdir -p $out/kernels
      mv ./.local/share/jupyter/kernels/rust $out/kernels/
    '';
  };

  kernelFile = (lib.importJSON "${defaultRustKernel}/kernels/rust/kernel.json") // {
    display_name = "Rust - " + name;
  };

  rustKernel = stdenv.mkDerivation {
    name = "evcxr_jupyter-kernel";
    phases = "installPhase";

    buildInputs = [ defaultRustKernel ];

    installPhase = ''
      mkdir -p $out/kernels/rust_${name}
      cp ${defaultRustKernel}/kernels/rust/logo-* $out/kernels/rust_${name}/
      echo '${builtins.toJSON kernelFile}' > $out/kernels/rust_${name}/kernel.json
    '';
  };
in
{
  spec = rustKernel;
  runtimePackages = [];
}
