#!/bin/sh
mkdir bin
dotnet-install.sh --jsonfile global.json --install-dir bin
rm -rf bin/templates bin/sdk bin/shared/Microsoft.AspNetCore.App bin/packs/Microsoft.AspNetCore.App.Ref
rm -rf 

cp bootstrap bin
chmod +x bin/bootstrap

