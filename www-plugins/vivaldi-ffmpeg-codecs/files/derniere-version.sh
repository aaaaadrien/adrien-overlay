#! /bin/bash
git rm *.deb
deb32=$(wget -O - -q http://ppa.launchpad.net/saiarcot895/chromium-beta/ubuntu/pool/main/c/chromium-browser/ | grep ffmpeg-extra | grep '16.04' | grep i386 | tail -1 | cut -d\" -f8)
deb64=$(wget -O - -q http://ppa.launchpad.net/saiarcot895/chromium-beta/ubuntu/pool/main/c/chromium-browser/ | grep ffmpeg-extra | grep '16.04' | grep amd64 | tail -1 | cut -d\" -f8)
wget http://ppa.launchpad.net/saiarcot895/chromium-beta/ubuntu/pool/main/c/chromium-browser/$deb32
wget http://ppa.launchpad.net/saiarcot895/chromium-beta/ubuntu/pool/main/c/chromium-browser/$deb64
