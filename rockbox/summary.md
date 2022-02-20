---
title: Summary of the Rockbox enhancements against an official version
language: en
---

The following fixes and improvements are implemented in this
[Rockbox builds](index.md#anchor1)
against their official counterparts:

- [Extended alarm functionality](features.md#anchor2).
- A little sound quality improvement on some players.
- Eliminated bookmark conflict with file names containing semicolon.
- Enabled playback control in hold mode for **Cowon D2** players.
- Extended WPS hotkey functionality. Now it can be used for
  [getting some information by voice](features.md#anchor1).
- Saving pitch and speed settings on playback stop and restore them
  on resume.
- [Using talk clips for radio station names](features.md#anchor3).
- Added setting to enable/disable lineout on **Sansa Fuze V2**.
- Adjustable delay before button repeat is implemented.
- Sleep timer now pauses playback instead of shutting down player.
- Eliminated **Debug menu**.
- Enlarged memory space for file and radio station names.
- Added an option to swap audio channels.
- When shortcut is created for a file or folder an appropriate action
  is assigned to it rather than merely pointing file browser:
  - a folder is entered;
  - a file is executed according to it's type.
- more general pronunciation style for numeric values that better
  fits various languages.
- Added an option in the files view settings that allows to choose
  between two sort orders: directories first (default) and files
  first. This option is also respected when directory changes during
  playback. Thus, playback order is now completely consistent with
  the file browser sorting options.
- Separate option for list edges beep control.

See [full list of applied patches](patches.md)
and [some additional features explanation](features.md)
for further details.
