#!/bin/sh

#  create.sh
#
#  Created by Lukáš Vajda on 19.04.16.
#

PROJECT=SpeedcheckerSDK_ObjC
FRAMEWORK=SpeedcheckerSDK

FRAMEWORK_PATH=$FRAMEWORK.framework
MODULES_PATH=$FRAMEWORK_PATH/Modules/SpeedcheckerSDK.swiftmodule/

BUILD=/Users/lukasvajda/Library/Developer/Xcode/DerivedData/SpeedcheckerSDK_ObjC-bxkscscmxvrmspaixejuiidnadtw/Build/Products

# Clear
rm -Rf $BUILD
rm -f $FRAMEWORK_PATH.tar.gz

# Create build
xcodebuild archive -project $PROJECT.xcodeproj -scheme $FRAMEWORK -sdk iphoneos SYMROOT=$BUILD
xcodebuild build -project $PROJECT.xcodeproj -target $FRAMEWORK -sdk iphonesimulator SYMROOT=$BUILD

# Copy build
cp -RL $BUILD/Release-iphoneos $BUILD/Release-universal
cp -RL $BUILD/Release-iphonesimulator/$MODULES_PATH/* $BUILD/Release-universal/$MODULES_PATH

# Create framework
lipo -create $BUILD/Release-iphoneos/$FRAMEWORK_PATH/$FRAMEWORK $BUILD/Release-iphonesimulator/$FRAMEWORK_PATH/$FRAMEWORK -output $BUILD/Release-universal/$FRAMEWORK_PATH/$FRAMEWORK

# Archive framework
tar -czv -C $BUILD/Release-universal -f $PROJECT.framework.tar.gz $FRAMEWORK_PATH
