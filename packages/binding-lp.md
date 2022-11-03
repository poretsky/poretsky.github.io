---
title: Binding the repository
language: en
---

To add this repository automagically issue the following command:

```bash
$ sudo add-apt-repository ppa:poretsky/a11y
```

Or follow the instructions on the
[PPA page](https://launchpad.net/~poretsky/+archive/ubuntu/a11y).

It is strongly recommended to make Apt prefer this repository to
prevent occasional installation of incompatible versions of some
packages from other sources. For this purpose download file
[accessibility-ppa.pref](files/accessibility-ppa.pref) and place it in
`/etc/apt/preferences.d` directory.
