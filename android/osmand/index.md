---
title: Version of navigation application OsmAnd for blind users
description: An alternative version of navigation application OsmAnd with enhanced accessibility features for visually impaired and blind users.
keywords: navigation application OsmAnd,non-visual access,Android,accessibility
language: en
---

* TOC
{:toc}

----

## Introduction

OsmAnd is a navigation application, which works on mobile devices
running the [Android](http://www.android.com/) operating system.
More info about this application can be found directly on the
[project home page](http://osmand.net/) or on the
[Wikipedia page](http://en.wikipedia.org/wiki/OsmAnd)
dedicated to it.

In order to avoid possible ambiguities in further reading, I'd like to
note at the first place, that despite the fact that some resources
referenced from this page are represented only in Russian for the
moment, it _does not_ mean that the application itself lacks English
localization. Moreover, English resource in the application, in fact,
is the primary one. Thus, there may be more or less shortage for
various languages, but _not for English_.

Although the official version of OsmAnd in terms of non-visual
accessibility, perhaps, in general differs favourably from other
similar applications, and even includes a so-called accessibility plugin
that provides users with some additional non-visual access facilities,
in practice it is far from the stage of fully accessible
application for the users with rigid visual limitations.
[OsmAnd access](http://www.ksrk-edu.ru/osmand/osmand.php)
project aims to adapt OsmAnd application to the needs of blind users. On
the pages of this project can be found the application itself, as well
as some additional resources that could help you cope with
it. Unfortunately, all this stuff is available only in Russian for the
moment.

Unfortunately, the project was stopped in 2018. Thus, the material is
somewhat outdated now and preserved mainly for historical reason. Some
of the ideas and implementations described below were accepted by the
main project, that, of course, improved accessibility of the
application in general. Nevertheless, for OsmAnd developers this
problem is not the most important one, so there is much to do in this
direction yet.


## Versions

The application presented here is essentially an alternative version of
OsmAnd with advanced non-visual accessibility and bears the same name.
However, installing it above the official version and vice versa is not
treated by system as an update and can lead to undesirable consequences.

To distinguish our releases from the official ones we introduce the application
version designation "a11y+". Thus, for example, OsmAnd version
`1.8.3-a11y+1` corresponds to the official release of OsmAnd version
`1.8.3` in terms of basic functionality and is practically identical
to it when accessibility feedback is turned off.


## The main differences

### General interface accessibility

- Provided content description for almost all graphical interface
  elements (such as icons, buttons, etc.) that are essential for user
  interactions.
- Unwanted events for accessibility service, leading to it's
  inadequate behavior, are blocked.
- Map response to the gestures is modified so that when map is bound
  to location the long tap on it brings up a context menu that
  corresponds to the anchor point of the map, i.e. the user
  location. It doesn't depend on the touch point, which in the
  absence of visual control is poorly predictable. This special
  behaviour should be explicitly enabled in the program accessibility
  preferences if necessary.
- Introduced some accessibility improvements for the route
  description screen. They are as follows:
  - distance information is not duplicated by the accessibility
    feedback;
  - added particular items for arrival points;
  - fully qualified time format is used in accessibility mode since
    it is treated by speech synthesizers more correctly.


### Compass accessibility feedback

Audio and haptic feedback for the compass functions has been
introduced. So you can determine the direction to a particular object
turning the device horizontally. It can be an object that has the
focus in the search results list, next route point during
navigation or the destination point in other cases, if it is set.

Sound (or vibration) signal occurs when the axis of the device slightly
deviates from the correct direction. Thus, we need to " get in the
fork” between the two signals.


### Reverse geocoding

Implemented reverse geocoding facility. It allows one to receive a
verbose description (usually it is a postal address) of the current
location. This information could be retrieved from various online
sources as well as from the maps stored in the device memory in offline
mode. Source selection is available in the program accessibility
preferences.


### Neighborhood exploration

This function is available via the context menu (choose item "Look
around"). It displays a list of nearby objects located in the
surroundings of the virtual location. The list may include not only the
POI, but also favorites. You can configure the filter so that only the
objects of your interest will be shown.


### Voice control

A number of the program functions are available through voice control.
This mode is called by shaking the device in the direction of its
longitudinal axis, through the context menu or by pressing the button on
the headset. When a headset is used it's button can be used to
interrupt speech input as well. The editor of the voice commands
is available in the configuration of accessibility features of the
program.


### Special information screen

As in the official version of the program, in accessibility mode this
screen can be opened through the main menu: the item “Where am I /
Details”. Now, among other things, there are the results of reverse geocoding,
description of the destination point (if any) and information about the
map scale (size of the displayed area).


### Autoannounce

In the official version of OsmAnd application autoannounce (automatic
announcement of the direction and distance to the destination) is issued
only when the direction to the destination is changed. Here you can
optionally specify a period of unconditional issuing of autoannounce.
You can set minimal time interval between auto announcements in a range
from 5 seconds to 5 minutes.


### Additional navigation settings

Accessibility preferences of the program related to the navigation
process are set individually for each profile (car, bicycle,
pedestrian). These include:

- the prohibition of automatic re-route if you deviate from it, that
  is, if you are at a considerable distance from the specified route,
  or if the wrong direction of motion was detected;
- setting approaching radius to the final and intermediate route
  points;
- setting refresh rate of position.


### Other changes

- All voice control and navigation functions remain available in
  background, when screen is off or locked.
- Some minor bug fixes.


## Release 1.9.5-a11y+1

Of course, this release includes all goodies of the base version as
well as aforementioned features and improvements specific to our
project. Besides that, several new accessibility related features have
been added in this particular version:

- Auditory and haptic compass feedback has been made different for
  left and right inclination.
- Introduced accessibility specific option that allows one to adjust
  approach distance for waypoints. This option can be set separately
  for each profile and it is taken in account only when accessibility
  mode is active. Furthermore, in accessibility mode only this close
  approach is signaled, because preliminary signal seems rather confusing.
- Introduced new accessibility related option that allows one to adjust
  route deviation tolerance. This option can be set separately for
  each profile and it is taken in account only when accessibility
  mode is active. When it is set, user is warned about route failure
  during navigation as soon as distance from the route crosses
  specified limit.
- Long press of the button placed at the top right corner of the map
  (usually it is denoted as "Where am I" or "Back to location")
  brings up a short message with reverse geocoding result for the
  current location. When map is bound to location, a short press
  would be enough. This additional functionality is actual only in
  accessibility mode.


## Release 1.9.5-a11y+2

Here is the list of changes introduced in this release:

- Configurable route info accessibility. There is a plethora of
  information attached to each item in the route description screen,
  so it might be boring to have TalkBack reading just everything. Now
  it is possible to select explicitly what chunks of information
  should be read. It can be done either from the accessibility plugin
  settings or directly from the route description screen.
- Enhanced reverse geocoding function. Now information about distance
  and direction to the closest found object or address, if available,
  is attached to it's description.
- Some general fixes.


## Downloads

Installable package of the application can be downloaded here:

- {% include download.md file="OsmAnd-1.9.5-a11y+2.apk" url=site.data.download.android %}
- {% include download.md file="OsmAnd-2.9.3-a11y+1.apk" url=site.data.download.android %}

Or you can find it on the
[project's page](http://ksrk-edu.ru/osmand/en/)
along with the other related information and utilities to convert
points of routes and Loadstone databases to the OsmAnd GPX
format. These utilities were designed specially for the Loadstone
users in order to help them not lose their own point databases during
the transition to OsmAnd.
