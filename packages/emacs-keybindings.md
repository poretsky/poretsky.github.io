---
title: Additional Emacs key bindings
---

# {{ page.title }}

[This page in Russian](emacs-keybindings-ru.md)

The following global key bindings are defined in
[/etc/emacs/site-start.d/80keybindings.el](files/80keybindings.el):

- `HOME` -- go to the beginning of line;
- `END` -- go to the end of line;
- `ESC HOME` -- go to the beginning of buffer;
- `ESC END` -- go to the end of buffer;
- `C-x g` -- go to a line by number;
- `F1` -- help [^1];
- `F2` -- save current buffer into a file;
- `F3` -- open a file (for editing) or directory (enter file manager);
- `F4` -- switch buffer;
- `F5` -- maximize current window (delete all other windows) [^2];
- `F6` -- delete current window [^2];
- `F7` -- search by grep;
- `F8` -- kill buffer;
- `F9` -- compile [^3];
- `F11` -- BBDB address book [^4];
- `F12` -- switch to another window [^2];
- `SHIFT-F3` -- embedded mail and news client Gnus;
- `SHIFT-F4` -- inferior shell;
- `SHIFT-F5` -- search a word in dictionaries [^5];
- `SHIFT-F6` -- web browser W3m [^6];
- `SHIFT-F7` -- search files containing specified regular expression in
  a directory tree;
- `SHIFT-F8` -- start Emacs server;
- `ESC F3` -- submit a Debian bug report [^7];
- `ESC F4` -- information about specified Debian package [^7];
- `ESC F5` -- search Debian packages by regular expression [^7];
- `ESC F7` -- search files by name pattern in a directory tree.

----

[^1]: Usually can be used instead of `C-h` prefix in the native keyboard shortcuts.

[^2]: Of course, here we are talking about Emacs windows inside current frame.

[^3]: Usually by running `make`, but any other command may be specified as well.

[^4]: Install `bbdb` package to make use of it.

[^5]: Install `dictionary-el` package to make use of it.

[^6]: Install `w3m-el` or `w3m-el-snapshot` package to make use of it.

[^7]: Install `debian-el` package to make use of it.
