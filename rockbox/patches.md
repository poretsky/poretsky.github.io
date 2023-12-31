---
title: Rockbox patches
language: en
---

{% assign tracker="http://www.rockbox.org/tracker" %}

Following patches are taken from the
[Rockbox patch tracking system]({{ tracker }}/index.php?type=4):

- [FS#12191]({{ tracker }}/task/12191) -- Higher quality audio hw
  settings for AS3515 [^1];
- [FS#11388]({{ tracker }}/task/11388) -- Bookmark file doesn't work
  for a directory with a semicolon in its name [^3];
- [FS#11541]({{ tracker }}/task/11541) -- Add Voice Announcement of
  Summary Info to WPS hotkey [^2],
  see [here](features.md#anchor1) for usage details;
- [FS#11619]({{ tracker }}/task/11619) -- Restore pitch and speed
  settings on resume; 
- [FS#7779]({{ tracker }}/task/7779) -- FM Radio Jingle support + talk
  frequencies if talk_menus is enabled [^4],
  see [here](features.md#anchor3) for additional explanations;
- [FS#10698]({{ tracker }}/task/10698) -- Playback control in hold
  mode for Cowon D2;
- [FS#12074]({{ tracker }}/task/12074) -- Add setting to
  enable/disable lineout on Sansa Fuze V2 [^5];
- [FS#12779]({{ tracker }}/task/12779) -- This patch reworks the sleep
  timer a little bit and fixes a small bug [^6];
- [FS#9356]({{ tracker }}/task/9356) -- Allow to set the delay before
  button repeat is activated [^2].

Following changes are made in addition by my own patches:

- General fixes of string resources;
- Complete Russian translations;
- Shrinked viewers list suggested for a selected file in context
  menu just as in
  [FS#9043]({{ tracker }}/task/9043);
- Implemented alarm timer that allows one to program how long the device
  should stay active after waking up, thus, now it can be used for
  making automatic scheduled recording of radio programs, for
  instance, see [here](features.md#anchor2) for usage explanation;
- Enlarged memory space for FM presets to keep unicode strings;
- Added an option to swap playback channels;
- More extensive keypress filtering;
- Proper shortcut actions assignment for files and folders;
- Increased buffer size for file path;
- Decreased overall stack consumption;
- Corrected run time prediction for the AMSv2 devices;
- Prevented sound cut-off on the audio init stage;
- Fixed FM tuner mode setting in the outer context menu;
- More general pronunciation style for numeric values to fit various
  languages;
- Files and directories sorting enhancement;
- Date and time format unification;
- Eliminated debug menu that has no sense for regular use;
- Disabled hotkey for Sony NWZ-E370/E380 targets since actually it is
  not in use;
- Don't reload directory if it is actually not changed;
- Separate option for list edges beep control;
- Proper browsing restrictions when choosing a plugin for WPS
  context.

Full sources are available
[here](https://github.com/poretsky/rockbox/tree/r{{ site.data.rockbox.version }}).

----

[^1]: Clipv1, Fuzev1, m200v4, c200v2 and e200v2. The second patch, which only includes "Not set AUDIOSET3_IBR_HPH" as recommended by the data sheet for 16Ohm loads.

[^2]: Fixed by me.

[^3]:Improved by me in such a way that old style bookmarks remain acceptable.

[^4]: Revised and enhanced by me.

[^5]: By default sound goes to the headphone.

[^6]: Modified by me in order to affect sleep timer behaviour only in the music playback mode.
