#!/bin/bash
# Script to generate Firebase configuration files for different environments/flavors
 
if [[ $# -eq 0 ]]; then
  echo "Error: No environment specified. Use 'dev' or 'stg'."
  exit 1
fi
 
case $1 in
  dev)
    flutterfire config \
      --project=geiger-toolbox-dev \
      --out=lib/firebase_options_dev.dart \
      --ios-bundle-id=com.cybergeiger.toolbox.dev \
      --ios-out=ios/flavors/dev/GoogleService-Info.plist \
      --android-package-name=com.cybergeiger.toolbox.dev \
      --android-out=android/app/src/dev/google-services.json
    ;;
  stg)
    flutterfire config \
      --project=geiger-toolbox-stg \
      --out=lib/firebase_options_stg.dart \
      --ios-bundle-id=com.cybergeiger.toolbox.stg \
      --ios-out=ios/flavors/stg/GoogleService-Info.plist \
      --android-package-name=com.cybergeiger.toolbox.stg \
      --android-out=android/app/src/stg/google-services.json
    ;;

   prod)
    flutterfire config \
      --project=geiger-toolbox-prod \
      --out=lib/firebase_options_prod.dart \
      --ios-bundle-id=com.cybergeiger.toolbox \
      --ios-out=ios/flavors/prod/GoogleService-Info.plist \
      --android-package-name=com.cybergeiger.toolbox \
      --android-out=android/app/src/prod/google-services.json
    ;;
 
  *)
    echo "Error: Invalid environment specified. Use 'dev' or 'stg'. or 'prod'. "
    exit 1
    ;;
esac