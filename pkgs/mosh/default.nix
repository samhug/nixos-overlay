{ mosh
}:

mosh.overrideAttrs (attrs: {
  name = attrs.name + "-fix";
  patches = attrs.patches ++ [

    # Add <esc>-^L for local repaint, fix minor escape-key bugs
    # Based on https://github.com/mobile-shell/mosh/pull/522
    ./esc-key-fix.patch
  ];
})
