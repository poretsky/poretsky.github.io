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
mirroring, get it [here](https://github.com/poretsky/ppa) or visit
[my PPA on Launchpad](https://launchpad.net/~poretsky/+archive/ubuntu/a11y),
but to make use of these packages it is enough to accomplish following
simple steps:

- Register the repository as a source of packages according to the
  instructions suitable for your distribution:
  - [Ubuntu 16.04 (Xenial Xerus) or later LTS releases](binding-lp.md)
  - [Debian or older Ubuntu LTS releases](binding-repo.md)

- Update Apt package indices by command:

```bash
$ sudo apt-get update
```

After that you can use your preferred method to manage packages from
this repository. For example, you can install and update them by
`apt-get install` command.

Thus, to fire up the environment initially do the following:

```bash
$ sudo apt-get install multispeech mbrola mbrola-en1 freephone ru-tts emacspeak
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
