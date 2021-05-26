---
title: SmartVoice
description: Multilingual speech synthesizer for Android with automatic language recognition and switching facility.
keywords: multilingual speech synthesizer,automatic TTS language switch,Android,accessibility
---

# {{ page.title }}

[This page in Russian](index-ru.md)

**Current version: {{ site.data.smartvoice.version }}**

The most prominent feature of this synthesizer is its capability to
distinguish and switch language automatically according to the nature
of input text. In fact, not all supported languages can be recognized
automatically, but only a certain subset. For the moment it includes
Arabic, Bulgarian, Chinese, Croatian, English, French, German, Greek,
Hebrew, Italian, Japanese, Polish, Portuguese, Russian, Spanish and
Turkish. Besides that, this synthesizer allows to adjust voices
separately. So, such parameters as volume, speech rate and voice pitch
can be tuned for each voice individually.

Another important feature of SmartVoice is its capability to recognize
and read emojis and it is possible to assign a separate voice for it.

After installation the synthesizer becomes available in the
applications list that allows to setup it just before starting.

Current speech language and voice can be as well immediately changed
manually at any moment via the main application interface, which can
be accessible from the notification panel as well if it is enabled in
the general application settings. By the way, it is highly recommended
to enable it for those, who use speech synthesis on a regular basis,
such as an accessibility feedback, for instance, because as a side
effect it prevents system from unloading speech synthesizer when it is
not used during a fairly long time or in case of resource deficiency.

Application interface is available in English, Italian, Spanish,
Croatian, Polish, Hebrew, Russian and Ukrainian.

By the way, I'd like to thank **Adi Kushnir** for Hebrew,
**Zvonimir Stanecic** for Croatian and Polish, and **Vladimir Pyrig**
for Ukrainian translations.

For the most part this product is intended for the visually impaired
people who are forced to use speech feedback as a primary
interface. Android accessibility service in its current state does
not provide any convenient way to change speech language on the fly
without additional disturbances, therefore, visually impaired users
are now totally frustrated and discriminated in multilingual
environment. Moreover, some synthesizers require voice installation as
a separate step before anything can actually be spoken.

At the contrary, SmartVoice can speak just after installation with no
additional steps, because it has its own embedded voices, though
only English (American and British accents), German, Spanish, French,
Italian and Russian for the moment. For other languages SmartVoice can
use **Vocalizer Expressive** voices from
[Nuance Communications, Inc.](http://www.nuance.com/),
but it is not supported or even approved in any way by this company and,
of course, _does not include_ these voices itself. I suggest that the
voices should be purchased somehow from the official owner. Anyway, it
is not my business. The only intention of mine is to provide so
desperately desired functionality to whom it may concern.

{% capture apk_file %}SmartVoice-{{ site.data.smartvoice.version }}.apk{% endcapture %}

So, grab the package
[{{ apk_file }}](https://github.com/poretsky/poretsky.github.io/releases/download/android/{{ apk_file }})
if you like, install it and use at your own risk.
Of course, no warranties.

[Android 4.4](https://www.android.com/versions/kit-kat-4-4/)
or later is required.

----

Since the section of application settings devoted to automatic
language recognition contains a plethora of options that might look
not so evident at the first glance, it seems to make sense giving some
explanation about how this mechanism actually works.

At first, all this machinery can be totally disabled by the option
"Use only default voice or the one requested by client". If it is
checked, SmartVoice will obey to a client request and use only the
language and voice specified, just like other speech synthesizers
usually do.

In general, text fragment processing in SmartVoice depends on the
option "Use one voice for entire message". If it is checked, each text
fragment is treated atomically. SmartVoice only tries to guess the
voice mostly fitting to pronounce it. In the opposite case some
lingual markup is undertaken, i.e. the text is split onto the
monolingual fragments and an appropriate voice is chosen for each of
them separately.

Since reliable and unambiguous language recognition for rather small
chunk of text is somewhat problematic, the priority list specified by
the option "Language detection order" comes into view. This list is
traversed downwards from top to bottom, thus, the languages placed
upper in the list have more chances to be used. It is also taken in
account in the lingual markup process.

Such languages as Arabic and Hebrew use their own character sets
(alphabets) by wich they can be easily recognized. The others are
subdivided into groups by character set community. SmartVoice
distinguishes three such groups: Latinic, Cyrillic and CJK
ideography. It is possible to choose fallback voice for each of them
that will be used when no particular language has been detected, but
only the alphabet group.

In summary, the voice for an entire message is chosen as follows:

1. SmartVoice tries to detect the language or at least alphabet group
   and, in the case of success, the corresponding voice specified in
   the section "Voices assignment" is used.
2. If neither language nor alphabet group was detected, but the
   language of the previous message is checked in the "Continue to
   use chosen language until another one will be recognized" list,
   the voice of the previous message will be used.
3. If all this did not bring a definite result, but the option
   "Prefer current interface language" is checked, the voice
   corresponding to the current system locale language will be
   chosen.
4. Finally, if all this did not help, the voice corresponding to the
   client request or system default will be used as the last resort.

The lingual text markup process consists of four stages:

1. If something definite is specified in the option "Preferred
   numbers pronunciation voice", then all pure numbers are extracted
   and the corresponding voice is used for them.
2. SmartVoice tries to extract monolingual fragments from the
   remaining text and uses appropriate voices for them according to
   the preferences specified in the "Voices assignment" section.
3. Then emojis are extracted and voicified according to the option
   "Emojis pronunciation voice" in the "Voices assignment" section.
4. Finally, the list of text fragments mastered on previous stages is
   traversed sequentially and if a fragment that still has no voice
   attached is encountered, the voice for it is defined according to
   the aforementioned rules 2, 3 and 4 just like for entire messages.

Perhaps, it is worth yet to add that only general languages can take
part in the recognition process, but not their variants or
dialects. But the latter ones can be used in system locales and client
requests. For instance, when English language is detected the voice
defined for the mere English is used, but a client can request British
or American English and in that case the corresponding voice can be
used. This notion should be kept in mind when editing preferences in
the "Voices assignment" section.

Note about voice switching via the main interface. Any voice can be
explicitly selected here for instant use either globally or for the
language that is native for the selected voice if it is checked as an
autodetectable one, or for the language group it belongs to if
any. But it acts not like a persistent setting in the sense that the
choice only lasts until one of the following events is encountered:

- it is discarded by clicking "According to the application settings"
  item in this menu,
- the notification panel widget is disabled,
- the application is restarted,
- the synthesizer is unused more than one minute.

Each list item in this menu accepts long press. For a voice item it
opens the respective voice settings screen. Long press on the
"According to the application settings" item opens automatic language
recognition preferences section. But this item is shown only when an
explicit voice selection is in use.
