#!/bin/sh
mkdir bin
dotnet-install.sh --jsonfile global.json --install-dir bin
rm -rf bin/templates bin/sdk

cp bootstrap bin
chmod +x bin/bootstrap

