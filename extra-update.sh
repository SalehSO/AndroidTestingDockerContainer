#!/bin/bash
# based on android-sdk-update.sh from father image

echo "Installing extra packages"
while read p; do
  /opt/tools/android-accept-licenses.sh "sdkmanager ${SDKMNGR_OPTS} ${p}"
done < /opt/tools/extra-package-list.txt

echo "Updating SDK"
# Based on update_sdk() in father image in android-env.sh
/opt/tools/android-accept-licenses.sh "sdkmanager ${SDKMNGR_OPTS} --update"


echo "Accepting Licenses"
/opt/tools/android-accept-licenses.sh "sdkmanager ${SDKMNGR_OPTS} --licenses"
