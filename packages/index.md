---
title: Accessibility packages for Emacspeak environment
description: Package repositories for Debian and Ubuntu containing accessibility related software, such as enhanced and fixed version of Emacspeak, multilingual speech server, speech synthesizers and others.
keywords: accessibility,multilingual speech server,Multispeech,Emacspeak,Ubuntu,Debian
language: en
---

These repositories contain complete set of packages to make up ready
to use [Emacspeak](https://github.com/tvraman/emacspeak) environment
with multilingual speech support. It includes up to date version of
Emacspeak itself additionally enhanced and fixed by me,
[multilingual speech server](https://github.com/poretsky/multispeech)
that supports Russian, English, German, French, Italian, Spanish and
Portuguese languages and can automatically switch language on the fly
by context, software speech synthesizers and some other more or less
related stuff. Of course, here are only those packages that are not
included in the official system distribution or are represented there
by an old or somewhat inconsistent version.


## Quick start

If you are interested in the repository itself for browsing or
mirroring, get it [here](https://github.com/poretsky/ppa), but
to make use of these packages it is enough to accomplish following
simple steps:

- Download public key [poretsky.gpg](repo/poretsky.gpg) that will be
  used for my signature verification;

- Add it to the list of keys used by Apt by command:

```bash
$ sudo apt-key add poretsky.gpg
```

- Choose and download an `accessibility.list` file appropriate for
  your distribution:
  - [Ubuntu 8.04 LTS (Hardy Heron)](files/hardy/accessibility.list)
  - [Ubuntu 10.04 LTS (Lucid Lynx)](files/lucid/accessibility.list)
  - [Ubuntu 12.04 (Precise Pangolin)](files/precise/accessibility.list)
  - [Ubuntu 14.04 (Trusty Tahr)](files/trusty/accessibility.list)
  - [Ubuntu 16.04 (Xenial Xerus)](files/xenial/accessibility.list)
  - [Ubuntu 18.04 LTS (Bionic Beaver)](files/bionic/accessibility.list)
  - [Ubuntu 20.04 LTS (Focal Fossa)](files/focal/accessibility.list)
  - [Debian 6.0 (Squeeze)](files/squeeze/accessibility.list)
  - [Debian 7.0 (Wheezy)](files/wheezy/accessibility.list)
  - [Debian 8.0 (Jessie)](files/jessie/accessibility.list)
  - [Debian 9.0 (Stretch)](files/stretch/accessibility.list)
  - [Debian 10.0 (Buster)](files/buster/accessibility.list)

- Place this file in `/etc/apt/sources.list.d` directory or simply copy
  its content into your `/etc/apt/sources.list` file;

- Update Apt package indices by command:

```bash
$ sudo apt-get update
```

- It is strongly recommended to make Apt prefer this repository to
  prevent occasional installation of incompatible versions of some
  packages from other sources. For this purpose download file
  [accessibility.pref](files/accessibility.pref) and place it in
  `/etc/apt/preferences.d` directory.

After that you can use your preferred method to manage packages from
this repository. For example, you can install and update them by
`apt-get install` command.

Thus, to fire up the environment initially do the following:

```bash
$ sudo apt-get install multispeech mbrola mbrola-en1 freephone enlex ru-tts rulex emacspeak
```

Of course, Emacs is assumed to be installed already or it will be
pulled in by dependencies. If Gnome accessibility environment based on
Orca screen reader is used as well, then it is strongly recommended to
choose non-gtk version of Emacs to avoid possible conflicts. Search
Emacs packages with `-lucid` suffix.

When Emacspeak is installed for the first time it prompts to choose
speech server. If you wish to use Multispeech, but install Emacspeak
previously, and, therefore, Multispeech is not listed in the choice,
don't bother: choose anyone, and then, after installing Multispeech,
return to this step by issuing the command:

```bash
$ sudo dpkg-reconfigure emacspeak
```

See documentation provided along with the packages.


## Additional configuration files

Additionally you may download these files and place them into
`/etc/emacs/site-start.d` directory to make your life yet a bit easier.

- [80keybindings.el](files/80keybindings.el) -- [Keyboard shortcuts](emacs-keybindings.md)
  for some useful Emacs functions
- [80site-defaults.el](files/80site-defaults.el) -- Some convenient
  [Emacs settings](emacs-settings.md)
