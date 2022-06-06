# bratishkaerik-overlay

My Gentoo repository

# How to add

```sh
emerge -a app-eselect/eselect-repository dev-vcs/git
eselect repository enable bratishkaerik-overlay
emaint sync -r bratishkaerik-overlay
```

# What's inside the repository?
## Gyro: A Zig package manager with an index, build runner, and build dependencies
* Package: `dev-util/gyro`
* Homepage: https://astrolabe.pm/
* Created (live ebuild)
## Mycorrhiza: Git-based wiki engine written in Go using mycomarkup
* Package: `www-apps/mycorrhiza` and `www-apps/mycorrhiza-bin`
* Homepage: https://mycorrhiza.wiki
* Created + live ebuild + binary package (from upstream)
## pacman.zig: Simple Pacman clone written in Zig
* Package: `games-arcade/pacman_zig`
* Homepage: https://github.com/floooh/pacman.zig
* Created (live ebuild)
## TigerBeetle: A distributed financial accounting database
* Package: `dev-db/tigerbeetle`
* Homepage: https://www.tigerbeetle.com/
* Created (live ebuild)
## zigmod: A package manager for the Zig programming language.
* Package: `dev-util/zigmod`
* Homepage: https://aquila.red/
* Created (live ebuild)
## zigup: Download and manage zig compilers
* Package: `dev-util/zigup`
* Homepage: https://github.com/marler8997/zigup
* Created (live ebuild)
## zls: Zig LSP implementation + Zig Language Server
* Package: `dev-util/zls`
* Homepage: https://github.com/zigtools/zls
* Created (live ebuild)
