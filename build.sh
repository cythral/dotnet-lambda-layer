#!/bin/sh
mkdir bin
dotnet-install.sh --jsonfile global.json --install-dir bin
cp bootstrap bin
chmod +x bin/bootstrap

