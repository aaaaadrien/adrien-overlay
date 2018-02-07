#! /bin/bash
wget -O - -q http://ppa.launchpad.net/saiarcot895/chromium-beta/ubuntu/pool/main/c/chromium-browser/ | grep ffmpeg-extra | grep '16.04' | tail -1 | cut -d\" -f8
