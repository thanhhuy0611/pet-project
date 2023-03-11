#!/bin/bash#

flutter_clean() {
  fvm flutter clean;
  fvm flutter pub get;
  fvm flutter pub upgrade;
}

flutter_generate() {
  fvm flutter pub run build_runner build;
}

flutter_generate_delete_conflicting() {
  fvm flutter pub run build_runner build --delete-conflicting-outputs;
}

build_iOS() {
  pod repo update;
  rm ios/Podfile.lock;
  pod install --project-directory=ios;
  flutter build ios --no-codesign;
}

echo "select the option to build ************"
echo "  1) android"
echo "  2) ios"
echo "  3) run build_runner"
echo "  4) run build_runner with delete conflicting"


read n
case $n in
  1) echo "android is building...";
     flutter_clean;
     flutter_generate_delete_conflicting;
     flutter build apk;
     echo "android build finished";;
  2) echo "ios is building...";
     flutter_clean;
     flutter_generate_delete_conflicting;
     build_iOS;
     echo "ios build finished";;
  3) echo "starting build_runner...";
     flutter_generate;
     echo "build_runner finished";;
  4) echo "generating...";
     flutter_generate_delete_conflicting;
     echo "build_runner finished";;

esac