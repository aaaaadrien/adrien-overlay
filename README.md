# adrien-overlay

## Install

### With "simple" portage :

Make sure /etc/portage/repos.conf directory exists and git installed.

*curl https://raw.githubusercontent.com/aaaaadrien/adrien-overlay/master/repo.conf -o /etc/portage/repos.conf/adrien-overlay.conf*

### With eselect repository : (Calculate Linux way)

Make sure /etc/portage/repos.conf directory exists and git installed.

*eselect repository add adrien-overlay git https://github.com/aaaaadrien/adrien-overlay.git

### With Layman

*curl https://raw.githubusercontent.com/aaaaadrien/adrien-overlay/master/repositories.xml -o /etc/layman/overlays/adrien-overlay.xml*

*layman -S*

*layman -a adrien-overlay*

## Note for Calculate Linux

To enable updates from my overlay, set to ON the cl_update_other_set with

*cl-core-variables --set update.cl_update_other_set=on*
