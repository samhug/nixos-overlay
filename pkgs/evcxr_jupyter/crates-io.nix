{ lib, buildRustCrate, buildRustCrateHelpers }:
with buildRustCrateHelpers;
let inherit (lib.lists) fold;
    inherit (lib.attrsets) recursiveUpdate;
in
rec {

# aho-corasick-0.6.10

  crates.aho_corasick."0.6.10" = deps: { features?(features_.aho_corasick."0.6.10" deps {}) }: buildRustCrate {
    crateName = "aho-corasick";
    version = "0.6.10";
    description = "Fast multiple substring searching with finite state machines.";
    authors = [ "Andrew Gallant <jamslam@gmail.com>" ];
    sha256 = "0bhasxfpmfmz1460chwsx59vdld05axvmk1nbp3sd48xav3d108p";
    libName = "aho_corasick";
    crateBin =
      [{  name = "aho-corasick-dot";  path = "src/main.rs"; }];
    dependencies = mapFeatures features ([
      (crates."memchr"."${deps."aho_corasick"."0.6.10"."memchr"}" deps)
    ]);
  };
  features_.aho_corasick."0.6.10" = deps: f: updateFeatures f (rec {
    aho_corasick."0.6.10".default = (f.aho_corasick."0.6.10".default or true);
    memchr."${deps.aho_corasick."0.6.10".memchr}".default = true;
  }) [
    (features_.memchr."${deps."aho_corasick"."0.6.10"."memchr"}" deps)
  ];


# end
# approx-0.1.1

  crates.approx."0.1.1" = deps: { features?(features_.approx."0.1.1" deps {}) }: buildRustCrate {
    crateName = "approx";
    version = "0.1.1";
    description = "Approximate floating point equality comparisons and assertions.";
    authors = [ "Brendan Zabarauskas <bjzaba@yahoo.com.au>" ];
    sha256 = "1wrhjjqhdg9qvw59489iw3cy1dy96v63isbflbkwbrv79ayksa3c";
    features = mkFeatures (features."approx"."0.1.1" or {});
  };
  features_.approx."0.1.1" = deps: f: updateFeatures f (rec {
    approx."0.1.1".default = (f.approx."0.1.1".default or true);
  }) [];


# end
# argon2rs-0.2.5

  crates.argon2rs."0.2.5" = deps: { features?(features_.argon2rs."0.2.5" deps {}) }: buildRustCrate {
    crateName = "argon2rs";
    version = "0.2.5";
    description = "The pure Rust password hashing library that runs on Argon2.";
    authors = [ "bryant <bryant@defrag.in>" ];
    sha256 = "1byl9b3wwyrarn8qack21v5fi2qsnn3y5clvikk2apskhmnih1rw";
    dependencies = mapFeatures features ([
      (crates."blake2_rfc"."${deps."argon2rs"."0.2.5"."blake2_rfc"}" deps)
      (crates."scoped_threadpool"."${deps."argon2rs"."0.2.5"."scoped_threadpool"}" deps)
    ]);
    features = mkFeatures (features."argon2rs"."0.2.5" or {});
  };
  features_.argon2rs."0.2.5" = deps: f: updateFeatures f (rec {
    argon2rs."0.2.5".default = (f.argon2rs."0.2.5".default or true);
    blake2_rfc = fold recursiveUpdate {} [
      { "${deps.argon2rs."0.2.5".blake2_rfc}"."simd_asm" =
        (f.blake2_rfc."${deps.argon2rs."0.2.5".blake2_rfc}"."simd_asm" or false) ||
        (argon2rs."0.2.5"."simd" or false) ||
        (f."argon2rs"."0.2.5"."simd" or false); }
      { "${deps.argon2rs."0.2.5".blake2_rfc}".default = true; }
    ];
    scoped_threadpool."${deps.argon2rs."0.2.5".scoped_threadpool}".default = true;
  }) [
    (features_.blake2_rfc."${deps."argon2rs"."0.2.5"."blake2_rfc"}" deps)
    (features_.scoped_threadpool."${deps."argon2rs"."0.2.5"."scoped_threadpool"}" deps)
  ];


# end
# arrayvec-0.4.10

  crates.arrayvec."0.4.10" = deps: { features?(features_.arrayvec."0.4.10" deps {}) }: buildRustCrate {
    crateName = "arrayvec";
    version = "0.4.10";
    description = "A vector with fixed capacity, backed by an array (it can be stored on the stack too). Implements fixed capacity ArrayVec and ArrayString.";
    authors = [ "bluss" ];
    sha256 = "0qbh825i59w5wfdysqdkiwbwkrsy7lgbd4pwbyb8pxx8wc36iny8";
    dependencies = mapFeatures features ([
      (crates."nodrop"."${deps."arrayvec"."0.4.10"."nodrop"}" deps)
    ]);
    features = mkFeatures (features."arrayvec"."0.4.10" or {});
  };
  features_.arrayvec."0.4.10" = deps: f: updateFeatures f (rec {
    arrayvec = fold recursiveUpdate {} [
      { "0.4.10"."serde" =
        (f.arrayvec."0.4.10"."serde" or false) ||
        (f.arrayvec."0.4.10".serde-1 or false) ||
        (arrayvec."0.4.10"."serde-1" or false); }
      { "0.4.10"."std" =
        (f.arrayvec."0.4.10"."std" or false) ||
        (f.arrayvec."0.4.10".default or false) ||
        (arrayvec."0.4.10"."default" or false); }
      { "0.4.10".default = (f.arrayvec."0.4.10".default or true); }
    ];
    nodrop."${deps.arrayvec."0.4.10".nodrop}".default = (f.nodrop."${deps.arrayvec."0.4.10".nodrop}".default or false);
  }) [
    (features_.nodrop."${deps."arrayvec"."0.4.10"."nodrop"}" deps)
  ];


# end
# autocfg-0.1.4

  crates.autocfg."0.1.4" = deps: { features?(features_.autocfg."0.1.4" deps {}) }: buildRustCrate {
    crateName = "autocfg";
    version = "0.1.4";
    description = "Automatic cfg for Rust compiler features";
    authors = [ "Josh Stone <cuviper@gmail.com>" ];
    sha256 = "1xhpq1h2rqhqx95rc20x3wxi5yhv4a62jr269b8dqyhp8r84ss9i";
  };
  features_.autocfg."0.1.4" = deps: f: updateFeatures f (rec {
    autocfg."0.1.4".default = (f.autocfg."0.1.4".default or true);
  }) [];


# end
# backtrace-0.3.32

  crates.backtrace."0.3.32" = deps: { features?(features_.backtrace."0.3.32" deps {}) }: buildRustCrate {
    crateName = "backtrace";
    version = "0.3.32";
    description = "A library to acquire a stack trace (backtrace) at runtime in a Rust program.\n";
    authors = [ "The Rust Project Developers" ];
    edition = "2018";
    sha256 = "0f20pb4jm5lgv27mv3skbvlq7c2mysk7k4lvgwsgbjmdmclc14bd";
    dependencies = mapFeatures features ([
      (crates."cfg_if"."${deps."backtrace"."0.3.32"."cfg_if"}" deps)
      (crates."libc"."${deps."backtrace"."0.3.32"."libc"}" deps)
      (crates."rustc_demangle"."${deps."backtrace"."0.3.32"."rustc_demangle"}" deps)
    ]
      ++ (if features.backtrace."0.3.32".backtrace-sys or false then [ (crates.backtrace_sys."${deps."backtrace"."0.3.32".backtrace_sys}" deps) ] else []))
      ++ (if kernel == "windows" then mapFeatures features ([
]) else []);
    features = mkFeatures (features."backtrace"."0.3.32" or {});
  };
  features_.backtrace."0.3.32" = deps: f: updateFeatures f (rec {
    backtrace = fold recursiveUpdate {} [
      { "0.3.32"."addr2line" =
        (f.backtrace."0.3.32"."addr2line" or false) ||
        (f.backtrace."0.3.32".gimli-symbolize or false) ||
        (backtrace."0.3.32"."gimli-symbolize" or false); }
      { "0.3.32"."backtrace-sys" =
        (f.backtrace."0.3.32"."backtrace-sys" or false) ||
        (f.backtrace."0.3.32".libbacktrace or false) ||
        (backtrace."0.3.32"."libbacktrace" or false); }
      { "0.3.32"."compiler_builtins" =
        (f.backtrace."0.3.32"."compiler_builtins" or false) ||
        (f.backtrace."0.3.32".rustc-dep-of-std or false) ||
        (backtrace."0.3.32"."rustc-dep-of-std" or false); }
      { "0.3.32"."core" =
        (f.backtrace."0.3.32"."core" or false) ||
        (f.backtrace."0.3.32".rustc-dep-of-std or false) ||
        (backtrace."0.3.32"."rustc-dep-of-std" or false); }
      { "0.3.32"."dbghelp" =
        (f.backtrace."0.3.32"."dbghelp" or false) ||
        (f.backtrace."0.3.32".default or false) ||
        (backtrace."0.3.32"."default" or false); }
      { "0.3.32"."dladdr" =
        (f.backtrace."0.3.32"."dladdr" or false) ||
        (f.backtrace."0.3.32".default or false) ||
        (backtrace."0.3.32"."default" or false); }
      { "0.3.32"."findshlibs" =
        (f.backtrace."0.3.32"."findshlibs" or false) ||
        (f.backtrace."0.3.32".gimli-symbolize or false) ||
        (backtrace."0.3.32"."gimli-symbolize" or false); }
      { "0.3.32"."goblin" =
        (f.backtrace."0.3.32"."goblin" or false) ||
        (f.backtrace."0.3.32".gimli-symbolize or false) ||
        (backtrace."0.3.32"."gimli-symbolize" or false); }
      { "0.3.32"."libbacktrace" =
        (f.backtrace."0.3.32"."libbacktrace" or false) ||
        (f.backtrace."0.3.32".default or false) ||
        (backtrace."0.3.32"."default" or false); }
      { "0.3.32"."libunwind" =
        (f.backtrace."0.3.32"."libunwind" or false) ||
        (f.backtrace."0.3.32".default or false) ||
        (backtrace."0.3.32"."default" or false); }
      { "0.3.32"."memmap" =
        (f.backtrace."0.3.32"."memmap" or false) ||
        (f.backtrace."0.3.32".gimli-symbolize or false) ||
        (backtrace."0.3.32"."gimli-symbolize" or false); }
      { "0.3.32"."rustc-serialize" =
        (f.backtrace."0.3.32"."rustc-serialize" or false) ||
        (f.backtrace."0.3.32".serialize-rustc or false) ||
        (backtrace."0.3.32"."serialize-rustc" or false); }
      { "0.3.32"."serde" =
        (f.backtrace."0.3.32"."serde" or false) ||
        (f.backtrace."0.3.32".serialize-serde or false) ||
        (backtrace."0.3.32"."serialize-serde" or false); }
      { "0.3.32"."std" =
        (f.backtrace."0.3.32"."std" or false) ||
        (f.backtrace."0.3.32".default or false) ||
        (backtrace."0.3.32"."default" or false); }
      { "0.3.32".default = (f.backtrace."0.3.32".default or true); }
    ];
    backtrace_sys = fold recursiveUpdate {} [
      { "${deps.backtrace."0.3.32".backtrace_sys}"."rustc-dep-of-std" =
        (f.backtrace_sys."${deps.backtrace."0.3.32".backtrace_sys}"."rustc-dep-of-std" or false) ||
        (backtrace."0.3.32"."rustc-dep-of-std" or false) ||
        (f."backtrace"."0.3.32"."rustc-dep-of-std" or false); }
      { "${deps.backtrace."0.3.32".backtrace_sys}".default = true; }
    ];
    cfg_if = fold recursiveUpdate {} [
      { "${deps.backtrace."0.3.32".cfg_if}"."rustc-dep-of-std" =
        (f.cfg_if."${deps.backtrace."0.3.32".cfg_if}"."rustc-dep-of-std" or false) ||
        (backtrace."0.3.32"."rustc-dep-of-std" or false) ||
        (f."backtrace"."0.3.32"."rustc-dep-of-std" or false); }
      { "${deps.backtrace."0.3.32".cfg_if}".default = true; }
    ];
    libc = fold recursiveUpdate {} [
      { "${deps.backtrace."0.3.32".libc}"."rustc-dep-of-std" =
        (f.libc."${deps.backtrace."0.3.32".libc}"."rustc-dep-of-std" or false) ||
        (backtrace."0.3.32"."rustc-dep-of-std" or false) ||
        (f."backtrace"."0.3.32"."rustc-dep-of-std" or false); }
      { "${deps.backtrace."0.3.32".libc}".default = (f.libc."${deps.backtrace."0.3.32".libc}".default or false); }
    ];
    rustc_demangle = fold recursiveUpdate {} [
      { "${deps.backtrace."0.3.32".rustc_demangle}"."rustc-dep-of-std" =
        (f.rustc_demangle."${deps.backtrace."0.3.32".rustc_demangle}"."rustc-dep-of-std" or false) ||
        (backtrace."0.3.32"."rustc-dep-of-std" or false) ||
        (f."backtrace"."0.3.32"."rustc-dep-of-std" or false); }
      { "${deps.backtrace."0.3.32".rustc_demangle}".default = true; }
    ];
  }) [
    (features_.backtrace_sys."${deps."backtrace"."0.3.32"."backtrace_sys"}" deps)
    (features_.cfg_if."${deps."backtrace"."0.3.32"."cfg_if"}" deps)
    (features_.libc."${deps."backtrace"."0.3.32"."libc"}" deps)
    (features_.rustc_demangle."${deps."backtrace"."0.3.32"."rustc_demangle"}" deps)
  ];


# end
# backtrace-sys-0.1.30

  crates.backtrace_sys."0.1.30" = deps: { features?(features_.backtrace_sys."0.1.30" deps {}) }: buildRustCrate {
    crateName = "backtrace-sys";
    version = "0.1.30";
    description = "Bindings to the libbacktrace gcc library\n";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "023k63xhlkm15hj2j75sqlsa28qc3f3szs1rdlnz09xzs04f42qn";
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."libc"."${deps."backtrace_sys"."0.1.30"."libc"}" deps)
    ]);

    buildDependencies = mapFeatures features ([
      (crates."cc"."${deps."backtrace_sys"."0.1.30"."cc"}" deps)
    ]);
    features = mkFeatures (features."backtrace_sys"."0.1.30" or {});
  };
  features_.backtrace_sys."0.1.30" = deps: f: updateFeatures f (rec {
    backtrace_sys = fold recursiveUpdate {} [
      { "0.1.30"."compiler_builtins" =
        (f.backtrace_sys."0.1.30"."compiler_builtins" or false) ||
        (f.backtrace_sys."0.1.30".rustc-dep-of-std or false) ||
        (backtrace_sys."0.1.30"."rustc-dep-of-std" or false); }
      { "0.1.30"."core" =
        (f.backtrace_sys."0.1.30"."core" or false) ||
        (f.backtrace_sys."0.1.30".rustc-dep-of-std or false) ||
        (backtrace_sys."0.1.30"."rustc-dep-of-std" or false); }
      { "0.1.30".default = (f.backtrace_sys."0.1.30".default or true); }
    ];
    cc."${deps.backtrace_sys."0.1.30".cc}".default = true;
    libc."${deps.backtrace_sys."0.1.30".libc}".default = (f.libc."${deps.backtrace_sys."0.1.30".libc}".default or false);
  }) [
    (features_.libc."${deps."backtrace_sys"."0.1.30"."libc"}" deps)
    (features_.cc."${deps."backtrace_sys"."0.1.30"."cc"}" deps)
  ];


# end
# base64-0.10.1

  crates.base64."0.10.1" = deps: { features?(features_.base64."0.10.1" deps {}) }: buildRustCrate {
    crateName = "base64";
    version = "0.10.1";
    description = "encodes and decodes base64 as bytes or utf8";
    authors = [ "Alice Maz <alice@alicemaz.com>" "Marshall Pierce <marshall@mpierce.org>" ];
    sha256 = "1zz3jq619hahla1f70ra38818b5n8cp4iilij81i90jq6z7hlfhg";
    dependencies = mapFeatures features ([
      (crates."byteorder"."${deps."base64"."0.10.1"."byteorder"}" deps)
    ]);
  };
  features_.base64."0.10.1" = deps: f: updateFeatures f (rec {
    base64."0.10.1".default = (f.base64."0.10.1".default or true);
    byteorder."${deps.base64."0.10.1".byteorder}".default = true;
  }) [
    (features_.byteorder."${deps."base64"."0.10.1"."byteorder"}" deps)
  ];


# end
# bitflags-1.1.0

  crates.bitflags."1.1.0" = deps: { features?(features_.bitflags."1.1.0" deps {}) }: buildRustCrate {
    crateName = "bitflags";
    version = "1.1.0";
    description = "A macro to generate structures which behave like bitflags.\n";
    authors = [ "The Rust Project Developers" ];
    sha256 = "1iwa4jrqcf4lnbwl562a3lx3r0jkh1j88b219bsqvbm4sni67dyv";
    build = "build.rs";
    features = mkFeatures (features."bitflags"."1.1.0" or {});
  };
  features_.bitflags."1.1.0" = deps: f: updateFeatures f (rec {
    bitflags."1.1.0".default = (f.bitflags."1.1.0".default or true);
  }) [];


# end
# blake2-rfc-0.2.18

  crates.blake2_rfc."0.2.18" = deps: { features?(features_.blake2_rfc."0.2.18" deps {}) }: buildRustCrate {
    crateName = "blake2-rfc";
    version = "0.2.18";
    description = "A pure Rust implementation of BLAKE2 based on RFC 7693.";
    authors = [ "Cesar Eduardo Barros <cesarb@cesarb.eti.br>" ];
    sha256 = "0pyqrik4471ljk16prs0iwb2sam39z0z6axyyjxlqxdmf4wprf0l";
    dependencies = mapFeatures features ([
      (crates."arrayvec"."${deps."blake2_rfc"."0.2.18"."arrayvec"}" deps)
      (crates."constant_time_eq"."${deps."blake2_rfc"."0.2.18"."constant_time_eq"}" deps)
    ]);
    features = mkFeatures (features."blake2_rfc"."0.2.18" or {});
  };
  features_.blake2_rfc."0.2.18" = deps: f: updateFeatures f (rec {
    arrayvec."${deps.blake2_rfc."0.2.18".arrayvec}".default = (f.arrayvec."${deps.blake2_rfc."0.2.18".arrayvec}".default or false);
    blake2_rfc = fold recursiveUpdate {} [
      { "0.2.18"."simd" =
        (f.blake2_rfc."0.2.18"."simd" or false) ||
        (f.blake2_rfc."0.2.18".simd_opt or false) ||
        (blake2_rfc."0.2.18"."simd_opt" or false); }
      { "0.2.18"."simd_opt" =
        (f.blake2_rfc."0.2.18"."simd_opt" or false) ||
        (f.blake2_rfc."0.2.18".simd_asm or false) ||
        (blake2_rfc."0.2.18"."simd_asm" or false); }
      { "0.2.18"."std" =
        (f.blake2_rfc."0.2.18"."std" or false) ||
        (f.blake2_rfc."0.2.18".default or false) ||
        (blake2_rfc."0.2.18"."default" or false); }
      { "0.2.18".default = (f.blake2_rfc."0.2.18".default or true); }
    ];
    constant_time_eq."${deps.blake2_rfc."0.2.18".constant_time_eq}".default = true;
  }) [
    (features_.arrayvec."${deps."blake2_rfc"."0.2.18"."arrayvec"}" deps)
    (features_.constant_time_eq."${deps."blake2_rfc"."0.2.18"."constant_time_eq"}" deps)
  ];


# end
# block-buffer-0.7.3

  crates.block_buffer."0.7.3" = deps: { features?(features_.block_buffer."0.7.3" deps {}) }: buildRustCrate {
    crateName = "block-buffer";
    version = "0.7.3";
    description = "Fixed size buffer for block processing of data";
    authors = [ "RustCrypto Developers" ];
    sha256 = "0kryp6l1ia1f5vxmmzggx0pnc5zqxm6m9m9wvh5y0b3wdcj5xm1v";
    dependencies = mapFeatures features ([
      (crates."block_padding"."${deps."block_buffer"."0.7.3"."block_padding"}" deps)
      (crates."byte_tools"."${deps."block_buffer"."0.7.3"."byte_tools"}" deps)
      (crates."byteorder"."${deps."block_buffer"."0.7.3"."byteorder"}" deps)
      (crates."generic_array"."${deps."block_buffer"."0.7.3"."generic_array"}" deps)
    ]);
  };
  features_.block_buffer."0.7.3" = deps: f: updateFeatures f (rec {
    block_buffer."0.7.3".default = (f.block_buffer."0.7.3".default or true);
    block_padding."${deps.block_buffer."0.7.3".block_padding}".default = true;
    byte_tools."${deps.block_buffer."0.7.3".byte_tools}".default = true;
    byteorder."${deps.block_buffer."0.7.3".byteorder}".default = (f.byteorder."${deps.block_buffer."0.7.3".byteorder}".default or false);
    generic_array."${deps.block_buffer."0.7.3".generic_array}".default = true;
  }) [
    (features_.block_padding."${deps."block_buffer"."0.7.3"."block_padding"}" deps)
    (features_.byte_tools."${deps."block_buffer"."0.7.3"."byte_tools"}" deps)
    (features_.byteorder."${deps."block_buffer"."0.7.3"."byteorder"}" deps)
    (features_.generic_array."${deps."block_buffer"."0.7.3"."generic_array"}" deps)
  ];


# end
# block-padding-0.1.4

  crates.block_padding."0.1.4" = deps: { features?(features_.block_padding."0.1.4" deps {}) }: buildRustCrate {
    crateName = "block-padding";
    version = "0.1.4";
    description = "Padding and unpadding of messages divided into blocks.";
    authors = [ "RustCrypto Developers" ];
    sha256 = "08xvr2spxn614x5scn1wsv8a8daslmj1b3n94n644ygb13gsq8zq";
    dependencies = mapFeatures features ([
      (crates."byte_tools"."${deps."block_padding"."0.1.4"."byte_tools"}" deps)
    ]);
  };
  features_.block_padding."0.1.4" = deps: f: updateFeatures f (rec {
    block_padding."0.1.4".default = (f.block_padding."0.1.4".default or true);
    byte_tools."${deps.block_padding."0.1.4".byte_tools}".default = true;
  }) [
    (features_.byte_tools."${deps."block_padding"."0.1.4"."byte_tools"}" deps)
  ];


# end
# byte-tools-0.3.1

  crates.byte_tools."0.3.1" = deps: { features?(features_.byte_tools."0.3.1" deps {}) }: buildRustCrate {
    crateName = "byte-tools";
    version = "0.3.1";
    description = "Bytes related utility functions";
    authors = [ "RustCrypto Developers" ];
    sha256 = "01hfp59bxq74glhfmhvm9wma2migq2kfmvcvqq5pssk5k52g8ja0";
  };
  features_.byte_tools."0.3.1" = deps: f: updateFeatures f (rec {
    byte_tools."0.3.1".default = (f.byte_tools."0.3.1".default or true);
  }) [];


# end
# byteorder-1.3.2

  crates.byteorder."1.3.2" = deps: { features?(features_.byteorder."1.3.2" deps {}) }: buildRustCrate {
    crateName = "byteorder";
    version = "1.3.2";
    description = "Library for reading/writing numbers in big-endian and little-endian.";
    authors = [ "Andrew Gallant <jamslam@gmail.com>" ];
    sha256 = "099fxwc79ncpcl8dgg9hql8gznz11a3sjs7pai0mg6w8r05khvdx";
    build = "build.rs";
    features = mkFeatures (features."byteorder"."1.3.2" or {});
  };
  features_.byteorder."1.3.2" = deps: f: updateFeatures f (rec {
    byteorder = fold recursiveUpdate {} [
      { "1.3.2"."std" =
        (f.byteorder."1.3.2"."std" or false) ||
        (f.byteorder."1.3.2".default or false) ||
        (byteorder."1.3.2"."default" or false); }
      { "1.3.2".default = (f.byteorder."1.3.2".default or true); }
    ];
  }) [];


# end
# cc-1.0.37

  crates.cc."1.0.37" = deps: { features?(features_.cc."1.0.37" deps {}) }: buildRustCrate {
    crateName = "cc";
    version = "1.0.37";
    description = "A build-time dependency for Cargo build scripts to assist in invoking the native\nC compiler to compile native C code into a static archive to be linked into Rust\ncode.\n";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "1m5s357yi2amgd0kd8chxdcbnscyxwxifmf5hgv92x5xj56b3shj";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."cc"."1.0.37" or {});
  };
  features_.cc."1.0.37" = deps: f: updateFeatures f (rec {
    cc = fold recursiveUpdate {} [
      { "1.0.37"."rayon" =
        (f.cc."1.0.37"."rayon" or false) ||
        (f.cc."1.0.37".parallel or false) ||
        (cc."1.0.37"."parallel" or false); }
      { "1.0.37".default = (f.cc."1.0.37".default or true); }
    ];
  }) [];


# end
# cfg-if-0.1.9

  crates.cfg_if."0.1.9" = deps: { features?(features_.cfg_if."0.1.9" deps {}) }: buildRustCrate {
    crateName = "cfg-if";
    version = "0.1.9";
    description = "A macro to ergonomically define an item depending on a large number of #[cfg]\nparameters. Structured like an if-else chain, the first matching branch is the\nitem that gets emitted.\n";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "13g9p2mc5b2b5wn716fwvilzib376ycpkgk868yxfp16jzix57p7";
  };
  features_.cfg_if."0.1.9" = deps: f: updateFeatures f (rec {
    cfg_if."0.1.9".default = (f.cfg_if."0.1.9".default or true);
  }) [];


# end
# cgmath-0.16.1

  crates.cgmath."0.16.1" = deps: { features?(features_.cgmath."0.16.1" deps {}) }: buildRustCrate {
    crateName = "cgmath";
    version = "0.16.1";
    description = "A linear algebra and mathematics library for computer graphics.";
    authors = [ "Brendan Zabarauskas <bjzaba@yahoo.com.au>" ];
    sha256 = "12xwzi8j3z18f2qlgv9kl83sp12dps9l55qp58id3zg62q4psbnm";
    dependencies = mapFeatures features ([
      (crates."approx"."${deps."cgmath"."0.16.1"."approx"}" deps)
      (crates."num_traits"."${deps."cgmath"."0.16.1"."num_traits"}" deps)
      (crates."rand"."${deps."cgmath"."0.16.1"."rand"}" deps)
    ]);
    features = mkFeatures (features."cgmath"."0.16.1" or {});
  };
  features_.cgmath."0.16.1" = deps: f: updateFeatures f (rec {
    approx."${deps.cgmath."0.16.1".approx}".default = true;
    cgmath."0.16.1".default = (f.cgmath."0.16.1".default or true);
    num_traits."${deps.cgmath."0.16.1".num_traits}".default = true;
    rand."${deps.cgmath."0.16.1".rand}".default = true;
  }) [
    (features_.approx."${deps."cgmath"."0.16.1"."approx"}" deps)
    (features_.num_traits."${deps."cgmath"."0.16.1"."num_traits"}" deps)
    (features_.rand."${deps."cgmath"."0.16.1"."rand"}" deps)
  ];


# end
# chrono-0.4.7

  crates.chrono."0.4.7" = deps: { features?(features_.chrono."0.4.7" deps {}) }: buildRustCrate {
    crateName = "chrono";
    version = "0.4.7";
    description = "Date and time library for Rust";
    authors = [ "Kang Seonghoon <public+rust@mearie.org>" "Brandon W Maister <quodlibetor@gmail.com>" ];
    sha256 = "1f5r3h2vyr8g42fncp0g55qzaq2cxkchd59sjdlda1bl7m4wxnb5";
    dependencies = mapFeatures features ([
      (crates."libc"."${deps."chrono"."0.4.7"."libc"}" deps)
      (crates."num_integer"."${deps."chrono"."0.4.7"."num_integer"}" deps)
      (crates."num_traits"."${deps."chrono"."0.4.7"."num_traits"}" deps)
    ]
      ++ (if features.chrono."0.4.7".time or false then [ (crates.time."${deps."chrono"."0.4.7".time}" deps) ] else []));
    features = mkFeatures (features."chrono"."0.4.7" or {});
  };
  features_.chrono."0.4.7" = deps: f: updateFeatures f (rec {
    chrono = fold recursiveUpdate {} [
      { "0.4.7"."clock" =
        (f.chrono."0.4.7"."clock" or false) ||
        (f.chrono."0.4.7".default or false) ||
        (chrono."0.4.7"."default" or false); }
      { "0.4.7"."time" =
        (f.chrono."0.4.7"."time" or false) ||
        (f.chrono."0.4.7".clock or false) ||
        (chrono."0.4.7"."clock" or false); }
      { "0.4.7".default = (f.chrono."0.4.7".default or true); }
    ];
    libc."${deps.chrono."0.4.7".libc}".default = (f.libc."${deps.chrono."0.4.7".libc}".default or false);
    num_integer."${deps.chrono."0.4.7".num_integer}".default = (f.num_integer."${deps.chrono."0.4.7".num_integer}".default or false);
    num_traits."${deps.chrono."0.4.7".num_traits}".default = (f.num_traits."${deps.chrono."0.4.7".num_traits}".default or false);
    time."${deps.chrono."0.4.7".time}".default = true;
  }) [
    (features_.libc."${deps."chrono"."0.4.7"."libc"}" deps)
    (features_.num_integer."${deps."chrono"."0.4.7"."num_integer"}" deps)
    (features_.num_traits."${deps."chrono"."0.4.7"."num_traits"}" deps)
    (features_.time."${deps."chrono"."0.4.7"."time"}" deps)
  ];


# end
# cloudabi-0.0.3

  crates.cloudabi."0.0.3" = deps: { features?(features_.cloudabi."0.0.3" deps {}) }: buildRustCrate {
    crateName = "cloudabi";
    version = "0.0.3";
    description = "Low level interface to CloudABI. Contains all syscalls and related types.";
    authors = [ "Nuxi (https://nuxi.nl/) and contributors" ];
    sha256 = "1z9lby5sr6vslfd14d6igk03s7awf91mxpsfmsp3prxbxlk0x7h5";
    libPath = "cloudabi.rs";
    dependencies = mapFeatures features ([
    ]
      ++ (if features.cloudabi."0.0.3".bitflags or false then [ (crates.bitflags."${deps."cloudabi"."0.0.3".bitflags}" deps) ] else []));
    features = mkFeatures (features."cloudabi"."0.0.3" or {});
  };
  features_.cloudabi."0.0.3" = deps: f: updateFeatures f (rec {
    bitflags."${deps.cloudabi."0.0.3".bitflags}".default = true;
    cloudabi = fold recursiveUpdate {} [
      { "0.0.3"."bitflags" =
        (f.cloudabi."0.0.3"."bitflags" or false) ||
        (f.cloudabi."0.0.3".default or false) ||
        (cloudabi."0.0.3"."default" or false); }
      { "0.0.3".default = (f.cloudabi."0.0.3".default or true); }
    ];
  }) [
    (features_.bitflags."${deps."cloudabi"."0.0.3"."bitflags"}" deps)
  ];


# end
# colored-1.8.0

  crates.colored."1.8.0" = deps: { features?(features_.colored."1.8.0" deps {}) }: buildRustCrate {
    crateName = "colored";
    version = "1.8.0";
    description = "The most simple way to add colors in your terminal";
    authors = [ "Thomas Wickham <mackwic@gmail.com>" ];
    sha256 = "1gwbq1g26n49wjqacdnr5gc3rfms7zkm8rbw5mc9zcdi6x2wmkya";
    dependencies = mapFeatures features ([
      (crates."lazy_static"."${deps."colored"."1.8.0"."lazy_static"}" deps)
      (crates."winconsole"."${deps."colored"."1.8.0"."winconsole"}" deps)
    ]);
    features = mkFeatures (features."colored"."1.8.0" or {});
  };
  features_.colored."1.8.0" = deps: f: updateFeatures f (rec {
    colored."1.8.0".default = (f.colored."1.8.0".default or true);
    lazy_static."${deps.colored."1.8.0".lazy_static}".default = true;
    winconsole."${deps.colored."1.8.0".winconsole}".default = true;
  }) [
    (features_.lazy_static."${deps."colored"."1.8.0"."lazy_static"}" deps)
    (features_.winconsole."${deps."colored"."1.8.0"."winconsole"}" deps)
  ];


# end
# constant_time_eq-0.1.3

  crates.constant_time_eq."0.1.3" = deps: { features?(features_.constant_time_eq."0.1.3" deps {}) }: buildRustCrate {
    crateName = "constant_time_eq";
    version = "0.1.3";
    description = "Compares two equal-sized byte strings in constant time.";
    authors = [ "Cesar Eduardo Barros <cesarb@cesarb.eti.br>" ];
    sha256 = "03qri9hjf049gwqg9q527lybpg918q6y5q4g9a5lma753nff49wd";
  };
  features_.constant_time_eq."0.1.3" = deps: f: updateFeatures f (rec {
    constant_time_eq."0.1.3".default = (f.constant_time_eq."0.1.3".default or true);
  }) [];


# end
# crypto-mac-0.7.0

  crates.crypto_mac."0.7.0" = deps: { features?(features_.crypto_mac."0.7.0" deps {}) }: buildRustCrate {
    crateName = "crypto-mac";
    version = "0.7.0";
    description = "Trait for Message Authentication Code (MAC) algorithms";
    authors = [ "RustCrypto Developers" ];
    sha256 = "0kdsnk9930cdp5z7m239i9sf0yrsrc9hdhjwkpsd6sfr0i33q0qq";
    dependencies = mapFeatures features ([
      (crates."generic_array"."${deps."crypto_mac"."0.7.0"."generic_array"}" deps)
      (crates."subtle"."${deps."crypto_mac"."0.7.0"."subtle"}" deps)
    ]);
    features = mkFeatures (features."crypto_mac"."0.7.0" or {});
  };
  features_.crypto_mac."0.7.0" = deps: f: updateFeatures f (rec {
    crypto_mac = fold recursiveUpdate {} [
      { "0.7.0"."blobby" =
        (f.crypto_mac."0.7.0"."blobby" or false) ||
        (f.crypto_mac."0.7.0".dev or false) ||
        (crypto_mac."0.7.0"."dev" or false); }
      { "0.7.0".default = (f.crypto_mac."0.7.0".default or true); }
    ];
    generic_array."${deps.crypto_mac."0.7.0".generic_array}".default = true;
    subtle."${deps.crypto_mac."0.7.0".subtle}".default = (f.subtle."${deps.crypto_mac."0.7.0".subtle}".default or false);
  }) [
    (features_.generic_array."${deps."crypto_mac"."0.7.0"."generic_array"}" deps)
    (features_.subtle."${deps."crypto_mac"."0.7.0"."subtle"}" deps)
  ];


# end
# digest-0.8.1

  crates.digest."0.8.1" = deps: { features?(features_.digest."0.8.1" deps {}) }: buildRustCrate {
    crateName = "digest";
    version = "0.8.1";
    description = "Traits for cryptographic hash functions";
    authors = [ "RustCrypto Developers" ];
    sha256 = "18jzwdsfl90bzhbk5ny4rgakhwn3l7pqk2mmqvl4ccb0qy4lhbyr";
    dependencies = mapFeatures features ([
      (crates."generic_array"."${deps."digest"."0.8.1"."generic_array"}" deps)
    ]);
    features = mkFeatures (features."digest"."0.8.1" or {});
  };
  features_.digest."0.8.1" = deps: f: updateFeatures f (rec {
    digest = fold recursiveUpdate {} [
      { "0.8.1"."blobby" =
        (f.digest."0.8.1"."blobby" or false) ||
        (f.digest."0.8.1".dev or false) ||
        (digest."0.8.1"."dev" or false); }
      { "0.8.1".default = (f.digest."0.8.1".default or true); }
    ];
    generic_array."${deps.digest."0.8.1".generic_array}".default = true;
  }) [
    (features_.generic_array."${deps."digest"."0.8.1"."generic_array"}" deps)
  ];


# end
# dirs-1.0.5

  crates.dirs."1.0.5" = deps: { features?(features_.dirs."1.0.5" deps {}) }: buildRustCrate {
    crateName = "dirs";
    version = "1.0.5";
    description = "A tiny low-level library that provides platform-specific standard locations of directories for config, cache and other data on Linux, Windows, macOS and Redox by leveraging the mechanisms defined by the XDG base/user directory specifications on Linux, the Known Folder API on Windows, and the Standard Directory guidelines on macOS.";
    authors = [ "Simon Ochsenreither <simon@ochsenreither.de>" ];
    sha256 = "1py68zwwrhlj5vbz9f9ansjmhc8y4gs5bpamw9ycmqz030pprwf3";
    dependencies = (if kernel == "redox" then mapFeatures features ([
      (crates."redox_users"."${deps."dirs"."1.0.5"."redox_users"}" deps)
    ]) else [])
      ++ (if (kernel == "linux" || kernel == "darwin") then mapFeatures features ([
      (crates."libc"."${deps."dirs"."1.0.5"."libc"}" deps)
    ]) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."dirs"."1.0.5"."winapi"}" deps)
    ]) else []);
  };
  features_.dirs."1.0.5" = deps: f: updateFeatures f (rec {
    dirs."1.0.5".default = (f.dirs."1.0.5".default or true);
    libc."${deps.dirs."1.0.5".libc}".default = true;
    redox_users."${deps.dirs."1.0.5".redox_users}".default = true;
    winapi = fold recursiveUpdate {} [
      { "${deps.dirs."1.0.5".winapi}"."knownfolders" = true; }
      { "${deps.dirs."1.0.5".winapi}"."objbase" = true; }
      { "${deps.dirs."1.0.5".winapi}"."shlobj" = true; }
      { "${deps.dirs."1.0.5".winapi}"."winbase" = true; }
      { "${deps.dirs."1.0.5".winapi}"."winerror" = true; }
      { "${deps.dirs."1.0.5".winapi}".default = true; }
    ];
  }) [
    (features_.redox_users."${deps."dirs"."1.0.5"."redox_users"}" deps)
    (features_.libc."${deps."dirs"."1.0.5"."libc"}" deps)
    (features_.winapi."${deps."dirs"."1.0.5"."winapi"}" deps)
  ];


# end
# dirs-2.0.1

  crates.dirs."2.0.1" = deps: { features?(features_.dirs."2.0.1" deps {}) }: buildRustCrate {
    crateName = "dirs";
    version = "2.0.1";
    description = "A tiny low-level library that provides platform-specific standard locations of directories for config, cache and other data on Linux, Windows, macOS and Redox by leveraging the mechanisms defined by the XDG base/user directory specifications on Linux, the Known Folder API on Windows, and the Standard Directory guidelines on macOS.";
    authors = [ "Simon Ochsenreither <simon@ochsenreither.de>" ];
    sha256 = "04yaclkpmbcpvq3qvhx1add4nhgabpxr3xg0y43nd447gccm3w6d";
    dependencies = mapFeatures features ([
      (crates."cfg_if"."${deps."dirs"."2.0.1"."cfg_if"}" deps)
      (crates."dirs_sys"."${deps."dirs"."2.0.1"."dirs_sys"}" deps)
    ]);
  };
  features_.dirs."2.0.1" = deps: f: updateFeatures f (rec {
    cfg_if."${deps.dirs."2.0.1".cfg_if}".default = true;
    dirs."2.0.1".default = (f.dirs."2.0.1".default or true);
    dirs_sys."${deps.dirs."2.0.1".dirs_sys}".default = true;
  }) [
    (features_.cfg_if."${deps."dirs"."2.0.1"."cfg_if"}" deps)
    (features_.dirs_sys."${deps."dirs"."2.0.1"."dirs_sys"}" deps)
  ];


# end
# dirs-sys-0.3.3

  crates.dirs_sys."0.3.3" = deps: { features?(features_.dirs_sys."0.3.3" deps {}) }: buildRustCrate {
    crateName = "dirs-sys";
    version = "0.3.3";
    description = "System-level helper functions for the dirs and directories crates.";
    authors = [ "Simon Ochsenreither <simon@ochsenreither.de>" ];
    sha256 = "1w5lkqrb16kda398wv4fgcf99disqqm6q7wvv0svb40m47bxfd6h";
    dependencies = mapFeatures features ([
      (crates."cfg_if"."${deps."dirs_sys"."0.3.3"."cfg_if"}" deps)
    ])
      ++ (if kernel == "redox" then mapFeatures features ([
      (crates."redox_users"."${deps."dirs_sys"."0.3.3"."redox_users"}" deps)
    ]) else [])
      ++ (if (kernel == "linux" || kernel == "darwin") then mapFeatures features ([
      (crates."libc"."${deps."dirs_sys"."0.3.3"."libc"}" deps)
    ]) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."dirs_sys"."0.3.3"."winapi"}" deps)
    ]) else []);
  };
  features_.dirs_sys."0.3.3" = deps: f: updateFeatures f (rec {
    cfg_if."${deps.dirs_sys."0.3.3".cfg_if}".default = true;
    dirs_sys."0.3.3".default = (f.dirs_sys."0.3.3".default or true);
    libc."${deps.dirs_sys."0.3.3".libc}".default = true;
    redox_users."${deps.dirs_sys."0.3.3".redox_users}".default = true;
    winapi = fold recursiveUpdate {} [
      { "${deps.dirs_sys."0.3.3".winapi}"."knownfolders" = true; }
      { "${deps.dirs_sys."0.3.3".winapi}"."objbase" = true; }
      { "${deps.dirs_sys."0.3.3".winapi}"."shlobj" = true; }
      { "${deps.dirs_sys."0.3.3".winapi}"."winbase" = true; }
      { "${deps.dirs_sys."0.3.3".winapi}"."winerror" = true; }
      { "${deps.dirs_sys."0.3.3".winapi}".default = true; }
    ];
  }) [
    (features_.cfg_if."${deps."dirs_sys"."0.3.3"."cfg_if"}" deps)
    (features_.redox_users."${deps."dirs_sys"."0.3.3"."redox_users"}" deps)
    (features_.libc."${deps."dirs_sys"."0.3.3"."libc"}" deps)
    (features_.winapi."${deps."dirs_sys"."0.3.3"."winapi"}" deps)
  ];


# end
# error-chain-0.10.0

  crates.error_chain."0.10.0" = deps: { features?(features_.error_chain."0.10.0" deps {}) }: buildRustCrate {
    crateName = "error-chain";
    version = "0.10.0";
    description = "Yet another error boilerplate library.";
    authors = [ "Brian Anderson <banderson@mozilla.com>" "Paul Colomiets <paul@colomiets.name>" "Colin Kiegel <kiegel@gmx.de>" "Yamakaky <yamakaky@yamaworld.fr>" ];
    sha256 = "1xxbzd8cjlpzsb9fsih7mdnndhzrvykj0w77yg90qc85az1xwy5z";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."error_chain"."0.10.0" or {});
  };
  features_.error_chain."0.10.0" = deps: f: updateFeatures f (rec {
    error_chain = fold recursiveUpdate {} [
      { "0.10.0"."backtrace" =
        (f.error_chain."0.10.0"."backtrace" or false) ||
        (f.error_chain."0.10.0".default or false) ||
        (error_chain."0.10.0"."default" or false); }
      { "0.10.0"."example_generated" =
        (f.error_chain."0.10.0"."example_generated" or false) ||
        (f.error_chain."0.10.0".default or false) ||
        (error_chain."0.10.0"."default" or false); }
      { "0.10.0".default = (f.error_chain."0.10.0".default or true); }
    ];
  }) [];


# end
# failure-0.1.5

  crates.failure."0.1.5" = deps: { features?(features_.failure."0.1.5" deps {}) }: buildRustCrate {
    crateName = "failure";
    version = "0.1.5";
    description = "Experimental error handling abstraction.";
    authors = [ "Without Boats <boats@mozilla.com>" ];
    sha256 = "1msaj1c0fg12dzyf4fhxqlx1gfx41lj2smdjmkc9hkrgajk2g3kx";
    dependencies = mapFeatures features ([
    ]
      ++ (if features.failure."0.1.5".backtrace or false then [ (crates.backtrace."${deps."failure"."0.1.5".backtrace}" deps) ] else [])
      ++ (if features.failure."0.1.5".failure_derive or false then [ (crates.failure_derive."${deps."failure"."0.1.5".failure_derive}" deps) ] else []));
    features = mkFeatures (features."failure"."0.1.5" or {});
  };
  features_.failure."0.1.5" = deps: f: updateFeatures f (rec {
    backtrace."${deps.failure."0.1.5".backtrace}".default = true;
    failure = fold recursiveUpdate {} [
      { "0.1.5"."backtrace" =
        (f.failure."0.1.5"."backtrace" or false) ||
        (f.failure."0.1.5".std or false) ||
        (failure."0.1.5"."std" or false); }
      { "0.1.5"."derive" =
        (f.failure."0.1.5"."derive" or false) ||
        (f.failure."0.1.5".default or false) ||
        (failure."0.1.5"."default" or false); }
      { "0.1.5"."failure_derive" =
        (f.failure."0.1.5"."failure_derive" or false) ||
        (f.failure."0.1.5".derive or false) ||
        (failure."0.1.5"."derive" or false); }
      { "0.1.5"."std" =
        (f.failure."0.1.5"."std" or false) ||
        (f.failure."0.1.5".default or false) ||
        (failure."0.1.5"."default" or false); }
      { "0.1.5".default = (f.failure."0.1.5".default or true); }
    ];
    failure_derive."${deps.failure."0.1.5".failure_derive}".default = true;
  }) [
    (features_.backtrace."${deps."failure"."0.1.5"."backtrace"}" deps)
    (features_.failure_derive."${deps."failure"."0.1.5"."failure_derive"}" deps)
  ];


# end
# failure_derive-0.1.5

  crates.failure_derive."0.1.5" = deps: { features?(features_.failure_derive."0.1.5" deps {}) }: buildRustCrate {
    crateName = "failure_derive";
    version = "0.1.5";
    description = "derives for the failure crate";
    authors = [ "Without Boats <woboats@gmail.com>" ];
    sha256 = "1wzk484b87r4qszcvdl2bkniv5ls4r2f2dshz7hmgiv6z4ln12g0";
    procMacro = true;
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."proc_macro2"."${deps."failure_derive"."0.1.5"."proc_macro2"}" deps)
      (crates."quote"."${deps."failure_derive"."0.1.5"."quote"}" deps)
      (crates."syn"."${deps."failure_derive"."0.1.5"."syn"}" deps)
      (crates."synstructure"."${deps."failure_derive"."0.1.5"."synstructure"}" deps)
    ]);
    features = mkFeatures (features."failure_derive"."0.1.5" or {});
  };
  features_.failure_derive."0.1.5" = deps: f: updateFeatures f (rec {
    failure_derive."0.1.5".default = (f.failure_derive."0.1.5".default or true);
    proc_macro2."${deps.failure_derive."0.1.5".proc_macro2}".default = true;
    quote."${deps.failure_derive."0.1.5".quote}".default = true;
    syn."${deps.failure_derive."0.1.5".syn}".default = true;
    synstructure."${deps.failure_derive."0.1.5".synstructure}".default = true;
  }) [
    (features_.proc_macro2."${deps."failure_derive"."0.1.5"."proc_macro2"}" deps)
    (features_.quote."${deps."failure_derive"."0.1.5"."quote"}" deps)
    (features_.syn."${deps."failure_derive"."0.1.5"."syn"}" deps)
    (features_.synstructure."${deps."failure_derive"."0.1.5"."synstructure"}" deps)
  ];


# end
# fake-simd-0.1.2

  crates.fake_simd."0.1.2" = deps: { features?(features_.fake_simd."0.1.2" deps {}) }: buildRustCrate {
    crateName = "fake-simd";
    version = "0.1.2";
    description = "Crate for mimicking simd crate on stable Rust";
    authors = [ "The Rust-Crypto Project Developers" ];
    sha256 = "1a0f1j66nkwfy17s06vm2bn9vh8vy8llcijfhh9m10p58v08661a";
  };
  features_.fake_simd."0.1.2" = deps: f: updateFeatures f (rec {
    fake_simd."0.1.2".default = (f.fake_simd."0.1.2".default or true);
  }) [];


# end
# fuchsia-cprng-0.1.1

  crates.fuchsia_cprng."0.1.1" = deps: { features?(features_.fuchsia_cprng."0.1.1" deps {}) }: buildRustCrate {
    crateName = "fuchsia-cprng";
    version = "0.1.1";
    description = "Rust crate for the Fuchsia cryptographically secure pseudorandom number generator";
    authors = [ "Erick Tryzelaar <etryzelaar@google.com>" ];
    edition = "2018";
    sha256 = "07apwv9dj716yjlcj29p94vkqn5zmfh7hlrqvrjx3wzshphc95h9";
  };
  features_.fuchsia_cprng."0.1.1" = deps: f: updateFeatures f (rec {
    fuchsia_cprng."0.1.1".default = (f.fuchsia_cprng."0.1.1".default or true);
  }) [];


# end
# generic-array-0.12.3

  crates.generic_array."0.12.3" = deps: { features?(features_.generic_array."0.12.3" deps {}) }: buildRustCrate {
    crateName = "generic-array";
    version = "0.12.3";
    description = "Generic types implementing functionality of arrays";
    authors = [ "Bartłomiej Kamiński <fizyk20@gmail.com>" "Aaron Trent <novacrazy@gmail.com>" ];
    sha256 = "1b6bvl1zsh5v9d85szkqfq4sw33xsw03mhchjk3zwxs29psg3nns";
    libName = "generic_array";
    dependencies = mapFeatures features ([
      (crates."typenum"."${deps."generic_array"."0.12.3"."typenum"}" deps)
    ]);
  };
  features_.generic_array."0.12.3" = deps: f: updateFeatures f (rec {
    generic_array."0.12.3".default = (f.generic_array."0.12.3".default or true);
    typenum."${deps.generic_array."0.12.3".typenum}".default = true;
  }) [
    (features_.typenum."${deps."generic_array"."0.12.3"."typenum"}" deps)
  ];


# end
# hex-0.3.2

  crates.hex."0.3.2" = deps: { features?(features_.hex."0.3.2" deps {}) }: buildRustCrate {
    crateName = "hex";
    version = "0.3.2";
    description = "Encoding and decoding data into/from hexadecimal representation.";
    authors = [ "KokaKiwi <kokakiwi@kokakiwi.net>" ];
    sha256 = "0hs0xfb4x67y4ss9mmbjmibkwakbn3xf23i21m409bw2zqk9b6kz";
    features = mkFeatures (features."hex"."0.3.2" or {});
  };
  features_.hex."0.3.2" = deps: f: updateFeatures f (rec {
    hex."0.3.2".default = (f.hex."0.3.2".default or true);
  }) [];


# end
# hmac-0.7.0

  crates.hmac."0.7.0" = deps: { features?(features_.hmac."0.7.0" deps {}) }: buildRustCrate {
    crateName = "hmac";
    version = "0.7.0";
    description = "Generic implementation of Hash-based Message Authentication Code (HMAC)";
    authors = [ "RustCrypto Developers" ];
    sha256 = "0fijqj51n59fc7902kf057499mqkqh2n0hahq0p3f3i2d96qrm50";
    dependencies = mapFeatures features ([
      (crates."crypto_mac"."${deps."hmac"."0.7.0"."crypto_mac"}" deps)
      (crates."digest"."${deps."hmac"."0.7.0"."digest"}" deps)
    ]);
  };
  features_.hmac."0.7.0" = deps: f: updateFeatures f (rec {
    crypto_mac."${deps.hmac."0.7.0".crypto_mac}".default = true;
    digest."${deps.hmac."0.7.0".digest}".default = true;
    hmac."0.7.0".default = (f.hmac."0.7.0".default or true);
  }) [
    (features_.crypto_mac."${deps."hmac"."0.7.0"."crypto_mac"}" deps)
    (features_.digest."${deps."hmac"."0.7.0"."digest"}" deps)
  ];


# end
# json-0.11.13

  crates.json."0.11.13" = deps: { features?(features_.json."0.11.13" deps {}) }: buildRustCrate {
    crateName = "json";
    version = "0.11.13";
    description = "JSON implementation in Rust";
    authors = [ "Maciej Hirsz <maciej.hirsz@gmail.com>" ];
    sha256 = "03227jaj6rjlfigsk4rmc0b83b1djlh42grfjaxk0d2xvgdb893i";
  };
  features_.json."0.11.13" = deps: f: updateFeatures f (rec {
    json."0.11.13".default = (f.json."0.11.13".default or true);
  }) [];


# end
# lazy_static-1.3.0

  crates.lazy_static."1.3.0" = deps: { features?(features_.lazy_static."1.3.0" deps {}) }: buildRustCrate {
    crateName = "lazy_static";
    version = "1.3.0";
    description = "A macro for declaring lazily evaluated statics in Rust.";
    authors = [ "Marvin Löbel <loebel.marvin@gmail.com>" ];
    sha256 = "1vv47va18ydk7dx5paz88g3jy1d3lwbx6qpxkbj8gyfv770i4b1y";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."lazy_static"."1.3.0" or {});
  };
  features_.lazy_static."1.3.0" = deps: f: updateFeatures f (rec {
    lazy_static = fold recursiveUpdate {} [
      { "1.3.0"."spin" =
        (f.lazy_static."1.3.0"."spin" or false) ||
        (f.lazy_static."1.3.0".spin_no_std or false) ||
        (lazy_static."1.3.0"."spin_no_std" or false); }
      { "1.3.0".default = (f.lazy_static."1.3.0".default or true); }
    ];
  }) [];


# end
# libc-0.2.58

  crates.libc."0.2.58" = deps: { features?(features_.libc."0.2.58" deps {}) }: buildRustCrate {
    crateName = "libc";
    version = "0.2.58";
    description = "Raw FFI bindings to platform libraries like libc.\n";
    authors = [ "The Rust Project Developers" ];
    sha256 = "06yk3c0qlcn925ap1rrhikpzgwf504ydkcadj41kib7a06f66k7c";
    build = "build.rs";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."libc"."0.2.58" or {});
  };
  features_.libc."0.2.58" = deps: f: updateFeatures f (rec {
    libc = fold recursiveUpdate {} [
      { "0.2.58"."align" =
        (f.libc."0.2.58"."align" or false) ||
        (f.libc."0.2.58".rustc-dep-of-std or false) ||
        (libc."0.2.58"."rustc-dep-of-std" or false); }
      { "0.2.58"."rustc-std-workspace-core" =
        (f.libc."0.2.58"."rustc-std-workspace-core" or false) ||
        (f.libc."0.2.58".rustc-dep-of-std or false) ||
        (libc."0.2.58"."rustc-dep-of-std" or false); }
      { "0.2.58"."std" =
        (f.libc."0.2.58"."std" or false) ||
        (f.libc."0.2.58".default or false) ||
        (libc."0.2.58"."default" or false) ||
        (f.libc."0.2.58".use_std or false) ||
        (libc."0.2.58"."use_std" or false); }
      { "0.2.58".default = (f.libc."0.2.58".default or true); }
    ];
  }) [];


# end
# libloading-0.5.0

  crates.libloading."0.5.0" = deps: { features?(features_.libloading."0.5.0" deps {}) }: buildRustCrate {
    crateName = "libloading";
    version = "0.5.0";
    description = "A safer binding to platform’s dynamic library loading utilities";
    authors = [ "Simonas Kazlauskas <libloading@kazlauskas.me>" ];
    sha256 = "11vzjaka1y979aril4ggwp33p35yz2isvx9m5w88r5sdcmq6iscn";
    build = "build.rs";
    dependencies = (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."libloading"."0.5.0"."winapi"}" deps)
    ]) else []);

    buildDependencies = mapFeatures features ([
      (crates."cc"."${deps."libloading"."0.5.0"."cc"}" deps)
    ]);
  };
  features_.libloading."0.5.0" = deps: f: updateFeatures f (rec {
    cc."${deps.libloading."0.5.0".cc}".default = true;
    libloading."0.5.0".default = (f.libloading."0.5.0".default or true);
    winapi = fold recursiveUpdate {} [
      { "${deps.libloading."0.5.0".winapi}"."errhandlingapi" = true; }
      { "${deps.libloading."0.5.0".winapi}"."libloaderapi" = true; }
      { "${deps.libloading."0.5.0".winapi}"."winerror" = true; }
      { "${deps.libloading."0.5.0".winapi}".default = true; }
    ];
  }) [
    (features_.cc."${deps."libloading"."0.5.0"."cc"}" deps)
    (features_.winapi."${deps."libloading"."0.5.0"."winapi"}" deps)
  ];


# end
# log-0.4.6

  crates.log."0.4.6" = deps: { features?(features_.log."0.4.6" deps {}) }: buildRustCrate {
    crateName = "log";
    version = "0.4.6";
    description = "A lightweight logging facade for Rust\n";
    authors = [ "The Rust Project Developers" ];
    sha256 = "1nd8dl9mvc9vd6fks5d4gsxaz990xi6rzlb8ymllshmwi153vngr";
    dependencies = mapFeatures features ([
      (crates."cfg_if"."${deps."log"."0.4.6"."cfg_if"}" deps)
    ]);
    features = mkFeatures (features."log"."0.4.6" or {});
  };
  features_.log."0.4.6" = deps: f: updateFeatures f (rec {
    cfg_if."${deps.log."0.4.6".cfg_if}".default = true;
    log."0.4.6".default = (f.log."0.4.6".default or true);
  }) [
    (features_.cfg_if."${deps."log"."0.4.6"."cfg_if"}" deps)
  ];


# end
# memchr-2.2.0

  crates.memchr."2.2.0" = deps: { features?(features_.memchr."2.2.0" deps {}) }: buildRustCrate {
    crateName = "memchr";
    version = "2.2.0";
    description = "Safe interface to memchr.";
    authors = [ "Andrew Gallant <jamslam@gmail.com>" "bluss" ];
    sha256 = "11vwg8iig9jyjxq3n1cq15g29ikzw5l7ar87md54k1aisjs0997p";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."memchr"."2.2.0" or {});
  };
  features_.memchr."2.2.0" = deps: f: updateFeatures f (rec {
    memchr = fold recursiveUpdate {} [
      { "2.2.0"."use_std" =
        (f.memchr."2.2.0"."use_std" or false) ||
        (f.memchr."2.2.0".default or false) ||
        (memchr."2.2.0"."default" or false); }
      { "2.2.0".default = (f.memchr."2.2.0".default or true); }
    ];
  }) [];


# end
# metadeps-1.1.2

  crates.metadeps."1.1.2" = deps: { features?(features_.metadeps."1.1.2" deps {}) }: buildRustCrate {
    crateName = "metadeps";
    version = "1.1.2";
    description = "Run pkg-config from declarative dependencies in Cargo.toml";
    authors = [ "Josh Triplett <josh@joshtriplett.org>" ];
    sha256 = "00dpxjls9fq6fs5gr9v3hkqxmb1zwnhh8b56q3dnzghppjf3ivk3";
    dependencies = mapFeatures features ([
      (crates."error_chain"."${deps."metadeps"."1.1.2"."error_chain"}" deps)
      (crates."pkg_config"."${deps."metadeps"."1.1.2"."pkg_config"}" deps)
      (crates."toml"."${deps."metadeps"."1.1.2"."toml"}" deps)
    ]);
  };
  features_.metadeps."1.1.2" = deps: f: updateFeatures f (rec {
    error_chain."${deps.metadeps."1.1.2".error_chain}".default = (f.error_chain."${deps.metadeps."1.1.2".error_chain}".default or false);
    metadeps."1.1.2".default = (f.metadeps."1.1.2".default or true);
    pkg_config."${deps.metadeps."1.1.2".pkg_config}".default = true;
    toml."${deps.metadeps."1.1.2".toml}".default = (f.toml."${deps.metadeps."1.1.2".toml}".default or false);
  }) [
    (features_.error_chain."${deps."metadeps"."1.1.2"."error_chain"}" deps)
    (features_.pkg_config."${deps."metadeps"."1.1.2"."pkg_config"}" deps)
    (features_.toml."${deps."metadeps"."1.1.2"."toml"}" deps)
  ];


# end
# nix-0.13.1

  crates.nix."0.13.1" = deps: { features?(features_.nix."0.13.1" deps {}) }: buildRustCrate {
    crateName = "nix";
    version = "0.13.1";
    description = "Rust friendly bindings to *nix APIs";
    authors = [ "The nix-rust Project Developers" ];
    sha256 = "16a8bb2lv4fk1xk8l3wgkbax52yg491bq5n282pvx46w0ij88l6k";
    dependencies = mapFeatures features ([
      (crates."bitflags"."${deps."nix"."0.13.1"."bitflags"}" deps)
      (crates."cfg_if"."${deps."nix"."0.13.1"."cfg_if"}" deps)
      (crates."libc"."${deps."nix"."0.13.1"."libc"}" deps)
      (crates."void"."${deps."nix"."0.13.1"."void"}" deps)
    ])
      ++ (if kernel == "dragonfly" then mapFeatures features ([
]) else [])
      ++ (if kernel == "freebsd" then mapFeatures features ([
]) else []);
  };
  features_.nix."0.13.1" = deps: f: updateFeatures f (rec {
    bitflags."${deps.nix."0.13.1".bitflags}".default = true;
    cfg_if."${deps.nix."0.13.1".cfg_if}".default = true;
    libc."${deps.nix."0.13.1".libc}".default = true;
    nix."0.13.1".default = (f.nix."0.13.1".default or true);
    void."${deps.nix."0.13.1".void}".default = true;
  }) [
    (features_.bitflags."${deps."nix"."0.13.1"."bitflags"}" deps)
    (features_.cfg_if."${deps."nix"."0.13.1"."cfg_if"}" deps)
    (features_.libc."${deps."nix"."0.13.1"."libc"}" deps)
    (features_.void."${deps."nix"."0.13.1"."void"}" deps)
  ];


# end
# nodrop-0.1.13

  crates.nodrop."0.1.13" = deps: { features?(features_.nodrop."0.1.13" deps {}) }: buildRustCrate {
    crateName = "nodrop";
    version = "0.1.13";
    description = "A wrapper type to inhibit drop (destructor). Use std::mem::ManuallyDrop instead!";
    authors = [ "bluss" ];
    sha256 = "0gkfx6wihr9z0m8nbdhma5pyvbipznjpkzny2d4zkc05b0vnhinb";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."nodrop"."0.1.13" or {});
  };
  features_.nodrop."0.1.13" = deps: f: updateFeatures f (rec {
    nodrop = fold recursiveUpdate {} [
      { "0.1.13"."nodrop-union" =
        (f.nodrop."0.1.13"."nodrop-union" or false) ||
        (f.nodrop."0.1.13".use_union or false) ||
        (nodrop."0.1.13"."use_union" or false); }
      { "0.1.13"."std" =
        (f.nodrop."0.1.13"."std" or false) ||
        (f.nodrop."0.1.13".default or false) ||
        (nodrop."0.1.13"."default" or false); }
      { "0.1.13".default = (f.nodrop."0.1.13".default or true); }
    ];
  }) [];


# end
# num-integer-0.1.41

  crates.num_integer."0.1.41" = deps: { features?(features_.num_integer."0.1.41" deps {}) }: buildRustCrate {
    crateName = "num-integer";
    version = "0.1.41";
    description = "Integer traits and functions";
    authors = [ "The Rust Project Developers" ];
    sha256 = "1y45nh9xlp2dra9svb1wfsy65fysm3k1w4m8jynywccq645yixid";
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."num_traits"."${deps."num_integer"."0.1.41"."num_traits"}" deps)
    ]);

    buildDependencies = mapFeatures features ([
      (crates."autocfg"."${deps."num_integer"."0.1.41"."autocfg"}" deps)
    ]);
    features = mkFeatures (features."num_integer"."0.1.41" or {});
  };
  features_.num_integer."0.1.41" = deps: f: updateFeatures f (rec {
    autocfg."${deps.num_integer."0.1.41".autocfg}".default = true;
    num_integer = fold recursiveUpdate {} [
      { "0.1.41"."std" =
        (f.num_integer."0.1.41"."std" or false) ||
        (f.num_integer."0.1.41".default or false) ||
        (num_integer."0.1.41"."default" or false); }
      { "0.1.41".default = (f.num_integer."0.1.41".default or true); }
    ];
    num_traits = fold recursiveUpdate {} [
      { "${deps.num_integer."0.1.41".num_traits}"."i128" =
        (f.num_traits."${deps.num_integer."0.1.41".num_traits}"."i128" or false) ||
        (num_integer."0.1.41"."i128" or false) ||
        (f."num_integer"."0.1.41"."i128" or false); }
      { "${deps.num_integer."0.1.41".num_traits}"."std" =
        (f.num_traits."${deps.num_integer."0.1.41".num_traits}"."std" or false) ||
        (num_integer."0.1.41"."std" or false) ||
        (f."num_integer"."0.1.41"."std" or false); }
      { "${deps.num_integer."0.1.41".num_traits}".default = (f.num_traits."${deps.num_integer."0.1.41".num_traits}".default or false); }
    ];
  }) [
    (features_.num_traits."${deps."num_integer"."0.1.41"."num_traits"}" deps)
    (features_.autocfg."${deps."num_integer"."0.1.41"."autocfg"}" deps)
  ];


# end
# num-traits-0.1.43

  crates.num_traits."0.1.43" = deps: { features?(features_.num_traits."0.1.43" deps {}) }: buildRustCrate {
    crateName = "num-traits";
    version = "0.1.43";
    description = "Numeric traits for generic mathematics";
    authors = [ "The Rust Project Developers" ];
    sha256 = "1zdzx78vrcg3f39w94pqjs1mwxl1phyv7843hwgwkzggwcxhhf6s";
    dependencies = mapFeatures features ([
      (crates."num_traits"."${deps."num_traits"."0.1.43"."num_traits"}" deps)
    ]);
  };
  features_.num_traits."0.1.43" = deps: f: updateFeatures f (rec {
    num_traits = fold recursiveUpdate {} [
      { "${deps.num_traits."0.1.43".num_traits}".default = true; }
      { "0.1.43".default = (f.num_traits."0.1.43".default or true); }
    ];
  }) [
    (features_.num_traits."${deps."num_traits"."0.1.43"."num_traits"}" deps)
  ];


# end
# num-traits-0.2.8

  crates.num_traits."0.2.8" = deps: { features?(features_.num_traits."0.2.8" deps {}) }: buildRustCrate {
    crateName = "num-traits";
    version = "0.2.8";
    description = "Numeric traits for generic mathematics";
    authors = [ "The Rust Project Developers" ];
    sha256 = "1mnlmy35n734n9xlq0qkfbgzz33x09a1s4rfj30p1976p09b862v";
    build = "build.rs";

    buildDependencies = mapFeatures features ([
      (crates."autocfg"."${deps."num_traits"."0.2.8"."autocfg"}" deps)
    ]);
    features = mkFeatures (features."num_traits"."0.2.8" or {});
  };
  features_.num_traits."0.2.8" = deps: f: updateFeatures f (rec {
    autocfg."${deps.num_traits."0.2.8".autocfg}".default = true;
    num_traits = fold recursiveUpdate {} [
      { "0.2.8"."std" =
        (f.num_traits."0.2.8"."std" or false) ||
        (f.num_traits."0.2.8".default or false) ||
        (num_traits."0.2.8"."default" or false); }
      { "0.2.8".default = (f.num_traits."0.2.8".default or true); }
    ];
  }) [
    (features_.autocfg."${deps."num_traits"."0.2.8"."autocfg"}" deps)
  ];


# end
# opaque-debug-0.2.2

  crates.opaque_debug."0.2.2" = deps: { features?(features_.opaque_debug."0.2.2" deps {}) }: buildRustCrate {
    crateName = "opaque-debug";
    version = "0.2.2";
    description = "Macro for opaque Debug trait implementation";
    authors = [ "RustCrypto Developers" ];
    sha256 = "0dkzsnxpg50gz3gjcdzc4j6g4s0jphllg6q7jqmsy9nd9glidy74";
  };
  features_.opaque_debug."0.2.2" = deps: f: updateFeatures f (rec {
    opaque_debug."0.2.2".default = (f.opaque_debug."0.2.2".default or true);
  }) [];


# end
# pkg-config-0.3.14

  crates.pkg_config."0.3.14" = deps: { features?(features_.pkg_config."0.3.14" deps {}) }: buildRustCrate {
    crateName = "pkg-config";
    version = "0.3.14";
    description = "A library to run the pkg-config system tool at build time in order to be used in\nCargo build scripts.\n";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "0207fsarrm412j0dh87lfcas72n8mxar7q3mgflsbsrqnb140sv6";
  };
  features_.pkg_config."0.3.14" = deps: f: updateFeatures f (rec {
    pkg_config."0.3.14".default = (f.pkg_config."0.3.14".default or true);
  }) [];


# end
# proc-macro2-0.4.27

  crates.proc_macro2."0.4.27" = deps: { features?(features_.proc_macro2."0.4.27" deps {}) }: buildRustCrate {
    crateName = "proc-macro2";
    version = "0.4.27";
    description = "A stable implementation of the upcoming new `proc_macro` API. Comes with an\noption, off by default, to also reimplement itself in terms of the upstream\nunstable API.\n";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "1cp4c40p3hwn2sz72ssqa62gp5n8w4gbamdqvvadzp5l7gxnq95i";
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."unicode_xid"."${deps."proc_macro2"."0.4.27"."unicode_xid"}" deps)
    ]);
    features = mkFeatures (features."proc_macro2"."0.4.27" or {});
  };
  features_.proc_macro2."0.4.27" = deps: f: updateFeatures f (rec {
    proc_macro2 = fold recursiveUpdate {} [
      { "0.4.27"."proc-macro" =
        (f.proc_macro2."0.4.27"."proc-macro" or false) ||
        (f.proc_macro2."0.4.27".default or false) ||
        (proc_macro2."0.4.27"."default" or false); }
      { "0.4.27".default = (f.proc_macro2."0.4.27".default or true); }
    ];
    unicode_xid."${deps.proc_macro2."0.4.27".unicode_xid}".default = true;
  }) [
    (features_.unicode_xid."${deps."proc_macro2"."0.4.27"."unicode_xid"}" deps)
  ];


# end
# quote-0.6.12

  crates.quote."0.6.12" = deps: { features?(features_.quote."0.6.12" deps {}) }: buildRustCrate {
    crateName = "quote";
    version = "0.6.12";
    description = "Quasi-quoting macro quote!(...)";
    authors = [ "David Tolnay <dtolnay@gmail.com>" ];
    sha256 = "1ckd2d2sy0hrwrqcr47dn0n3hyh7ygpc026l8xaycccyg27mihv9";
    dependencies = mapFeatures features ([
      (crates."proc_macro2"."${deps."quote"."0.6.12"."proc_macro2"}" deps)
    ]);
    features = mkFeatures (features."quote"."0.6.12" or {});
  };
  features_.quote."0.6.12" = deps: f: updateFeatures f (rec {
    proc_macro2 = fold recursiveUpdate {} [
      { "${deps.quote."0.6.12".proc_macro2}"."proc-macro" =
        (f.proc_macro2."${deps.quote."0.6.12".proc_macro2}"."proc-macro" or false) ||
        (quote."0.6.12"."proc-macro" or false) ||
        (f."quote"."0.6.12"."proc-macro" or false); }
      { "${deps.quote."0.6.12".proc_macro2}".default = (f.proc_macro2."${deps.quote."0.6.12".proc_macro2}".default or false); }
    ];
    quote = fold recursiveUpdate {} [
      { "0.6.12"."proc-macro" =
        (f.quote."0.6.12"."proc-macro" or false) ||
        (f.quote."0.6.12".default or false) ||
        (quote."0.6.12"."default" or false); }
      { "0.6.12".default = (f.quote."0.6.12".default or true); }
    ];
  }) [
    (features_.proc_macro2."${deps."quote"."0.6.12"."proc_macro2"}" deps)
  ];


# end
# rand-0.4.6

  crates.rand."0.4.6" = deps: { features?(features_.rand."0.4.6" deps {}) }: buildRustCrate {
    crateName = "rand";
    version = "0.4.6";
    description = "Random number generators and other randomness functionality.\n";
    authors = [ "The Rust Project Developers" ];
    sha256 = "0c3rmg5q7d6qdi7cbmg5py9alm70wd3xsg0mmcawrnl35qv37zfs";
    dependencies = (if abi == "sgx" then mapFeatures features ([
      (crates."rand_core"."${deps."rand"."0.4.6"."rand_core"}" deps)
      (crates."rdrand"."${deps."rand"."0.4.6"."rdrand"}" deps)
    ]) else [])
      ++ (if kernel == "fuchsia" then mapFeatures features ([
      (crates."fuchsia_cprng"."${deps."rand"."0.4.6"."fuchsia_cprng"}" deps)
    ]) else [])
      ++ (if (kernel == "linux" || kernel == "darwin") then mapFeatures features ([
    ]
      ++ (if features.rand."0.4.6".libc or false then [ (crates.libc."${deps."rand"."0.4.6".libc}" deps) ] else [])) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."rand"."0.4.6"."winapi"}" deps)
    ]) else []);
    features = mkFeatures (features."rand"."0.4.6" or {});
  };
  features_.rand."0.4.6" = deps: f: updateFeatures f (rec {
    fuchsia_cprng."${deps.rand."0.4.6".fuchsia_cprng}".default = true;
    libc."${deps.rand."0.4.6".libc}".default = true;
    rand = fold recursiveUpdate {} [
      { "0.4.6"."i128_support" =
        (f.rand."0.4.6"."i128_support" or false) ||
        (f.rand."0.4.6".nightly or false) ||
        (rand."0.4.6"."nightly" or false); }
      { "0.4.6"."libc" =
        (f.rand."0.4.6"."libc" or false) ||
        (f.rand."0.4.6".std or false) ||
        (rand."0.4.6"."std" or false); }
      { "0.4.6"."std" =
        (f.rand."0.4.6"."std" or false) ||
        (f.rand."0.4.6".default or false) ||
        (rand."0.4.6"."default" or false); }
      { "0.4.6".default = (f.rand."0.4.6".default or true); }
    ];
    rand_core."${deps.rand."0.4.6".rand_core}".default = (f.rand_core."${deps.rand."0.4.6".rand_core}".default or false);
    rdrand."${deps.rand."0.4.6".rdrand}".default = true;
    winapi = fold recursiveUpdate {} [
      { "${deps.rand."0.4.6".winapi}"."minwindef" = true; }
      { "${deps.rand."0.4.6".winapi}"."ntsecapi" = true; }
      { "${deps.rand."0.4.6".winapi}"."profileapi" = true; }
      { "${deps.rand."0.4.6".winapi}"."winnt" = true; }
      { "${deps.rand."0.4.6".winapi}".default = true; }
    ];
  }) [
    (features_.rand_core."${deps."rand"."0.4.6"."rand_core"}" deps)
    (features_.rdrand."${deps."rand"."0.4.6"."rdrand"}" deps)
    (features_.fuchsia_cprng."${deps."rand"."0.4.6"."fuchsia_cprng"}" deps)
    (features_.libc."${deps."rand"."0.4.6"."libc"}" deps)
    (features_.winapi."${deps."rand"."0.4.6"."winapi"}" deps)
  ];


# end
# rand-0.6.5

  crates.rand."0.6.5" = deps: { features?(features_.rand."0.6.5" deps {}) }: buildRustCrate {
    crateName = "rand";
    version = "0.6.5";
    description = "Random number generators and other randomness functionality.\n";
    authors = [ "The Rand Project Developers" "The Rust Project Developers" ];
    sha256 = "0zbck48159aj8zrwzf80sd9xxh96w4f4968nshwjpysjvflimvgb";
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."rand_chacha"."${deps."rand"."0.6.5"."rand_chacha"}" deps)
      (crates."rand_core"."${deps."rand"."0.6.5"."rand_core"}" deps)
      (crates."rand_hc"."${deps."rand"."0.6.5"."rand_hc"}" deps)
      (crates."rand_isaac"."${deps."rand"."0.6.5"."rand_isaac"}" deps)
      (crates."rand_jitter"."${deps."rand"."0.6.5"."rand_jitter"}" deps)
      (crates."rand_pcg"."${deps."rand"."0.6.5"."rand_pcg"}" deps)
      (crates."rand_xorshift"."${deps."rand"."0.6.5"."rand_xorshift"}" deps)
    ]
      ++ (if features.rand."0.6.5".rand_os or false then [ (crates.rand_os."${deps."rand"."0.6.5".rand_os}" deps) ] else []))
      ++ (if (kernel == "linux" || kernel == "darwin") then mapFeatures features ([
      (crates."libc"."${deps."rand"."0.6.5"."libc"}" deps)
    ]) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."rand"."0.6.5"."winapi"}" deps)
    ]) else []);

    buildDependencies = mapFeatures features ([
      (crates."autocfg"."${deps."rand"."0.6.5"."autocfg"}" deps)
    ]);
    features = mkFeatures (features."rand"."0.6.5" or {});
  };
  features_.rand."0.6.5" = deps: f: updateFeatures f (rec {
    autocfg."${deps.rand."0.6.5".autocfg}".default = true;
    libc."${deps.rand."0.6.5".libc}".default = (f.libc."${deps.rand."0.6.5".libc}".default or false);
    rand = fold recursiveUpdate {} [
      { "0.6.5"."alloc" =
        (f.rand."0.6.5"."alloc" or false) ||
        (f.rand."0.6.5".std or false) ||
        (rand."0.6.5"."std" or false); }
      { "0.6.5"."packed_simd" =
        (f.rand."0.6.5"."packed_simd" or false) ||
        (f.rand."0.6.5".simd_support or false) ||
        (rand."0.6.5"."simd_support" or false); }
      { "0.6.5"."rand_os" =
        (f.rand."0.6.5"."rand_os" or false) ||
        (f.rand."0.6.5".std or false) ||
        (rand."0.6.5"."std" or false); }
      { "0.6.5"."simd_support" =
        (f.rand."0.6.5"."simd_support" or false) ||
        (f.rand."0.6.5".nightly or false) ||
        (rand."0.6.5"."nightly" or false); }
      { "0.6.5"."std" =
        (f.rand."0.6.5"."std" or false) ||
        (f.rand."0.6.5".default or false) ||
        (rand."0.6.5"."default" or false); }
      { "0.6.5".default = (f.rand."0.6.5".default or true); }
    ];
    rand_chacha."${deps.rand."0.6.5".rand_chacha}".default = true;
    rand_core = fold recursiveUpdate {} [
      { "${deps.rand."0.6.5".rand_core}"."alloc" =
        (f.rand_core."${deps.rand."0.6.5".rand_core}"."alloc" or false) ||
        (rand."0.6.5"."alloc" or false) ||
        (f."rand"."0.6.5"."alloc" or false); }
      { "${deps.rand."0.6.5".rand_core}"."serde1" =
        (f.rand_core."${deps.rand."0.6.5".rand_core}"."serde1" or false) ||
        (rand."0.6.5"."serde1" or false) ||
        (f."rand"."0.6.5"."serde1" or false); }
      { "${deps.rand."0.6.5".rand_core}"."std" =
        (f.rand_core."${deps.rand."0.6.5".rand_core}"."std" or false) ||
        (rand."0.6.5"."std" or false) ||
        (f."rand"."0.6.5"."std" or false); }
      { "${deps.rand."0.6.5".rand_core}".default = true; }
    ];
    rand_hc."${deps.rand."0.6.5".rand_hc}".default = true;
    rand_isaac = fold recursiveUpdate {} [
      { "${deps.rand."0.6.5".rand_isaac}"."serde1" =
        (f.rand_isaac."${deps.rand."0.6.5".rand_isaac}"."serde1" or false) ||
        (rand."0.6.5"."serde1" or false) ||
        (f."rand"."0.6.5"."serde1" or false); }
      { "${deps.rand."0.6.5".rand_isaac}".default = true; }
    ];
    rand_jitter = fold recursiveUpdate {} [
      { "${deps.rand."0.6.5".rand_jitter}"."std" =
        (f.rand_jitter."${deps.rand."0.6.5".rand_jitter}"."std" or false) ||
        (rand."0.6.5"."std" or false) ||
        (f."rand"."0.6.5"."std" or false); }
      { "${deps.rand."0.6.5".rand_jitter}".default = true; }
    ];
    rand_os = fold recursiveUpdate {} [
      { "${deps.rand."0.6.5".rand_os}"."stdweb" =
        (f.rand_os."${deps.rand."0.6.5".rand_os}"."stdweb" or false) ||
        (rand."0.6.5"."stdweb" or false) ||
        (f."rand"."0.6.5"."stdweb" or false); }
      { "${deps.rand."0.6.5".rand_os}"."wasm-bindgen" =
        (f.rand_os."${deps.rand."0.6.5".rand_os}"."wasm-bindgen" or false) ||
        (rand."0.6.5"."wasm-bindgen" or false) ||
        (f."rand"."0.6.5"."wasm-bindgen" or false); }
      { "${deps.rand."0.6.5".rand_os}".default = true; }
    ];
    rand_pcg."${deps.rand."0.6.5".rand_pcg}".default = true;
    rand_xorshift = fold recursiveUpdate {} [
      { "${deps.rand."0.6.5".rand_xorshift}"."serde1" =
        (f.rand_xorshift."${deps.rand."0.6.5".rand_xorshift}"."serde1" or false) ||
        (rand."0.6.5"."serde1" or false) ||
        (f."rand"."0.6.5"."serde1" or false); }
      { "${deps.rand."0.6.5".rand_xorshift}".default = true; }
    ];
    winapi = fold recursiveUpdate {} [
      { "${deps.rand."0.6.5".winapi}"."minwindef" = true; }
      { "${deps.rand."0.6.5".winapi}"."ntsecapi" = true; }
      { "${deps.rand."0.6.5".winapi}"."profileapi" = true; }
      { "${deps.rand."0.6.5".winapi}"."winnt" = true; }
      { "${deps.rand."0.6.5".winapi}".default = true; }
    ];
  }) [
    (features_.rand_chacha."${deps."rand"."0.6.5"."rand_chacha"}" deps)
    (features_.rand_core."${deps."rand"."0.6.5"."rand_core"}" deps)
    (features_.rand_hc."${deps."rand"."0.6.5"."rand_hc"}" deps)
    (features_.rand_isaac."${deps."rand"."0.6.5"."rand_isaac"}" deps)
    (features_.rand_jitter."${deps."rand"."0.6.5"."rand_jitter"}" deps)
    (features_.rand_os."${deps."rand"."0.6.5"."rand_os"}" deps)
    (features_.rand_pcg."${deps."rand"."0.6.5"."rand_pcg"}" deps)
    (features_.rand_xorshift."${deps."rand"."0.6.5"."rand_xorshift"}" deps)
    (features_.autocfg."${deps."rand"."0.6.5"."autocfg"}" deps)
    (features_.libc."${deps."rand"."0.6.5"."libc"}" deps)
    (features_.winapi."${deps."rand"."0.6.5"."winapi"}" deps)
  ];


# end
# rand_chacha-0.1.1

  crates.rand_chacha."0.1.1" = deps: { features?(features_.rand_chacha."0.1.1" deps {}) }: buildRustCrate {
    crateName = "rand_chacha";
    version = "0.1.1";
    description = "ChaCha random number generator\n";
    authors = [ "The Rand Project Developers" "The Rust Project Developers" ];
    sha256 = "0xnxm4mjd7wjnh18zxc1yickw58axbycp35ciraplqdfwn1gffwi";
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."rand_core"."${deps."rand_chacha"."0.1.1"."rand_core"}" deps)
    ]);

    buildDependencies = mapFeatures features ([
      (crates."autocfg"."${deps."rand_chacha"."0.1.1"."autocfg"}" deps)
    ]);
  };
  features_.rand_chacha."0.1.1" = deps: f: updateFeatures f (rec {
    autocfg."${deps.rand_chacha."0.1.1".autocfg}".default = true;
    rand_chacha."0.1.1".default = (f.rand_chacha."0.1.1".default or true);
    rand_core."${deps.rand_chacha."0.1.1".rand_core}".default = (f.rand_core."${deps.rand_chacha."0.1.1".rand_core}".default or false);
  }) [
    (features_.rand_core."${deps."rand_chacha"."0.1.1"."rand_core"}" deps)
    (features_.autocfg."${deps."rand_chacha"."0.1.1"."autocfg"}" deps)
  ];


# end
# rand_core-0.3.1

  crates.rand_core."0.3.1" = deps: { features?(features_.rand_core."0.3.1" deps {}) }: buildRustCrate {
    crateName = "rand_core";
    version = "0.3.1";
    description = "Core random number generator traits and tools for implementation.\n";
    authors = [ "The Rand Project Developers" "The Rust Project Developers" ];
    sha256 = "0q0ssgpj9x5a6fda83nhmfydy7a6c0wvxm0jhncsmjx8qp8gw91m";
    dependencies = mapFeatures features ([
      (crates."rand_core"."${deps."rand_core"."0.3.1"."rand_core"}" deps)
    ]);
    features = mkFeatures (features."rand_core"."0.3.1" or {});
  };
  features_.rand_core."0.3.1" = deps: f: updateFeatures f (rec {
    rand_core = fold recursiveUpdate {} [
      { "${deps.rand_core."0.3.1".rand_core}"."alloc" =
        (f.rand_core."${deps.rand_core."0.3.1".rand_core}"."alloc" or false) ||
        (rand_core."0.3.1"."alloc" or false) ||
        (f."rand_core"."0.3.1"."alloc" or false); }
      { "${deps.rand_core."0.3.1".rand_core}"."serde1" =
        (f.rand_core."${deps.rand_core."0.3.1".rand_core}"."serde1" or false) ||
        (rand_core."0.3.1"."serde1" or false) ||
        (f."rand_core"."0.3.1"."serde1" or false); }
      { "${deps.rand_core."0.3.1".rand_core}"."std" =
        (f.rand_core."${deps.rand_core."0.3.1".rand_core}"."std" or false) ||
        (rand_core."0.3.1"."std" or false) ||
        (f."rand_core"."0.3.1"."std" or false); }
      { "${deps.rand_core."0.3.1".rand_core}".default = true; }
      { "0.3.1"."std" =
        (f.rand_core."0.3.1"."std" or false) ||
        (f.rand_core."0.3.1".default or false) ||
        (rand_core."0.3.1"."default" or false); }
      { "0.3.1".default = (f.rand_core."0.3.1".default or true); }
    ];
  }) [
    (features_.rand_core."${deps."rand_core"."0.3.1"."rand_core"}" deps)
  ];


# end
# rand_core-0.4.0

  crates.rand_core."0.4.0" = deps: { features?(features_.rand_core."0.4.0" deps {}) }: buildRustCrate {
    crateName = "rand_core";
    version = "0.4.0";
    description = "Core random number generator traits and tools for implementation.\n";
    authors = [ "The Rand Project Developers" "The Rust Project Developers" ];
    sha256 = "0wb5iwhffibj0pnpznhv1g3i7h1fnhz64s3nz74fz6vsm3q6q3br";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."rand_core"."0.4.0" or {});
  };
  features_.rand_core."0.4.0" = deps: f: updateFeatures f (rec {
    rand_core = fold recursiveUpdate {} [
      { "0.4.0"."alloc" =
        (f.rand_core."0.4.0"."alloc" or false) ||
        (f.rand_core."0.4.0".std or false) ||
        (rand_core."0.4.0"."std" or false); }
      { "0.4.0"."serde" =
        (f.rand_core."0.4.0"."serde" or false) ||
        (f.rand_core."0.4.0".serde1 or false) ||
        (rand_core."0.4.0"."serde1" or false); }
      { "0.4.0"."serde_derive" =
        (f.rand_core."0.4.0"."serde_derive" or false) ||
        (f.rand_core."0.4.0".serde1 or false) ||
        (rand_core."0.4.0"."serde1" or false); }
      { "0.4.0".default = (f.rand_core."0.4.0".default or true); }
    ];
  }) [];


# end
# rand_hc-0.1.0

  crates.rand_hc."0.1.0" = deps: { features?(features_.rand_hc."0.1.0" deps {}) }: buildRustCrate {
    crateName = "rand_hc";
    version = "0.1.0";
    description = "HC128 random number generator\n";
    authors = [ "The Rand Project Developers" ];
    sha256 = "05agb75j87yp7y1zk8yf7bpm66hc0673r3dlypn0kazynr6fdgkz";
    dependencies = mapFeatures features ([
      (crates."rand_core"."${deps."rand_hc"."0.1.0"."rand_core"}" deps)
    ]);
  };
  features_.rand_hc."0.1.0" = deps: f: updateFeatures f (rec {
    rand_core."${deps.rand_hc."0.1.0".rand_core}".default = (f.rand_core."${deps.rand_hc."0.1.0".rand_core}".default or false);
    rand_hc."0.1.0".default = (f.rand_hc."0.1.0".default or true);
  }) [
    (features_.rand_core."${deps."rand_hc"."0.1.0"."rand_core"}" deps)
  ];


# end
# rand_isaac-0.1.1

  crates.rand_isaac."0.1.1" = deps: { features?(features_.rand_isaac."0.1.1" deps {}) }: buildRustCrate {
    crateName = "rand_isaac";
    version = "0.1.1";
    description = "ISAAC random number generator\n";
    authors = [ "The Rand Project Developers" "The Rust Project Developers" ];
    sha256 = "10hhdh5b5sa03s6b63y9bafm956jwilx41s71jbrzl63ccx8lxdq";
    dependencies = mapFeatures features ([
      (crates."rand_core"."${deps."rand_isaac"."0.1.1"."rand_core"}" deps)
    ]);
    features = mkFeatures (features."rand_isaac"."0.1.1" or {});
  };
  features_.rand_isaac."0.1.1" = deps: f: updateFeatures f (rec {
    rand_core = fold recursiveUpdate {} [
      { "${deps.rand_isaac."0.1.1".rand_core}"."serde1" =
        (f.rand_core."${deps.rand_isaac."0.1.1".rand_core}"."serde1" or false) ||
        (rand_isaac."0.1.1"."serde1" or false) ||
        (f."rand_isaac"."0.1.1"."serde1" or false); }
      { "${deps.rand_isaac."0.1.1".rand_core}".default = (f.rand_core."${deps.rand_isaac."0.1.1".rand_core}".default or false); }
    ];
    rand_isaac = fold recursiveUpdate {} [
      { "0.1.1"."serde" =
        (f.rand_isaac."0.1.1"."serde" or false) ||
        (f.rand_isaac."0.1.1".serde1 or false) ||
        (rand_isaac."0.1.1"."serde1" or false); }
      { "0.1.1"."serde_derive" =
        (f.rand_isaac."0.1.1"."serde_derive" or false) ||
        (f.rand_isaac."0.1.1".serde1 or false) ||
        (rand_isaac."0.1.1"."serde1" or false); }
      { "0.1.1".default = (f.rand_isaac."0.1.1".default or true); }
    ];
  }) [
    (features_.rand_core."${deps."rand_isaac"."0.1.1"."rand_core"}" deps)
  ];


# end
# rand_jitter-0.1.4

  crates.rand_jitter."0.1.4" = deps: { features?(features_.rand_jitter."0.1.4" deps {}) }: buildRustCrate {
    crateName = "rand_jitter";
    version = "0.1.4";
    description = "Random number generator based on timing jitter";
    authors = [ "The Rand Project Developers" ];
    sha256 = "13nr4h042ab9l7qcv47bxrxw3gkf2pc3cni6c9pyi4nxla0mm7b6";
    dependencies = mapFeatures features ([
      (crates."rand_core"."${deps."rand_jitter"."0.1.4"."rand_core"}" deps)
    ])
      ++ (if kernel == "darwin" || kernel == "ios" then mapFeatures features ([
      (crates."libc"."${deps."rand_jitter"."0.1.4"."libc"}" deps)
    ]) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."rand_jitter"."0.1.4"."winapi"}" deps)
    ]) else []);
    features = mkFeatures (features."rand_jitter"."0.1.4" or {});
  };
  features_.rand_jitter."0.1.4" = deps: f: updateFeatures f (rec {
    libc."${deps.rand_jitter."0.1.4".libc}".default = true;
    rand_core = fold recursiveUpdate {} [
      { "${deps.rand_jitter."0.1.4".rand_core}"."std" =
        (f.rand_core."${deps.rand_jitter."0.1.4".rand_core}"."std" or false) ||
        (rand_jitter."0.1.4"."std" or false) ||
        (f."rand_jitter"."0.1.4"."std" or false); }
      { "${deps.rand_jitter."0.1.4".rand_core}".default = true; }
    ];
    rand_jitter."0.1.4".default = (f.rand_jitter."0.1.4".default or true);
    winapi = fold recursiveUpdate {} [
      { "${deps.rand_jitter."0.1.4".winapi}"."profileapi" = true; }
      { "${deps.rand_jitter."0.1.4".winapi}".default = true; }
    ];
  }) [
    (features_.rand_core."${deps."rand_jitter"."0.1.4"."rand_core"}" deps)
    (features_.libc."${deps."rand_jitter"."0.1.4"."libc"}" deps)
    (features_.winapi."${deps."rand_jitter"."0.1.4"."winapi"}" deps)
  ];


# end
# rand_os-0.1.3

  crates.rand_os."0.1.3" = deps: { features?(features_.rand_os."0.1.3" deps {}) }: buildRustCrate {
    crateName = "rand_os";
    version = "0.1.3";
    description = "OS backed Random Number Generator";
    authors = [ "The Rand Project Developers" ];
    sha256 = "0ywwspizgs9g8vzn6m5ix9yg36n15119d6n792h7mk4r5vs0ww4j";
    dependencies = mapFeatures features ([
      (crates."rand_core"."${deps."rand_os"."0.1.3"."rand_core"}" deps)
    ])
      ++ (if abi == "sgx" then mapFeatures features ([
      (crates."rdrand"."${deps."rand_os"."0.1.3"."rdrand"}" deps)
    ]) else [])
      ++ (if kernel == "cloudabi" then mapFeatures features ([
      (crates."cloudabi"."${deps."rand_os"."0.1.3"."cloudabi"}" deps)
    ]) else [])
      ++ (if kernel == "fuchsia" then mapFeatures features ([
      (crates."fuchsia_cprng"."${deps."rand_os"."0.1.3"."fuchsia_cprng"}" deps)
    ]) else [])
      ++ (if (kernel == "linux" || kernel == "darwin") then mapFeatures features ([
      (crates."libc"."${deps."rand_os"."0.1.3"."libc"}" deps)
    ]) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."rand_os"."0.1.3"."winapi"}" deps)
    ]) else [])
      ++ (if kernel == "wasm32-unknown-unknown" then mapFeatures features ([
]) else []);
  };
  features_.rand_os."0.1.3" = deps: f: updateFeatures f (rec {
    cloudabi."${deps.rand_os."0.1.3".cloudabi}".default = true;
    fuchsia_cprng."${deps.rand_os."0.1.3".fuchsia_cprng}".default = true;
    libc."${deps.rand_os."0.1.3".libc}".default = true;
    rand_core = fold recursiveUpdate {} [
      { "${deps.rand_os."0.1.3".rand_core}"."std" = true; }
      { "${deps.rand_os."0.1.3".rand_core}".default = true; }
    ];
    rand_os."0.1.3".default = (f.rand_os."0.1.3".default or true);
    rdrand."${deps.rand_os."0.1.3".rdrand}".default = true;
    winapi = fold recursiveUpdate {} [
      { "${deps.rand_os."0.1.3".winapi}"."minwindef" = true; }
      { "${deps.rand_os."0.1.3".winapi}"."ntsecapi" = true; }
      { "${deps.rand_os."0.1.3".winapi}"."winnt" = true; }
      { "${deps.rand_os."0.1.3".winapi}".default = true; }
    ];
  }) [
    (features_.rand_core."${deps."rand_os"."0.1.3"."rand_core"}" deps)
    (features_.rdrand."${deps."rand_os"."0.1.3"."rdrand"}" deps)
    (features_.cloudabi."${deps."rand_os"."0.1.3"."cloudabi"}" deps)
    (features_.fuchsia_cprng."${deps."rand_os"."0.1.3"."fuchsia_cprng"}" deps)
    (features_.libc."${deps."rand_os"."0.1.3"."libc"}" deps)
    (features_.winapi."${deps."rand_os"."0.1.3"."winapi"}" deps)
  ];


# end
# rand_pcg-0.1.2

  crates.rand_pcg."0.1.2" = deps: { features?(features_.rand_pcg."0.1.2" deps {}) }: buildRustCrate {
    crateName = "rand_pcg";
    version = "0.1.2";
    description = "Selected PCG random number generators\n";
    authors = [ "The Rand Project Developers" ];
    sha256 = "04qgi2ai2z42li5h4aawvxbpnlqyjfnipz9d6k73mdnl6p1xq938";
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."rand_core"."${deps."rand_pcg"."0.1.2"."rand_core"}" deps)
    ]);

    buildDependencies = mapFeatures features ([
      (crates."autocfg"."${deps."rand_pcg"."0.1.2"."autocfg"}" deps)
    ]);
    features = mkFeatures (features."rand_pcg"."0.1.2" or {});
  };
  features_.rand_pcg."0.1.2" = deps: f: updateFeatures f (rec {
    autocfg."${deps.rand_pcg."0.1.2".autocfg}".default = true;
    rand_core."${deps.rand_pcg."0.1.2".rand_core}".default = true;
    rand_pcg = fold recursiveUpdate {} [
      { "0.1.2"."serde" =
        (f.rand_pcg."0.1.2"."serde" or false) ||
        (f.rand_pcg."0.1.2".serde1 or false) ||
        (rand_pcg."0.1.2"."serde1" or false); }
      { "0.1.2"."serde_derive" =
        (f.rand_pcg."0.1.2"."serde_derive" or false) ||
        (f.rand_pcg."0.1.2".serde1 or false) ||
        (rand_pcg."0.1.2"."serde1" or false); }
      { "0.1.2".default = (f.rand_pcg."0.1.2".default or true); }
    ];
  }) [
    (features_.rand_core."${deps."rand_pcg"."0.1.2"."rand_core"}" deps)
    (features_.autocfg."${deps."rand_pcg"."0.1.2"."autocfg"}" deps)
  ];


# end
# rand_xorshift-0.1.1

  crates.rand_xorshift."0.1.1" = deps: { features?(features_.rand_xorshift."0.1.1" deps {}) }: buildRustCrate {
    crateName = "rand_xorshift";
    version = "0.1.1";
    description = "Xorshift random number generator\n";
    authors = [ "The Rand Project Developers" "The Rust Project Developers" ];
    sha256 = "0v365c4h4lzxwz5k5kp9m0661s0sss7ylv74if0xb4svis9sswnn";
    dependencies = mapFeatures features ([
      (crates."rand_core"."${deps."rand_xorshift"."0.1.1"."rand_core"}" deps)
    ]);
    features = mkFeatures (features."rand_xorshift"."0.1.1" or {});
  };
  features_.rand_xorshift."0.1.1" = deps: f: updateFeatures f (rec {
    rand_core."${deps.rand_xorshift."0.1.1".rand_core}".default = (f.rand_core."${deps.rand_xorshift."0.1.1".rand_core}".default or false);
    rand_xorshift = fold recursiveUpdate {} [
      { "0.1.1"."serde" =
        (f.rand_xorshift."0.1.1"."serde" or false) ||
        (f.rand_xorshift."0.1.1".serde1 or false) ||
        (rand_xorshift."0.1.1"."serde1" or false); }
      { "0.1.1"."serde_derive" =
        (f.rand_xorshift."0.1.1"."serde_derive" or false) ||
        (f.rand_xorshift."0.1.1".serde1 or false) ||
        (rand_xorshift."0.1.1"."serde1" or false); }
      { "0.1.1".default = (f.rand_xorshift."0.1.1".default or true); }
    ];
  }) [
    (features_.rand_core."${deps."rand_xorshift"."0.1.1"."rand_core"}" deps)
  ];


# end
# rdrand-0.4.0

  crates.rdrand."0.4.0" = deps: { features?(features_.rdrand."0.4.0" deps {}) }: buildRustCrate {
    crateName = "rdrand";
    version = "0.4.0";
    description = "An implementation of random number generator based on rdrand and rdseed instructions";
    authors = [ "Simonas Kazlauskas <rdrand@kazlauskas.me>" ];
    sha256 = "15hrcasn0v876wpkwab1dwbk9kvqwrb3iv4y4dibb6yxnfvzwajk";
    dependencies = mapFeatures features ([
      (crates."rand_core"."${deps."rdrand"."0.4.0"."rand_core"}" deps)
    ]);
    features = mkFeatures (features."rdrand"."0.4.0" or {});
  };
  features_.rdrand."0.4.0" = deps: f: updateFeatures f (rec {
    rand_core."${deps.rdrand."0.4.0".rand_core}".default = (f.rand_core."${deps.rdrand."0.4.0".rand_core}".default or false);
    rdrand = fold recursiveUpdate {} [
      { "0.4.0"."std" =
        (f.rdrand."0.4.0"."std" or false) ||
        (f.rdrand."0.4.0".default or false) ||
        (rdrand."0.4.0"."default" or false); }
      { "0.4.0".default = (f.rdrand."0.4.0".default or true); }
    ];
  }) [
    (features_.rand_core."${deps."rdrand"."0.4.0"."rand_core"}" deps)
  ];


# end
# redox_syscall-0.1.56

  crates.redox_syscall."0.1.56" = deps: { features?(features_.redox_syscall."0.1.56" deps {}) }: buildRustCrate {
    crateName = "redox_syscall";
    version = "0.1.56";
    description = "A Rust library to access raw Redox system calls";
    authors = [ "Jeremy Soller <jackpot51@gmail.com>" ];
    sha256 = "0jcp8nd947zcy938bz09pzlmi3vyxfdzg92pjxdvvk0699vwcc26";
    libName = "syscall";
  };
  features_.redox_syscall."0.1.56" = deps: f: updateFeatures f (rec {
    redox_syscall."0.1.56".default = (f.redox_syscall."0.1.56".default or true);
  }) [];


# end
# redox_users-0.3.0

  crates.redox_users."0.3.0" = deps: { features?(features_.redox_users."0.3.0" deps {}) }: buildRustCrate {
    crateName = "redox_users";
    version = "0.3.0";
    description = "A Rust library to access Redox users and groups functionality";
    authors = [ "Jose Narvaez <goyox86@gmail.com>" "Wesley Hershberger <mggmugginsmc@gmail.com>" ];
    sha256 = "051rzqgk5hn7rf24nwgbb32zfdn8qp2kwqvdp0772ia85p737p4j";
    dependencies = mapFeatures features ([
      (crates."argon2rs"."${deps."redox_users"."0.3.0"."argon2rs"}" deps)
      (crates."failure"."${deps."redox_users"."0.3.0"."failure"}" deps)
      (crates."rand_os"."${deps."redox_users"."0.3.0"."rand_os"}" deps)
      (crates."redox_syscall"."${deps."redox_users"."0.3.0"."redox_syscall"}" deps)
    ]);
  };
  features_.redox_users."0.3.0" = deps: f: updateFeatures f (rec {
    argon2rs."${deps.redox_users."0.3.0".argon2rs}".default = (f.argon2rs."${deps.redox_users."0.3.0".argon2rs}".default or false);
    failure."${deps.redox_users."0.3.0".failure}".default = true;
    rand_os."${deps.redox_users."0.3.0".rand_os}".default = true;
    redox_syscall."${deps.redox_users."0.3.0".redox_syscall}".default = true;
    redox_users."0.3.0".default = (f.redox_users."0.3.0".default or true);
  }) [
    (features_.argon2rs."${deps."redox_users"."0.3.0"."argon2rs"}" deps)
    (features_.failure."${deps."redox_users"."0.3.0"."failure"}" deps)
    (features_.rand_os."${deps."redox_users"."0.3.0"."rand_os"}" deps)
    (features_.redox_syscall."${deps."redox_users"."0.3.0"."redox_syscall"}" deps)
  ];


# end
# regex-1.1.2

  crates.regex."1.1.2" = deps: { features?(features_.regex."1.1.2" deps {}) }: buildRustCrate {
    crateName = "regex";
    version = "1.1.2";
    description = "An implementation of regular expressions for Rust. This implementation uses\nfinite automata and guarantees linear time matching on all inputs.\n";
    authors = [ "The Rust Project Developers" ];
    sha256 = "1c9nb031z1vw5l6lzfkfra2mah9hb2s1wgq9f1lmgcbkiiprj9xd";
    dependencies = mapFeatures features ([
      (crates."aho_corasick"."${deps."regex"."1.1.2"."aho_corasick"}" deps)
      (crates."memchr"."${deps."regex"."1.1.2"."memchr"}" deps)
      (crates."regex_syntax"."${deps."regex"."1.1.2"."regex_syntax"}" deps)
      (crates."thread_local"."${deps."regex"."1.1.2"."thread_local"}" deps)
      (crates."utf8_ranges"."${deps."regex"."1.1.2"."utf8_ranges"}" deps)
    ]);
    features = mkFeatures (features."regex"."1.1.2" or {});
  };
  features_.regex."1.1.2" = deps: f: updateFeatures f (rec {
    aho_corasick."${deps.regex."1.1.2".aho_corasick}".default = true;
    memchr."${deps.regex."1.1.2".memchr}".default = true;
    regex = fold recursiveUpdate {} [
      { "1.1.2"."pattern" =
        (f.regex."1.1.2"."pattern" or false) ||
        (f.regex."1.1.2".unstable or false) ||
        (regex."1.1.2"."unstable" or false); }
      { "1.1.2"."use_std" =
        (f.regex."1.1.2"."use_std" or false) ||
        (f.regex."1.1.2".default or false) ||
        (regex."1.1.2"."default" or false); }
      { "1.1.2".default = (f.regex."1.1.2".default or true); }
    ];
    regex_syntax."${deps.regex."1.1.2".regex_syntax}".default = true;
    thread_local."${deps.regex."1.1.2".thread_local}".default = true;
    utf8_ranges."${deps.regex."1.1.2".utf8_ranges}".default = true;
  }) [
    (features_.aho_corasick."${deps."regex"."1.1.2"."aho_corasick"}" deps)
    (features_.memchr."${deps."regex"."1.1.2"."memchr"}" deps)
    (features_.regex_syntax."${deps."regex"."1.1.2"."regex_syntax"}" deps)
    (features_.thread_local."${deps."regex"."1.1.2"."thread_local"}" deps)
    (features_.utf8_ranges."${deps."regex"."1.1.2"."utf8_ranges"}" deps)
  ];


# end
# regex-syntax-0.6.7

  crates.regex_syntax."0.6.7" = deps: { features?(features_.regex_syntax."0.6.7" deps {}) }: buildRustCrate {
    crateName = "regex-syntax";
    version = "0.6.7";
    description = "A regular expression parser.";
    authors = [ "The Rust Project Developers" ];
    sha256 = "1vv0d9p9djkz0kfg1ajd1p3j3dsiq78nnqsvl3ivygasj3llqb9x";
    dependencies = mapFeatures features ([
      (crates."ucd_util"."${deps."regex_syntax"."0.6.7"."ucd_util"}" deps)
    ]);
  };
  features_.regex_syntax."0.6.7" = deps: f: updateFeatures f (rec {
    regex_syntax."0.6.7".default = (f.regex_syntax."0.6.7".default or true);
    ucd_util."${deps.regex_syntax."0.6.7".ucd_util}".default = true;
  }) [
    (features_.ucd_util."${deps."regex_syntax"."0.6.7"."ucd_util"}" deps)
  ];


# end
# remove_dir_all-0.5.2

  crates.remove_dir_all."0.5.2" = deps: { features?(features_.remove_dir_all."0.5.2" deps {}) }: buildRustCrate {
    crateName = "remove_dir_all";
    version = "0.5.2";
    description = "A safe, reliable implementation of remove_dir_all for Windows";
    authors = [ "Aaronepower <theaaronepower@gmail.com>" ];
    sha256 = "04sxg2ppvxiljc2i13bwvpbi540rf9d2a89cq0wmqf9pjvr3a1wm";
    dependencies = (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."remove_dir_all"."0.5.2"."winapi"}" deps)
    ]) else []);
  };
  features_.remove_dir_all."0.5.2" = deps: f: updateFeatures f (rec {
    remove_dir_all."0.5.2".default = (f.remove_dir_all."0.5.2".default or true);
    winapi = fold recursiveUpdate {} [
      { "${deps.remove_dir_all."0.5.2".winapi}"."errhandlingapi" = true; }
      { "${deps.remove_dir_all."0.5.2".winapi}"."fileapi" = true; }
      { "${deps.remove_dir_all."0.5.2".winapi}"."std" = true; }
      { "${deps.remove_dir_all."0.5.2".winapi}"."winbase" = true; }
      { "${deps.remove_dir_all."0.5.2".winapi}"."winerror" = true; }
      { "${deps.remove_dir_all."0.5.2".winapi}".default = true; }
    ];
  }) [
    (features_.winapi."${deps."remove_dir_all"."0.5.2"."winapi"}" deps)
  ];


# end
# rgb-0.8.13

  crates.rgb."0.8.13" = deps: { features?(features_.rgb."0.8.13" deps {}) }: buildRustCrate {
    crateName = "rgb";
    version = "0.8.13";
    description = "`struct RGB/RGBA/etc.` for sharing pixels between crates + convenience methods for color manipulation.\nAllows no-copy high-level interoperability. Also adds common convenience methods and implements standard Rust traits to make `RGB`/`RGBA` pixels and slices first-class Rust objects.";
    authors = [ "Kornel Lesiński <kornel@geekhood.net>" ];
    sha256 = "0jiricfialx3p3idbkl1p9pizzq8cfjvia0nyzq6pw5hddj49vak";
    dependencies = mapFeatures features ([
]);
  };
  features_.rgb."0.8.13" = deps: f: updateFeatures f (rec {
    rgb."0.8.13".default = (f.rgb."0.8.13".default or true);
  }) [];


# end
# rustc-demangle-0.1.15

  crates.rustc_demangle."0.1.15" = deps: { features?(features_.rustc_demangle."0.1.15" deps {}) }: buildRustCrate {
    crateName = "rustc-demangle";
    version = "0.1.15";
    description = "Rust compiler symbol demangling.\n";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "04rgsfzhz4k9s56vkczsdbvmvg9409xp0nw4cy99lb2i0aa0255s";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."rustc_demangle"."0.1.15" or {});
  };
  features_.rustc_demangle."0.1.15" = deps: f: updateFeatures f (rec {
    rustc_demangle = fold recursiveUpdate {} [
      { "0.1.15"."compiler_builtins" =
        (f.rustc_demangle."0.1.15"."compiler_builtins" or false) ||
        (f.rustc_demangle."0.1.15".rustc-dep-of-std or false) ||
        (rustc_demangle."0.1.15"."rustc-dep-of-std" or false); }
      { "0.1.15"."core" =
        (f.rustc_demangle."0.1.15"."core" or false) ||
        (f.rustc_demangle."0.1.15".rustc-dep-of-std or false) ||
        (rustc_demangle."0.1.15"."rustc-dep-of-std" or false); }
      { "0.1.15".default = (f.rustc_demangle."0.1.15".default or true); }
    ];
  }) [];


# end
# rustyline-4.1.0

  crates.rustyline."4.1.0" = deps: { features?(features_.rustyline."4.1.0" deps {}) }: buildRustCrate {
    crateName = "rustyline";
    version = "4.1.0";
    description = "Rustyline, a readline implementation based on Antirez's Linenoise";
    authors = [ "Katsu Kawakami <kkawa1570@gmail.com>" ];
    edition = "2018";
    sha256 = "0y6dwk989f0kbf23nijfdz8xq30daf7ki760pacqmfxbn1ckflfq";
    dependencies = mapFeatures features ([
      (crates."libc"."${deps."rustyline"."4.1.0"."libc"}" deps)
      (crates."log"."${deps."rustyline"."4.1.0"."log"}" deps)
      (crates."memchr"."${deps."rustyline"."4.1.0"."memchr"}" deps)
      (crates."unicode_segmentation"."${deps."rustyline"."4.1.0"."unicode_segmentation"}" deps)
      (crates."unicode_width"."${deps."rustyline"."4.1.0"."unicode_width"}" deps)
    ]
      ++ (if features.rustyline."4.1.0".dirs or false then [ (crates.dirs."${deps."rustyline"."4.1.0".dirs}" deps) ] else []))
      ++ (if (kernel == "linux" || kernel == "darwin") then mapFeatures features ([
      (crates."nix"."${deps."rustyline"."4.1.0"."nix"}" deps)
      (crates."utf8parse"."${deps."rustyline"."4.1.0"."utf8parse"}" deps)
    ]) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."rustyline"."4.1.0"."winapi"}" deps)
    ]) else []);
    features = mkFeatures (features."rustyline"."4.1.0" or {});
  };
  features_.rustyline."4.1.0" = deps: f: updateFeatures f (rec {
    dirs."${deps.rustyline."4.1.0".dirs}".default = true;
    libc."${deps.rustyline."4.1.0".libc}".default = true;
    log."${deps.rustyline."4.1.0".log}".default = true;
    memchr."${deps.rustyline."4.1.0".memchr}".default = true;
    nix."${deps.rustyline."4.1.0".nix}".default = true;
    rustyline = fold recursiveUpdate {} [
      { "4.1.0"."dirs" =
        (f.rustyline."4.1.0"."dirs" or false) ||
        (f.rustyline."4.1.0".with-dirs or false) ||
        (rustyline."4.1.0"."with-dirs" or false); }
      { "4.1.0"."with-dirs" =
        (f.rustyline."4.1.0"."with-dirs" or false) ||
        (f.rustyline."4.1.0".default or false) ||
        (rustyline."4.1.0"."default" or false); }
      { "4.1.0".default = (f.rustyline."4.1.0".default or true); }
    ];
    unicode_segmentation."${deps.rustyline."4.1.0".unicode_segmentation}".default = true;
    unicode_width."${deps.rustyline."4.1.0".unicode_width}".default = true;
    utf8parse."${deps.rustyline."4.1.0".utf8parse}".default = true;
    winapi = fold recursiveUpdate {} [
      { "${deps.rustyline."4.1.0".winapi}"."consoleapi" = true; }
      { "${deps.rustyline."4.1.0".winapi}"."handleapi" = true; }
      { "${deps.rustyline."4.1.0".winapi}"."minwindef" = true; }
      { "${deps.rustyline."4.1.0".winapi}"."processenv" = true; }
      { "${deps.rustyline."4.1.0".winapi}"."winbase" = true; }
      { "${deps.rustyline."4.1.0".winapi}"."wincon" = true; }
      { "${deps.rustyline."4.1.0".winapi}"."winuser" = true; }
      { "${deps.rustyline."4.1.0".winapi}".default = true; }
    ];
  }) [
    (features_.dirs."${deps."rustyline"."4.1.0"."dirs"}" deps)
    (features_.libc."${deps."rustyline"."4.1.0"."libc"}" deps)
    (features_.log."${deps."rustyline"."4.1.0"."log"}" deps)
    (features_.memchr."${deps."rustyline"."4.1.0"."memchr"}" deps)
    (features_.unicode_segmentation."${deps."rustyline"."4.1.0"."unicode_segmentation"}" deps)
    (features_.unicode_width."${deps."rustyline"."4.1.0"."unicode_width"}" deps)
    (features_.nix."${deps."rustyline"."4.1.0"."nix"}" deps)
    (features_.utf8parse."${deps."rustyline"."4.1.0"."utf8parse"}" deps)
    (features_.winapi."${deps."rustyline"."4.1.0"."winapi"}" deps)
  ];


# end
# scoped_threadpool-0.1.9

  crates.scoped_threadpool."0.1.9" = deps: { features?(features_.scoped_threadpool."0.1.9" deps {}) }: buildRustCrate {
    crateName = "scoped_threadpool";
    version = "0.1.9";
    description = "A library for scoped and cached threadpools.";
    authors = [ "Marvin Löbel <loebel.marvin@gmail.com>" ];
    sha256 = "1arqj2skcfr46s1lcyvnlmfr5456kg5nhn8k90xyfjnxkp5yga2v";
    features = mkFeatures (features."scoped_threadpool"."0.1.9" or {});
  };
  features_.scoped_threadpool."0.1.9" = deps: f: updateFeatures f (rec {
    scoped_threadpool."0.1.9".default = (f.scoped_threadpool."0.1.9".default or true);
  }) [];


# end
# sha2-0.8.0

  crates.sha2."0.8.0" = deps: { features?(features_.sha2."0.8.0" deps {}) }: buildRustCrate {
    crateName = "sha2";
    version = "0.8.0";
    description = "SHA-2 hash functions";
    authors = [ "RustCrypto Developers" ];
    sha256 = "0jhg56v7m6mj3jb857np4qvr72146garnabcgdk368fm0csfs1sq";
    dependencies = mapFeatures features ([
      (crates."block_buffer"."${deps."sha2"."0.8.0"."block_buffer"}" deps)
      (crates."digest"."${deps."sha2"."0.8.0"."digest"}" deps)
      (crates."fake_simd"."${deps."sha2"."0.8.0"."fake_simd"}" deps)
      (crates."opaque_debug"."${deps."sha2"."0.8.0"."opaque_debug"}" deps)
    ]);
    features = mkFeatures (features."sha2"."0.8.0" or {});
  };
  features_.sha2."0.8.0" = deps: f: updateFeatures f (rec {
    block_buffer."${deps.sha2."0.8.0".block_buffer}".default = true;
    digest = fold recursiveUpdate {} [
      { "${deps.sha2."0.8.0".digest}"."std" =
        (f.digest."${deps.sha2."0.8.0".digest}"."std" or false) ||
        (sha2."0.8.0"."std" or false) ||
        (f."sha2"."0.8.0"."std" or false); }
      { "${deps.sha2."0.8.0".digest}".default = true; }
    ];
    fake_simd."${deps.sha2."0.8.0".fake_simd}".default = true;
    opaque_debug."${deps.sha2."0.8.0".opaque_debug}".default = true;
    sha2 = fold recursiveUpdate {} [
      { "0.8.0"."sha2-asm" =
        (f.sha2."0.8.0"."sha2-asm" or false) ||
        (f.sha2."0.8.0".asm or false) ||
        (sha2."0.8.0"."asm" or false); }
      { "0.8.0"."std" =
        (f.sha2."0.8.0"."std" or false) ||
        (f.sha2."0.8.0".default or false) ||
        (sha2."0.8.0"."default" or false); }
      { "0.8.0".default = (f.sha2."0.8.0".default or true); }
    ];
  }) [
    (features_.block_buffer."${deps."sha2"."0.8.0"."block_buffer"}" deps)
    (features_.digest."${deps."sha2"."0.8.0"."digest"}" deps)
    (features_.fake_simd."${deps."sha2"."0.8.0"."fake_simd"}" deps)
    (features_.opaque_debug."${deps."sha2"."0.8.0"."opaque_debug"}" deps)
  ];


# end
# sig-1.0.0

  crates.sig."1.0.0" = deps: { features?(features_.sig."1.0.0" deps {}) }: buildRustCrate {
    crateName = "sig";
    version = "1.0.0";
    description = "ffi library of signal(2) and kill(2)";
    authors = [ "adjivas <adjivas@users.noreply.github.com>" "emilio <emilio@users.noreply.github.com>" ];
    sha256 = "1i8691652pac96vs1dacpki6iqippvxczabki2giyf917v5falhk";
    dependencies = mapFeatures features ([
      (crates."libc"."${deps."sig"."1.0.0"."libc"}" deps)
    ]);
  };
  features_.sig."1.0.0" = deps: f: updateFeatures f (rec {
    libc."${deps.sig."1.0.0".libc}".default = true;
    sig."1.0.0".default = (f.sig."1.0.0".default or true);
  }) [
    (features_.libc."${deps."sig"."1.0.0"."libc"}" deps)
  ];


# end
# subtle-1.0.0

  crates.subtle."1.0.0" = deps: { features?(features_.subtle."1.0.0" deps {}) }: buildRustCrate {
    crateName = "subtle";
    version = "1.0.0";
    description = "Pure-Rust traits and utilities for constant-time cryptographic implementations.";
    authors = [ "Isis Lovecruft <isis@patternsinthevoid.net>" "Henry de Valence <hdevalence@hdevalence.ca>" ];
    sha256 = "0602qq101arxz39lgbc5fxbr01zffrvd9p5wgmsh36c5675kz8h1";
    features = mkFeatures (features."subtle"."1.0.0" or {});
  };
  features_.subtle."1.0.0" = deps: f: updateFeatures f (rec {
    subtle = fold recursiveUpdate {} [
      { "1.0.0"."i128" =
        (f.subtle."1.0.0"."i128" or false) ||
        (f.subtle."1.0.0".default or false) ||
        (subtle."1.0.0"."default" or false); }
      { "1.0.0"."std" =
        (f.subtle."1.0.0"."std" or false) ||
        (f.subtle."1.0.0".default or false) ||
        (subtle."1.0.0"."default" or false); }
      { "1.0.0".default = (f.subtle."1.0.0".default or true); }
    ];
  }) [];


# end
# syn-0.15.27

  crates.syn."0.15.27" = deps: { features?(features_.syn."0.15.27" deps {}) }: buildRustCrate {
    crateName = "syn";
    version = "0.15.27";
    description = "Parser for Rust source code";
    authors = [ "David Tolnay <dtolnay@gmail.com>" ];
    sha256 = "0xc1pi87r8f1j2i1mqaf31nx8417bhdir6xqdxrv03gvhr2drk64";
    dependencies = mapFeatures features ([
      (crates."proc_macro2"."${deps."syn"."0.15.27"."proc_macro2"}" deps)
      (crates."unicode_xid"."${deps."syn"."0.15.27"."unicode_xid"}" deps)
    ]
      ++ (if features.syn."0.15.27".quote or false then [ (crates.quote."${deps."syn"."0.15.27".quote}" deps) ] else []));
    features = mkFeatures (features."syn"."0.15.27" or {});
  };
  features_.syn."0.15.27" = deps: f: updateFeatures f (rec {
    proc_macro2 = fold recursiveUpdate {} [
      { "${deps.syn."0.15.27".proc_macro2}"."proc-macro" =
        (f.proc_macro2."${deps.syn."0.15.27".proc_macro2}"."proc-macro" or false) ||
        (syn."0.15.27"."proc-macro" or false) ||
        (f."syn"."0.15.27"."proc-macro" or false); }
      { "${deps.syn."0.15.27".proc_macro2}".default = (f.proc_macro2."${deps.syn."0.15.27".proc_macro2}".default or false); }
    ];
    quote = fold recursiveUpdate {} [
      { "${deps.syn."0.15.27".quote}"."proc-macro" =
        (f.quote."${deps.syn."0.15.27".quote}"."proc-macro" or false) ||
        (syn."0.15.27"."proc-macro" or false) ||
        (f."syn"."0.15.27"."proc-macro" or false); }
      { "${deps.syn."0.15.27".quote}".default = (f.quote."${deps.syn."0.15.27".quote}".default or false); }
    ];
    syn = fold recursiveUpdate {} [
      { "0.15.27"."clone-impls" =
        (f.syn."0.15.27"."clone-impls" or false) ||
        (f.syn."0.15.27".default or false) ||
        (syn."0.15.27"."default" or false); }
      { "0.15.27"."derive" =
        (f.syn."0.15.27"."derive" or false) ||
        (f.syn."0.15.27".default or false) ||
        (syn."0.15.27"."default" or false); }
      { "0.15.27"."parsing" =
        (f.syn."0.15.27"."parsing" or false) ||
        (f.syn."0.15.27".default or false) ||
        (syn."0.15.27"."default" or false); }
      { "0.15.27"."printing" =
        (f.syn."0.15.27"."printing" or false) ||
        (f.syn."0.15.27".default or false) ||
        (syn."0.15.27"."default" or false); }
      { "0.15.27"."proc-macro" =
        (f.syn."0.15.27"."proc-macro" or false) ||
        (f.syn."0.15.27".default or false) ||
        (syn."0.15.27"."default" or false); }
      { "0.15.27"."quote" =
        (f.syn."0.15.27"."quote" or false) ||
        (f.syn."0.15.27".printing or false) ||
        (syn."0.15.27"."printing" or false); }
      { "0.15.27".default = (f.syn."0.15.27".default or true); }
    ];
    unicode_xid."${deps.syn."0.15.27".unicode_xid}".default = true;
  }) [
    (features_.proc_macro2."${deps."syn"."0.15.27"."proc_macro2"}" deps)
    (features_.quote."${deps."syn"."0.15.27"."quote"}" deps)
    (features_.unicode_xid."${deps."syn"."0.15.27"."unicode_xid"}" deps)
  ];


# end
# synstructure-0.10.2

  crates.synstructure."0.10.2" = deps: { features?(features_.synstructure."0.10.2" deps {}) }: buildRustCrate {
    crateName = "synstructure";
    version = "0.10.2";
    description = "Helper methods and macros for custom derives";
    authors = [ "Nika Layzell <nika@thelayzells.com>" ];
    sha256 = "0bp29grjsim99xm1l6h38mbl98gnk47lf82rawlmws5zn4asdpj4";
    dependencies = mapFeatures features ([
      (crates."proc_macro2"."${deps."synstructure"."0.10.2"."proc_macro2"}" deps)
      (crates."quote"."${deps."synstructure"."0.10.2"."quote"}" deps)
      (crates."syn"."${deps."synstructure"."0.10.2"."syn"}" deps)
      (crates."unicode_xid"."${deps."synstructure"."0.10.2"."unicode_xid"}" deps)
    ]);
    features = mkFeatures (features."synstructure"."0.10.2" or {});
  };
  features_.synstructure."0.10.2" = deps: f: updateFeatures f (rec {
    proc_macro2."${deps.synstructure."0.10.2".proc_macro2}".default = true;
    quote."${deps.synstructure."0.10.2".quote}".default = true;
    syn = fold recursiveUpdate {} [
      { "${deps.synstructure."0.10.2".syn}"."extra-traits" = true; }
      { "${deps.synstructure."0.10.2".syn}"."visit" = true; }
      { "${deps.synstructure."0.10.2".syn}".default = true; }
    ];
    synstructure."0.10.2".default = (f.synstructure."0.10.2".default or true);
    unicode_xid."${deps.synstructure."0.10.2".unicode_xid}".default = true;
  }) [
    (features_.proc_macro2."${deps."synstructure"."0.10.2"."proc_macro2"}" deps)
    (features_.quote."${deps."synstructure"."0.10.2"."quote"}" deps)
    (features_.syn."${deps."synstructure"."0.10.2"."syn"}" deps)
    (features_.unicode_xid."${deps."synstructure"."0.10.2"."unicode_xid"}" deps)
  ];


# end
# tempfile-3.0.7

  crates.tempfile."3.0.7" = deps: { features?(features_.tempfile."3.0.7" deps {}) }: buildRustCrate {
    crateName = "tempfile";
    version = "3.0.7";
    description = "A library for managing temporary files and directories.\n";
    authors = [ "Steven Allen <steven@stebalien.com>" "The Rust Project Developers" "Ashley Mannix <ashleymannix@live.com.au>" "Jason White <jasonaw0@gmail.com>" ];
    sha256 = "19h7ch8fvisxrrmabcnhlfj6b8vg34zaw8491x141p0n0727niaf";
    dependencies = mapFeatures features ([
      (crates."cfg_if"."${deps."tempfile"."3.0.7"."cfg_if"}" deps)
      (crates."rand"."${deps."tempfile"."3.0.7"."rand"}" deps)
      (crates."remove_dir_all"."${deps."tempfile"."3.0.7"."remove_dir_all"}" deps)
    ])
      ++ (if kernel == "redox" then mapFeatures features ([
      (crates."redox_syscall"."${deps."tempfile"."3.0.7"."redox_syscall"}" deps)
    ]) else [])
      ++ (if (kernel == "linux" || kernel == "darwin") then mapFeatures features ([
      (crates."libc"."${deps."tempfile"."3.0.7"."libc"}" deps)
    ]) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."tempfile"."3.0.7"."winapi"}" deps)
    ]) else []);
  };
  features_.tempfile."3.0.7" = deps: f: updateFeatures f (rec {
    cfg_if."${deps.tempfile."3.0.7".cfg_if}".default = true;
    libc."${deps.tempfile."3.0.7".libc}".default = true;
    rand."${deps.tempfile."3.0.7".rand}".default = true;
    redox_syscall."${deps.tempfile."3.0.7".redox_syscall}".default = true;
    remove_dir_all."${deps.tempfile."3.0.7".remove_dir_all}".default = true;
    tempfile."3.0.7".default = (f.tempfile."3.0.7".default or true);
    winapi = fold recursiveUpdate {} [
      { "${deps.tempfile."3.0.7".winapi}"."fileapi" = true; }
      { "${deps.tempfile."3.0.7".winapi}"."handleapi" = true; }
      { "${deps.tempfile."3.0.7".winapi}"."winbase" = true; }
      { "${deps.tempfile."3.0.7".winapi}".default = true; }
    ];
  }) [
    (features_.cfg_if."${deps."tempfile"."3.0.7"."cfg_if"}" deps)
    (features_.rand."${deps."tempfile"."3.0.7"."rand"}" deps)
    (features_.remove_dir_all."${deps."tempfile"."3.0.7"."remove_dir_all"}" deps)
    (features_.redox_syscall."${deps."tempfile"."3.0.7"."redox_syscall"}" deps)
    (features_.libc."${deps."tempfile"."3.0.7"."libc"}" deps)
    (features_.winapi."${deps."tempfile"."3.0.7"."winapi"}" deps)
  ];


# end
# thread_local-0.3.6

  crates.thread_local."0.3.6" = deps: { features?(features_.thread_local."0.3.6" deps {}) }: buildRustCrate {
    crateName = "thread_local";
    version = "0.3.6";
    description = "Per-object thread-local storage";
    authors = [ "Amanieu d'Antras <amanieu@gmail.com>" ];
    sha256 = "02rksdwjmz2pw9bmgbb4c0bgkbq5z6nvg510sq1s6y2j1gam0c7i";
    dependencies = mapFeatures features ([
      (crates."lazy_static"."${deps."thread_local"."0.3.6"."lazy_static"}" deps)
    ]);
  };
  features_.thread_local."0.3.6" = deps: f: updateFeatures f (rec {
    lazy_static."${deps.thread_local."0.3.6".lazy_static}".default = true;
    thread_local."0.3.6".default = (f.thread_local."0.3.6".default or true);
  }) [
    (features_.lazy_static."${deps."thread_local"."0.3.6"."lazy_static"}" deps)
  ];


# end
# time-0.1.42

  crates.time."0.1.42" = deps: { features?(features_.time."0.1.42" deps {}) }: buildRustCrate {
    crateName = "time";
    version = "0.1.42";
    description = "Utilities for working with time-related functions in Rust.\n";
    authors = [ "The Rust Project Developers" ];
    sha256 = "1ny809kmdjwd4b478ipc33dz7q6nq7rxk766x8cnrg6zygcksmmx";
    dependencies = mapFeatures features ([
      (crates."libc"."${deps."time"."0.1.42"."libc"}" deps)
    ])
      ++ (if kernel == "redox" then mapFeatures features ([
      (crates."redox_syscall"."${deps."time"."0.1.42"."redox_syscall"}" deps)
    ]) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."time"."0.1.42"."winapi"}" deps)
    ]) else []);
  };
  features_.time."0.1.42" = deps: f: updateFeatures f (rec {
    libc."${deps.time."0.1.42".libc}".default = true;
    redox_syscall."${deps.time."0.1.42".redox_syscall}".default = true;
    time."0.1.42".default = (f.time."0.1.42".default or true);
    winapi = fold recursiveUpdate {} [
      { "${deps.time."0.1.42".winapi}"."minwinbase" = true; }
      { "${deps.time."0.1.42".winapi}"."minwindef" = true; }
      { "${deps.time."0.1.42".winapi}"."ntdef" = true; }
      { "${deps.time."0.1.42".winapi}"."profileapi" = true; }
      { "${deps.time."0.1.42".winapi}"."std" = true; }
      { "${deps.time."0.1.42".winapi}"."sysinfoapi" = true; }
      { "${deps.time."0.1.42".winapi}"."timezoneapi" = true; }
      { "${deps.time."0.1.42".winapi}".default = true; }
    ];
  }) [
    (features_.libc."${deps."time"."0.1.42"."libc"}" deps)
    (features_.redox_syscall."${deps."time"."0.1.42"."redox_syscall"}" deps)
    (features_.winapi."${deps."time"."0.1.42"."winapi"}" deps)
  ];


# end
# toml-0.2.1

  crates.toml."0.2.1" = deps: { features?(features_.toml."0.2.1" deps {}) }: buildRustCrate {
    crateName = "toml";
    version = "0.2.1";
    description = "A native Rust encoder and decoder of TOML-formatted files and streams. Provides\nimplementations of the standard Encodable/Decodable traits for TOML data to\nfacilitate deserializing and serializing Rust structures.\n";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "0p4rkaqhmk4fp6iqpxfgp3p98hxhbs2wmla3fq531n875h922yqs";
    dependencies = mapFeatures features ([
]);
  };
  features_.toml."0.2.1" = deps: f: updateFeatures f (rec {
    toml = fold recursiveUpdate {} [
      { "0.2.1"."rustc-serialize" =
        (f.toml."0.2.1"."rustc-serialize" or false) ||
        (f.toml."0.2.1".default or false) ||
        (toml."0.2.1"."default" or false); }
      { "0.2.1".default = (f.toml."0.2.1".default or true); }
    ];
  }) [];


# end
# typenum-1.10.0

  crates.typenum."1.10.0" = deps: { features?(features_.typenum."1.10.0" deps {}) }: buildRustCrate {
    crateName = "typenum";
    version = "1.10.0";
    description = "Typenum is a Rust library for type-level numbers evaluated at compile time. It currently supports bits, unsigned integers, and signed integers. It also provides a type-level array of type-level numbers, but its implementation is incomplete.";
    authors = [ "Paho Lurie-Gregg <paho@paholg.com>" "Andre Bogus <bogusandre@gmail.com>" ];
    sha256 = "1v2cgg0mlzkg5prs7swysckgk2ay6bpda8m83c2sn3z77dcsx3bc";
    build = "build/main.rs";
    features = mkFeatures (features."typenum"."1.10.0" or {});
  };
  features_.typenum."1.10.0" = deps: f: updateFeatures f (rec {
    typenum."1.10.0".default = (f.typenum."1.10.0".default or true);
  }) [];


# end
# ucd-util-0.1.3

  crates.ucd_util."0.1.3" = deps: { features?(features_.ucd_util."0.1.3" deps {}) }: buildRustCrate {
    crateName = "ucd-util";
    version = "0.1.3";
    description = "A small utility library for working with the Unicode character database.\n";
    authors = [ "Andrew Gallant <jamslam@gmail.com>" ];
    sha256 = "1n1qi3jywq5syq90z9qd8qzbn58pcjgv1sx4sdmipm4jf9zanz15";
  };
  features_.ucd_util."0.1.3" = deps: f: updateFeatures f (rec {
    ucd_util."0.1.3".default = (f.ucd_util."0.1.3".default or true);
  }) [];


# end
# unicode-segmentation-1.3.0

  crates.unicode_segmentation."1.3.0" = deps: { features?(features_.unicode_segmentation."1.3.0" deps {}) }: buildRustCrate {
    crateName = "unicode-segmentation";
    version = "1.3.0";
    description = "This crate provides Grapheme Cluster, Word and Sentence boundaries\naccording to Unicode Standard Annex #29 rules.\n";
    authors = [ "kwantam <kwantam@gmail.com>" ];
    sha256 = "0jnns99wpjjpqzdn9jiplsr003rr41i95c008jb4inccb3avypp0";
    features = mkFeatures (features."unicode_segmentation"."1.3.0" or {});
  };
  features_.unicode_segmentation."1.3.0" = deps: f: updateFeatures f (rec {
    unicode_segmentation."1.3.0".default = (f.unicode_segmentation."1.3.0".default or true);
  }) [];


# end
# unicode-width-0.1.5

  crates.unicode_width."0.1.5" = deps: { features?(features_.unicode_width."0.1.5" deps {}) }: buildRustCrate {
    crateName = "unicode-width";
    version = "0.1.5";
    description = "Determine displayed width of `char` and `str` types\naccording to Unicode Standard Annex #11 rules.\n";
    authors = [ "kwantam <kwantam@gmail.com>" ];
    sha256 = "0886lc2aymwgy0lhavwn6s48ik3c61ykzzd3za6prgnw51j7bi4w";
    features = mkFeatures (features."unicode_width"."0.1.5" or {});
  };
  features_.unicode_width."0.1.5" = deps: f: updateFeatures f (rec {
    unicode_width."0.1.5".default = (f.unicode_width."0.1.5".default or true);
  }) [];


# end
# unicode-xid-0.1.0

  crates.unicode_xid."0.1.0" = deps: { features?(features_.unicode_xid."0.1.0" deps {}) }: buildRustCrate {
    crateName = "unicode-xid";
    version = "0.1.0";
    description = "Determine whether characters have the XID_Start\nor XID_Continue properties according to\nUnicode Standard Annex #31.\n";
    authors = [ "erick.tryzelaar <erick.tryzelaar@gmail.com>" "kwantam <kwantam@gmail.com>" ];
    sha256 = "05wdmwlfzxhq3nhsxn6wx4q8dhxzzfb9szsz6wiw092m1rjj01zj";
    features = mkFeatures (features."unicode_xid"."0.1.0" or {});
  };
  features_.unicode_xid."0.1.0" = deps: f: updateFeatures f (rec {
    unicode_xid."0.1.0".default = (f.unicode_xid."0.1.0".default or true);
  }) [];


# end
# utf8-ranges-1.0.3

  crates.utf8_ranges."1.0.3" = deps: { features?(features_.utf8_ranges."1.0.3" deps {}) }: buildRustCrate {
    crateName = "utf8-ranges";
    version = "1.0.3";
    description = "Convert ranges of Unicode codepoints to UTF-8 byte ranges.";
    authors = [ "Andrew Gallant <jamslam@gmail.com>" ];
    sha256 = "0nkh73y241czrxagm77qz20qcfn3h54a6v9cpvc7wjzwkaaqkswp";
  };
  features_.utf8_ranges."1.0.3" = deps: f: updateFeatures f (rec {
    utf8_ranges."1.0.3".default = (f.utf8_ranges."1.0.3".default or true);
  }) [];


# end
# utf8parse-0.1.1

  crates.utf8parse."0.1.1" = deps: { features?(features_.utf8parse."0.1.1" deps {}) }: buildRustCrate {
    crateName = "utf8parse";
    version = "0.1.1";
    description = "Table-driven UTF-8 parser";
    authors = [ "Joe Wilm <joe@jwilm.com>" ];
    sha256 = "1qplgxcw9bjl48m4rlj7vk8i2qqjkj6dc7h3b88dxx1xpzx684v6";
  };
  features_.utf8parse."0.1.1" = deps: f: updateFeatures f (rec {
    utf8parse."0.1.1".default = (f.utf8parse."0.1.1".default or true);
  }) [];


# end
# uuid-0.7.4

  crates.uuid."0.7.4" = deps: { features?(features_.uuid."0.7.4" deps {}) }: buildRustCrate {
    crateName = "uuid";
    version = "0.7.4";
    description = "A library to generate and parse UUIDs.";
    authors = [ "Ashley Mannix<ashleymannix@live.com.au>" "Christopher Armstrong" "Dylan DPC<dylan.dpc@gmail.com>" "Hunar Roop Kahlon<hunar.roop@gmail.com>" ];
    sha256 = "1kzjah6i8vf51hrla6qnplymaqx2fadhhlnbvgivgld311lqyz9m";
    dependencies = mapFeatures features ([
    ]
      ++ (if features.uuid."0.7.4".rand or false then [ (crates.rand."${deps."uuid"."0.7.4".rand}" deps) ] else []))
      ++ (if kernel == "windows" then mapFeatures features ([
]) else []);
    features = mkFeatures (features."uuid"."0.7.4" or {});
  };
  features_.uuid."0.7.4" = deps: f: updateFeatures f (rec {
    rand = fold recursiveUpdate {} [
      { "${deps.uuid."0.7.4".rand}"."stdweb" =
        (f.rand."${deps.uuid."0.7.4".rand}"."stdweb" or false) ||
        (uuid."0.7.4"."stdweb" or false) ||
        (f."uuid"."0.7.4"."stdweb" or false); }
      { "${deps.uuid."0.7.4".rand}"."wasm-bindgen" =
        (f.rand."${deps.uuid."0.7.4".rand}"."wasm-bindgen" or false) ||
        (uuid."0.7.4"."wasm-bindgen" or false) ||
        (f."uuid"."0.7.4"."wasm-bindgen" or false); }
      { "${deps.uuid."0.7.4".rand}".default = true; }
    ];
    uuid = fold recursiveUpdate {} [
      { "0.7.4"."byteorder" =
        (f.uuid."0.7.4"."byteorder" or false) ||
        (f.uuid."0.7.4".u128 or false) ||
        (uuid."0.7.4"."u128" or false); }
      { "0.7.4"."md5" =
        (f.uuid."0.7.4"."md5" or false) ||
        (f.uuid."0.7.4".v3 or false) ||
        (uuid."0.7.4"."v3" or false); }
      { "0.7.4"."nightly" =
        (f.uuid."0.7.4"."nightly" or false) ||
        (f.uuid."0.7.4".const_fn or false) ||
        (uuid."0.7.4"."const_fn" or false); }
      { "0.7.4"."rand" =
        (f.uuid."0.7.4"."rand" or false) ||
        (f.uuid."0.7.4".v4 or false) ||
        (uuid."0.7.4"."v4" or false); }
      { "0.7.4"."sha1" =
        (f.uuid."0.7.4"."sha1" or false) ||
        (f.uuid."0.7.4".v5 or false) ||
        (uuid."0.7.4"."v5" or false); }
      { "0.7.4"."std" =
        (f.uuid."0.7.4"."std" or false) ||
        (f.uuid."0.7.4".default or false) ||
        (uuid."0.7.4"."default" or false); }
      { "0.7.4"."winapi" =
        (f.uuid."0.7.4"."winapi" or false) ||
        (f.uuid."0.7.4".guid or false) ||
        (uuid."0.7.4"."guid" or false); }
      { "0.7.4".default = (f.uuid."0.7.4".default or true); }
    ];
  }) [
    (features_.rand."${deps."uuid"."0.7.4"."rand"}" deps)
  ];


# end
# void-1.0.2

  crates.void."1.0.2" = deps: { features?(features_.void."1.0.2" deps {}) }: buildRustCrate {
    crateName = "void";
    version = "1.0.2";
    description = "The uninhabited void type for use in statically impossible cases.";
    authors = [ "Jonathan Reem <jonathan.reem@gmail.com>" ];
    sha256 = "0h1dm0dx8dhf56a83k68mijyxigqhizpskwxfdrs1drwv2cdclv3";
    features = mkFeatures (features."void"."1.0.2" or {});
  };
  features_.void."1.0.2" = deps: f: updateFeatures f (rec {
    void = fold recursiveUpdate {} [
      { "1.0.2"."std" =
        (f.void."1.0.2"."std" or false) ||
        (f.void."1.0.2".default or false) ||
        (void."1.0.2"."default" or false); }
      { "1.0.2".default = (f.void."1.0.2".default or true); }
    ];
  }) [];


# end
# winapi-0.3.7

  crates.winapi."0.3.7" = deps: { features?(features_.winapi."0.3.7" deps {}) }: buildRustCrate {
    crateName = "winapi";
    version = "0.3.7";
    description = "Raw FFI bindings for all of Windows API.";
    authors = [ "Peter Atashian <retep998@gmail.com>" ];
    sha256 = "1k51gfkp0zqw7nj07y443mscs46icmdhld442s2073niap0kkdr8";
    build = "build.rs";
    dependencies = (if kernel == "i686-pc-windows-gnu" then mapFeatures features ([
      (crates."winapi_i686_pc_windows_gnu"."${deps."winapi"."0.3.7"."winapi_i686_pc_windows_gnu"}" deps)
    ]) else [])
      ++ (if kernel == "x86_64-pc-windows-gnu" then mapFeatures features ([
      (crates."winapi_x86_64_pc_windows_gnu"."${deps."winapi"."0.3.7"."winapi_x86_64_pc_windows_gnu"}" deps)
    ]) else []);
    features = mkFeatures (features."winapi"."0.3.7" or {});
  };
  features_.winapi."0.3.7" = deps: f: updateFeatures f (rec {
    winapi = fold recursiveUpdate {} [
      { "0.3.7"."impl-debug" =
        (f.winapi."0.3.7"."impl-debug" or false) ||
        (f.winapi."0.3.7".debug or false) ||
        (winapi."0.3.7"."debug" or false); }
      { "0.3.7".default = (f.winapi."0.3.7".default or true); }
    ];
    winapi_i686_pc_windows_gnu."${deps.winapi."0.3.7".winapi_i686_pc_windows_gnu}".default = true;
    winapi_x86_64_pc_windows_gnu."${deps.winapi."0.3.7".winapi_x86_64_pc_windows_gnu}".default = true;
  }) [
    (features_.winapi_i686_pc_windows_gnu."${deps."winapi"."0.3.7"."winapi_i686_pc_windows_gnu"}" deps)
    (features_.winapi_x86_64_pc_windows_gnu."${deps."winapi"."0.3.7"."winapi_x86_64_pc_windows_gnu"}" deps)
  ];


# end
# winapi-i686-pc-windows-gnu-0.4.0

  crates.winapi_i686_pc_windows_gnu."0.4.0" = deps: { features?(features_.winapi_i686_pc_windows_gnu."0.4.0" deps {}) }: buildRustCrate {
    crateName = "winapi-i686-pc-windows-gnu";
    version = "0.4.0";
    description = "Import libraries for the i686-pc-windows-gnu target. Please don't use this crate directly, depend on winapi instead.";
    authors = [ "Peter Atashian <retep998@gmail.com>" ];
    sha256 = "05ihkij18r4gamjpxj4gra24514can762imjzlmak5wlzidplzrp";
    build = "build.rs";
  };
  features_.winapi_i686_pc_windows_gnu."0.4.0" = deps: f: updateFeatures f (rec {
    winapi_i686_pc_windows_gnu."0.4.0".default = (f.winapi_i686_pc_windows_gnu."0.4.0".default or true);
  }) [];


# end
# winapi-x86_64-pc-windows-gnu-0.4.0

  crates.winapi_x86_64_pc_windows_gnu."0.4.0" = deps: { features?(features_.winapi_x86_64_pc_windows_gnu."0.4.0" deps {}) }: buildRustCrate {
    crateName = "winapi-x86_64-pc-windows-gnu";
    version = "0.4.0";
    description = "Import libraries for the x86_64-pc-windows-gnu target. Please don't use this crate directly, depend on winapi instead.";
    authors = [ "Peter Atashian <retep998@gmail.com>" ];
    sha256 = "0n1ylmlsb8yg1v583i4xy0qmqg42275flvbc51hdqjjfjcl9vlbj";
    build = "build.rs";
  };
  features_.winapi_x86_64_pc_windows_gnu."0.4.0" = deps: f: updateFeatures f (rec {
    winapi_x86_64_pc_windows_gnu."0.4.0".default = (f.winapi_x86_64_pc_windows_gnu."0.4.0".default or true);
  }) [];


# end
# winconsole-0.10.0

  crates.winconsole."0.10.0" = deps: { features?(features_.winconsole."0.10.0" deps {}) }: buildRustCrate {
    crateName = "winconsole";
    version = "0.10.0";
    description = "A wrapper for console-related functions in the Windows API.";
    authors = [ "Omar M. <omarkmu@gmail.com>" ];
    sha256 = "1l477dbqblnajm4l7gydi7gjgfwb5g9kkpq15ynzyi7y5g4pq6cm";
    dependencies = mapFeatures features ([
      (crates."cgmath"."${deps."winconsole"."0.10.0"."cgmath"}" deps)
      (crates."lazy_static"."${deps."winconsole"."0.10.0"."lazy_static"}" deps)
      (crates."rgb"."${deps."winconsole"."0.10.0"."rgb"}" deps)
      (crates."winapi"."${deps."winconsole"."0.10.0"."winapi"}" deps)
    ]);
    features = mkFeatures (features."winconsole"."0.10.0" or {});
  };
  features_.winconsole."0.10.0" = deps: f: updateFeatures f (rec {
    cgmath."${deps.winconsole."0.10.0".cgmath}".default = true;
    lazy_static."${deps.winconsole."0.10.0".lazy_static}".default = true;
    rgb."${deps.winconsole."0.10.0".rgb}".default = true;
    winapi = fold recursiveUpdate {} [
      { "${deps.winconsole."0.10.0".winapi}"."consoleapi" = true; }
      { "${deps.winconsole."0.10.0".winapi}"."minwindef" = true; }
      { "${deps.winconsole."0.10.0".winapi}"."processenv" = true; }
      { "${deps.winconsole."0.10.0".winapi}"."utilapiset" = true; }
      { "${deps.winconsole."0.10.0".winapi}"."winbase" = true; }
      { "${deps.winconsole."0.10.0".winapi}"."wincon" = true; }
      { "${deps.winconsole."0.10.0".winapi}"."windef" = true; }
      { "${deps.winconsole."0.10.0".winapi}"."winnls" = true; }
      { "${deps.winconsole."0.10.0".winapi}"."winnt" = true; }
      { "${deps.winconsole."0.10.0".winapi}"."winuser" = true; }
      { "${deps.winconsole."0.10.0".winapi}".default = true; }
    ];
    winconsole."0.10.0".default = (f.winconsole."0.10.0".default or true);
  }) [
    (features_.cgmath."${deps."winconsole"."0.10.0"."cgmath"}" deps)
    (features_.lazy_static."${deps."winconsole"."0.10.0"."lazy_static"}" deps)
    (features_.rgb."${deps."winconsole"."0.10.0"."rgb"}" deps)
    (features_.winapi."${deps."winconsole"."0.10.0"."winapi"}" deps)
  ];


# end
# zmq-0.9.1

  crates.zmq."0.9.1" = deps: { features?(features_.zmq."0.9.1" deps {}) }: buildRustCrate {
    crateName = "zmq";
    version = "0.9.1";
    description = "High-level bindings to the zeromq library";
    authors = [ "a.rottmann@gmx.at" "erick.tryzelaar@gmail.com" ];
    edition = "2018";
    sha256 = "1g8i8kmsghavkf6hb99fmzjmy4cnr63rdlshcxdwhp7ihywf8i75";
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."bitflags"."${deps."zmq"."0.9.1"."bitflags"}" deps)
      (crates."libc"."${deps."zmq"."0.9.1"."libc"}" deps)
      (crates."log"."${deps."zmq"."0.9.1"."log"}" deps)
      (crates."zmq_sys"."${deps."zmq"."0.9.1"."zmq_sys"}" deps)
    ]);
    features = mkFeatures (features."zmq"."0.9.1" or {});
  };
  features_.zmq."0.9.1" = deps: f: updateFeatures f (rec {
    bitflags."${deps.zmq."0.9.1".bitflags}".default = true;
    libc."${deps.zmq."0.9.1".libc}".default = true;
    log."${deps.zmq."0.9.1".log}".default = true;
    zmq = fold recursiveUpdate {} [
      { "0.9.1"."zmq_has" =
        (f.zmq."0.9.1"."zmq_has" or false) ||
        (f.zmq."0.9.1".default or false) ||
        (zmq."0.9.1"."default" or false); }
      { "0.9.1".default = (f.zmq."0.9.1".default or true); }
    ];
    zmq_sys = fold recursiveUpdate {} [
      { "${deps.zmq."0.9.1".zmq_sys}"."vendored" =
        (f.zmq_sys."${deps.zmq."0.9.1".zmq_sys}"."vendored" or false) ||
        (zmq."0.9.1"."vendored" or false) ||
        (f."zmq"."0.9.1"."vendored" or false); }
      { "${deps.zmq."0.9.1".zmq_sys}".default = true; }
    ];
  }) [
    (features_.bitflags."${deps."zmq"."0.9.1"."bitflags"}" deps)
    (features_.libc."${deps."zmq"."0.9.1"."libc"}" deps)
    (features_.log."${deps."zmq"."0.9.1"."log"}" deps)
    (features_.zmq_sys."${deps."zmq"."0.9.1"."zmq_sys"}" deps)
  ];


# end
# zmq-sys-0.9.1

  crates.zmq_sys."0.9.1" = deps: { features?(features_.zmq_sys."0.9.1" deps {}) }: buildRustCrate {
    crateName = "zmq-sys";
    version = "0.9.1";
    description = "Low-level bindings to the zeromq library";
    authors = [ "a.rottmann@gmx.at" "erick.tryzelaar@gmail.com" ];
    sha256 = "0b3l02ag621ks5wbk9dma9y51jz420k2iy19d3rhjpb0qxq2yl6g";
    build = "build/main.rs";
    dependencies = mapFeatures features ([
      (crates."libc"."${deps."zmq_sys"."0.9.1"."libc"}" deps)
    ]);

    buildDependencies = mapFeatures features ([
      (crates."metadeps"."${deps."zmq_sys"."0.9.1"."metadeps"}" deps)
    ]);
    features = mkFeatures (features."zmq_sys"."0.9.1" or {});
  };
  features_.zmq_sys."0.9.1" = deps: f: updateFeatures f (rec {
    libc."${deps.zmq_sys."0.9.1".libc}".default = true;
    metadeps."${deps.zmq_sys."0.9.1".metadeps}".default = true;
    zmq_sys = fold recursiveUpdate {} [
      { "0.9.1"."zeromq-src" =
        (f.zmq_sys."0.9.1"."zeromq-src" or false) ||
        (f.zmq_sys."0.9.1".vendored or false) ||
        (zmq_sys."0.9.1"."vendored" or false); }
      { "0.9.1".default = (f.zmq_sys."0.9.1".default or true); }
    ];
  }) [
    (features_.libc."${deps."zmq_sys"."0.9.1"."libc"}" deps)
    (features_.metadeps."${deps."zmq_sys"."0.9.1"."metadeps"}" deps)
  ];


# end
}
