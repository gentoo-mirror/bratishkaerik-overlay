# bratishkaerik-overlay

My Gentoo repository

# How to add this overlay
## Via eselect-repo
```sh
$ doas eselect repository enable bratishkaerik-overlay
```

## Via layman
```sh
$ doas layman -a bratishkaerik-overlay
```

## Manually
```sh
$ doas cat >> /etc/portage/repos.conf/bratishkaerik-overlay.conf << "EOF"

[bratishkaerik-overlay]
location = /var/db/repos/bratishkaerik-overlay
sync-type = git
sync-uri = https://codeberg.org/BratishkaErik/bratishkaerik-overlay.git

EOF
```

## Syncing this repository
```sh
$ doas emaint sync -r bratishkaerik-overlay
```

# What's inside the repository?
## `dev-util/gyro`: A Zig package manager with an index, build runner, and build dependencies
* Homepage: https://astrolabe.pm/
* Created (live ebuild)
## `www-apps/mycorrhiza`: Git-based wiki engine written in Go using mycomarkup
* Homepage: https://mycorrhiza.wiki
* Created + live ebuild + binary package `www-apps/mycorrhiza-bin` (from upstream)
## `games-arcade/pacman_zig`: Simple Pacman clone written in Zig
* Homepage: https://github.com/floooh/pacman.zig
* Created (live ebuild)
## `dev-db/tigerbeetle`: A distributed financial accounting database
* Homepage: https://www.tigerbeetle.com/
* Created (live ebuild)
## `dev-util/zigmod`: A package manager for the Zig programming language.
* Homepage: https://aquila.red/
* Created (live ebuild)
## `dev-util/zigup`: Download and manage zig compilers
* Homepage: https://github.com/marler8997/zigup
* Created (live ebuild)
## `dev-util/zls`: Zig LSP implementation + Zig Language Server
* Homepage: https://github.com/zigtools/zls
* Created (live ebuild)
