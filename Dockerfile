FROM ubuntu:18.04
   
# Prerequisites
RUN apt-get update 
RUN apt-get install -y curl git unzip xz-utils wget zip gdb libglu1-mesa openjdk-8-jdk libgconf-2-4 libstdc++6 fonts-droid-fallback lib32stdc++6 python3  
RUN apt-get clean
   
# Set up new user
RUN useradd -ms /bin/bash developer
USER developer
WORKDIR /home/developer
   
# Prepare Android directories and system variables
RUN mkdir -p Android/sdk
ENV ANDROID_SDK_ROOT /home/developer/Android/sdk
RUN mkdir -p .android && touch .android/repositories.cfg
   
# Set up Android SDK
RUN wget -O sdk-tools.zip https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip
RUN unzip sdk-tools.zip && rm sdk-tools.zip
RUN mv tools Android/sdk/tools
RUN cd Android/sdk/tools/bin && yes | ./sdkmanager --licenses
RUN cd Android/sdk/tools/bin && ./sdkmanager "build-tools;29.0.2" "patcher;v4" "platform-tools" "platforms;android-29" "sources;android-29"
ENV PATH "$PATH:/home/developer/Android/sdk/platform-tools"

# Download Flutter SDK
RUN git clone https://github.com/flutter/flutter.git
ENV PATH "$PATH:/home/developer/flutter/bin:/home/developer/flutter/bin/cache/dart-sdk/bin"
   
# Run basic check to download Dark SDK
RUN flutter doctor

# Enable flutter web
RUN flutter channel master
RUN flutter upgrade
RUN flutter config --enable-web
