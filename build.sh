#!/usr/bin/env sh

echo "Build JavaScript ..."
dart compile js src/whichlang.dart --no-source-maps -O2 -o dist/whichlang.js

echo "Removing old JS and CSS from book"
rm book/scripts/whichlang.js
rm book/whichlang.css

echo "Symlinking JS and CSS to book ..."
ln -f dist/whichlang.js book/scripts
ln -f src/whichlang.css book
