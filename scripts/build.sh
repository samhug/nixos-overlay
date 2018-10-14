#!/bin/sh

dir_index() {
  listed_files=$1/*
  index_file=$1/index.html
  echo "<!doctype html>" >> $index_file
  echo "<html>" >> $index_file
  echo "<head>" >> $index_file
  echo "<meta charset=\"utf-8\">" >> $index_file
  echo "<title>nixos-overlay</title>" >> $index_file
  echo "</head>" >> $index_file
  echo "<body>" >> $index_file
  echo "<h1>nixos-overlay</h1>" >> $index_file
  echo "<p>Released on $(date --iso-8601=seconds) from <a href=\"https://github.com/samuelhug/nixos-overlay/commit/$TRAVIS_COMMIT\">Git commit $TRAVIS_COMMIT</a> via <a href=\"https://travis-ci.org/samuelhug/nixos-overlay/builds/$TRAVIS_BUILD_ID\">Travis build $TRAVIS_BUILD_ID</a>.</p>" >> $index_file
  echo "<table>" >> $index_file
  echo "<tr><th>File name</th><th>Size</th><th>SHA-256 hash</th></tr>" >> $index_file
  for file in $listed_files; do
    name=$(basename $file)
    size=$(stat --format=%s "$file")
    hash=$(sha256sum "$file" | awk '{print $1}')
    echo "<tr><th><a href=\"$name\">$name</a></th><th>$size</th><th>$hash</th></tr>" >> $index_file
  done
  echo "</table>" >> $index_file
  echo "</body>" >> $index_file
  echo "</html>" >> $index_file
}

mkdir -p $OUTDIR
tar --exclude $OUTDIR -Jcf "$OUTDIR/nixexprs.tar.xz" \
  --owner=0 --group=0 --mtime="1970-01-01 00:00:00 UTC" \
  -C .. $(basename $PWD)
echo $TRAVIS_COMMIT > $OUTDIR/git-revision
dir_index $OUTDIR
