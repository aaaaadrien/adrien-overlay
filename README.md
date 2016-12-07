# adrien-overlay

## Install

### With "simple" portage :

Make sure /etc/portage/repos.conf directory exists and git installed.

*curl https://raw.githubusercontent.com/aaaaadrien/adrien-overlay/master/repo.conf -o /etc/portage/repos.conf/adrien-overlay.conf*

### With Layman

*layman -o https://raw.githubusercontent.com/aaaaadrien/adrien-overlay/master/repositories.xml -f -a adrien-overlay*
