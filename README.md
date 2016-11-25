# adrien-overlay

## Install

vi /etc/portage/repos.conf/adrien.conf

[adrien-overlay]
location = /usr/local/overlay/adrien-overlay
sync-type = git
sync-uri = https://github.com/aaaaadrien/adrien-overlay.git
auto-sync = yes


mkdir -p /usr/local/overlay/adrien-overlay
