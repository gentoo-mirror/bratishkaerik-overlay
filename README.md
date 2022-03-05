# bratishkaerik-overlay

My Gentoo repository

# How to add

```
emerge -a app-eselect/eselect-repository dev-vcs/git
eselect repository enable bratishkaerik-overlay
emaint sync -r bratishkaerik-overlay
```

# What's inside the repository?
## Popura ポプラ: alternative Yggdrasil network client
* Homepage: https://github.com/popura-network/Popura/
* Created + live ebuild
## Piper: GTK configuration application for libratbag
* Homepage: https://github.com/libratbag/piper
* Updated
## Mycorrhiza: git-based wiki engine written in Go using mycomarkup
* Homepage: https://mycorrhiza.wiki
* Created + live ebuild + binary package (from upstream)
## Gyro: A Zig package manager with an index, build runner, and build dependencies.
* Homepage: https://astrolabe.pm/
* Created (live ebuild)
## zigmod: A package manager for the Zig programming language.
* Homepage: https://aquila.red/
* Created (live ebuild)
## zls: Zig LSP implementation + Zig Language Server
* Homepage: https://github.com/zigtools/zls
* Created (live ebuild)
