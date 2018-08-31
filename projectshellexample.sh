#!/bin/bash
# takes into consideration the project has been shared as a volume through the /repo/ directory
# example call: docker run --privileged  -it -v /path/to/project:/repo so/androidtestingst sh /repo/projectshellexample.sh
adb start-server

# this is to get the keys accepted by the emulator.
cd /opt/android-sdk-linux/
cp /root/.android/adbkey .android/adbkey
cp /root/.android/adbkey.pub .android/adbkey.pub

echo "no" | avdmanager create avd -f -n testAVD -k 'system-images;android-27;google_apis_playstore;x86'
avdmanager list avd

echo "Starting Emulator"
emulator -avd testAVD -no-audio -no-window &
adb wait-for-device

cd /repo/
echo "Starting build"
./gradlew connectedEmrapDebugAndroidTest

echo "wooot woot"
