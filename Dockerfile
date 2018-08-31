FROM runmymind/docker-android-sdk:latest

ENV PATH="/opt/android-sdk-linux/tools/bin:${PATH}"
ENV PATH="/opt/android-sdk-linux/emulator:${PATH}"
ENV PATH="/opt/android-sdk-linux/platform-tools:${PATH}"

COPY extra-update.sh /opt/tools/extra-update.sh

COPY extra-package-list.txt /opt/tools/extra-package-list.txt

RUN /opt/tools/extra-update.sh

CMD /opt/tools/extra-update.sh
