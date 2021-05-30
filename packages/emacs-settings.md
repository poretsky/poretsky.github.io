---
title: Additional Emacs settings
---

# {{ page.title }}

[This page in Russian](emacs-settings-ru.md)

The following options are set up globally in
[/etc/emacs/site-start.d/80site-defaults.el](files/80site-defaults.el):

- Enabled automatic saving position in all visited files;
- Enabled transparent viewing and editing compressed files;
- Transient mark mode is turned on;
- Search highlighting is turned on;
- Disabled automatic backup files creation;
- Suppressed question about saving modifications when starting
  compilation (all changes are saved automatically);
- Specified "make -ks " as a default compilation command;
- Current time displaying in the mode line is turned on;
- Suppressed startup message;
- Disabled adding new lines to a buffer when moving down by arrow;
- Allowed automatic highlighting of matching parenthesis;
- Mouse pointer is moved out of the way when typing;
- Enabled editing restriction to a region;
- Enabled region case conversion commands;
- Disabled using tab by default when indenting;
- Font lock mode is turned on;
- Auto fill mode is turned on for text buffers;
- Enabled Emacspeak auditory icons;
- Loaded cyrillic support;
- Loaded file manager extensions.
