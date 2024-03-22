---
title: Binding the repository
language: en
---

At first, download public key [poretsky.gpg](repo/poretsky.gpg) that
will be used for my signature verification and add it to the list of
Apt keys by command:

```bash
$ sudo apt-key add poretsky.gpg
```

Or place it in `/etc/apt/trusted.gpg.d` directory that is the
preferred way in modern releases.

Then choose and download an `accessibility.list` file appropriate for
your distribution:

{% include sources-lists.md %}

Place this file in `/etc/apt/sources.list.d` directory or simply copy
its content into your `/etc/apt/sources.list` file.

It is strongly recommended to make Apt prefer this repository to
prevent occasional installation of incompatible versions of some
packages from other sources. For this purpose download file
[accessibility.pref](files/accessibility.pref) and place it in
`/etc/apt/preferences.d` directory.
