# adrien-overlay

## Install

### With "simple" portage :

Make sure /etc/portage/repos.conf directory exists and git installed.

*curl https://raw.githubusercontent.com/aaaaadrien/adrien-overlay/master/repo.conf -o /etc/portage/repos.conf/adrien-overlay.conf*

### With Layman

*curl https://github.com/aaaaadrien/adrien-overlay/blob/master/repositories.xml -o /etc/layman/overlays/adrien-overlay.xml*

*layman -S*

*layman -a adrien-overlay*
