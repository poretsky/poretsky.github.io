---
title: Some additional Rockbox features explanation
---

[Russian version of this page](features-ru.md)

## Speech feedback

These [Rockbox builds](index.md#anchor1) are provided with English
voice included and menu speaking turned on. So, being installed and
started for the first time it should speak immediately. But speaking
file and directory names is turned off. Nevertheless, some menus like
plugin or language lists are in fact file lists. Thus, if you need
full speech support it is recommended to turn on speaking of file and
directory names as well as using talk clips, since proper talk clips
are provided for all file names used as menu items.

----

## Voice announcements by WPS hotkey {#anchor1}

To use this feature edit **WPS announcement** format string available in
the **voice settings** menu. This string is no more than 20 characters
long and consists of tokens, each of which announces a particular
canned piece of information. Tokens are two characters in size and
case insensitive. If more than one token is specified, more than one
piece of information is announced. Multiple announcements may be bound
to the hotkey by separating one or more groups of tokens with a
".". These announcements will be spoken sequentially one by one if the
delay between key presses is less than 10 seconds. A space between
tokens adds a short pause to the announcement.

### Token list

- Prefix A: Date, time and sleeptimer
  - Aa = time
  - Ab = date
  - Ac = "TIME" time
  - Ad = "DATE" date
  - Ae = date and time
  - Af = sleeptimer remaining
  - Ag = "SLEEPTIMER" sleeptimer remaining
- Prefix B: Track information
  - Ba = elapsed time
  - Bb = track length
  - Bc = remaining time
  - Bd = elapsed time "ELAPSED" remaining time "REMAINING"
  - Be = elapsed time "OF" track length
- Prefix C: Playlist information
  - Ca = current track
  - Cb = number of tracks
  - Cc = tracks remaining
  - Cd = "TRACK" current track "OF" number of tracks
- Prefix D: Battery
  - Da = battery level percentage
  - Db = battery level in minutes
  - Dc = "BATTERY LEVEL" battery level percentage
  - Dd = "BATTERY LEVEL" battery level in minutes
- Prefix S: Various prefixes, suffices, connectives etc.
  - Sa = "TIME"
  - Sb = "DATE"
  - Sc = "TRACK"
  - Sd = "ELAPSED"
  - Se = "REMAINING"
  - Sf = "OF"
  - Sg = "BATTERY LEVEL"
  - Sh = "SLEEP TIMER"

----

## Smart alarm {#anchor2}

The alarm function in [these builds](index.md#anchor1)
can be used for scheduling recording of radio programs. It is achieved
by the following steps:

- Go to the **FM tuner** and find the desired station;
- Go to the **recording settings** and choose FM tuner as a source;
- Go to the **time and date settings** and adjust alarm function:
  - Set up the desired time for the **wakeup alarm**;
  - Adjust the **alarm timer** for the length of the program to be recorded;
  - Choose the **recording** as an **alarm wakeup screen**.

And that's all. Now you can safely turn your player off and leave it
alone. It is recommended to leave headphones plugged in since it is
usually used as an antenna. All the work will be done automatically in
appropriate time and the result will be placed in the directory that
is set up as a **recording directory**.

----

## Talk clips for FM presets {#anchor3}

To use talk clips for the radio station names defined in presets
simply place them into `/.rockbox/fmpresets/jingles` directory on your
player and allow using talk clips for file names in the
**voice settings**.
