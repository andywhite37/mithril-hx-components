#!/bin/sh
set -e
cd doc
haxe build_doc.hxml || { cd ..; echo "build_doc failed"; exit 1; }
cd ..
rm mithril-hx-components.zip
zip -r mithril-hx-components.zip hxml src doc/ImportCore.hx test extraParams.hxml haxelib.json LICENSE README.md
haxelib submit mithril-hx-components.zip
