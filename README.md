# bratishkaerik-overlay #

My Gentoo repository.

# How to add this overlay #

## Via `eselect-repo` ##
```console
$ doas eselect repository enable bratishkaerik-overlay
```

## Manually ##
```console
$ doas >> /etc/portage/repos.conf/bratishkaerik-overlay.conf << _EOF_

[bratishkaerik-overlay]
location = /var/db/repos/bratishkaerik-overlay
sync-type = git
sync-uri = https://git.sr.ht/~bratishkaerik/bratishkaerik-overlay

_EOF_
```

## Syncing this repository ##
```console
$ doas emaint sync -r bratishkaerik-overlay
```
