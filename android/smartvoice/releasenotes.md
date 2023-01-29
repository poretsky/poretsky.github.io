---
title: What's new in versions 4.x.x
language: en
---

## About voices

Vocalizer Expressive v1 voices support has been dropped. Please, use
v2 voices. These voices are now supported not only in the form of APK
packages, but as a folder filled by respective files as well, just
like it was with the v1 voices in previous SmartVoice
versions. Internal hierarchy structure of this folder doesn't matter,
but the names of the voice files should be preserved. Default folder
name has been changed to VocalizerEx2 and, of course, it can be
customized via application settings.

## Modern environment support

The vast majority of modern devices are based on 64-bit
processors. SmartVoice now natively supports this architecture.

Since on modern Android versions explicit permission may be required
for files access, it is recommended to check voices folder in the
application settings if you are going to use it and make sure that it
is readable.

## Partial Farsi language support

Since Farsi uses Arabic alphabet and SmartVoice detects it as Arabic,
Farsi voices now are treated as Arabic capable, i.e. these voices can
be assigned to the language recognized as Arabic. Thus, in some
circumstances Farsi can be used as an automatically recognizable
language. Unfortunately, for the moment SmartVoice can not distinguish
Farsi from Arabic, so the both languages cannot be used
simultaneously.

## Interface

Voices list refresh button is now present only on those screens that
can be more or less directly affected by the action being based on the
list of available voices. Namely these are the immediate voice switch
screen, voices setup screen and voices assignment screen. On the other
hand, this button should not be frequently needed since in the most
cases all relevant changes are caught automatically.

## New translations

* Portuguese translations (European and Brazilian) have been
  added. Thanks to Wendrill Aksenow Brandão and Michel Henrique.
* Turkish translations from Neyman Agayev have been added in 4.1.3.

## Russian Robot voice

The following improvements for the Russian Robot voice have been
implemented in 4.1.3:

* Extended speech rate variation range.
* Fixed huge numbers pronunciation.
* Pronunciation dictionary updated.
