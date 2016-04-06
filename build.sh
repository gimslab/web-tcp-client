
VER=`cat app/package.json |grep version|sed 's/.*"version" : "\(.*\)".*$/\1/'`

echo version=$VER

#electron-packager ./app/ aptools-clinet --platform=linux --arch=x64
electron-packager ./app/ aptools-client --platform=all --arch=all

mkdir -p release
mv aptools-client-* release

cd release

zip -r aptools-client-darwin-x64-$VER.zip aptools-client-darwin-x64/ && rm -rf aptools-client-darwin-x64/
tar cfj aptools-client-linux-ia32-$VER.tar.bz2 aptools-client-linux-ia32/ && rm -rf aptools-client-linux-ia32/
tar cfj aptools-client-linux-x64-$VER.tar.bz2 aptools-client-linux-x64/ && rm -rf aptools-client-linux-x64/
zip -r aptools-client-win32-ia32-$VER.zip aptools-client-win32-ia32/ && rm -rf aptools-client-win32-ia32/
zip -r aptools-client-win32-x64-$VER.zip aptools-client-win32-x64/ && rm -rf aptools-client-win32-x64/
zip -r aptools-client-mas-x64-$VER.zip aptools-client-mas-x64/ && rm -rf aptools-client-mas-x64/
