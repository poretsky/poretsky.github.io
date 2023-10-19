---
title: Мои открытые проекты
description: Краткое описание нескольких открытых проектов
keywords: невизуальный доступ,программные средства,Linux,разработка,синтез речи
language: ru
locale: ru_RU
---

Здесь представлены те из моих проектов, которые для меня являются
наиболее значимыми.

[Emacspeak](https://github.com/poretsky/emacspeak) -- Полновесный
речевой интерфейс для Emacs. Проект отпочковался от
[tvraman/emacspeak](https://github.com/tvraman/emacspeak) и оброс
множеством расширений, дополнений и поправок, к которым добавились и
средства сборки пакетов для популярных дистрибутивов Linux. Вся эта
работа ведется в соответствующих ветках:

- [xenial](https://github.com/poretsky/emacspeak/tree/xenial) --
  Пакет для Ubuntu 16.04
- [bionic](https://github.com/poretsky/emacspeak/tree/bionic) --
  Пакет для Ubuntu 18.04
- [focal](https://github.com/poretsky/emacspeak/tree/focal) --
  Пакет для Ubuntu 20.04
- [jammy](https://github.com/poretsky/emacspeak/tree/jammy) --
  Пакет для Ubuntu 22.04
- [stretch](https://github.com/poretsky/emacspeak/tree/stretch) --
  Пакет для Debian 9
- [buster](https://github.com/poretsky/emacspeak/tree/buster) --
  Пакет для Debian 10
- [bullseye](https://github.com/poretsky/emacspeak/tree/bullseye) --
  Пакет для Debian 11

[Multispeech](https://github.com/poretsky/multispeech) -- Многоязычный
речевой сервер для **Emacspeak** способный автоматически распознавать
язык по характеру текста и выбирать для него соответствующий
голос. Кроме того, он может выступать в качестве модуля синтеза речи
для **Speech Dispatcher**, обеспечивая тем самым многоязычный речевой
вывод экранному помощнику **Orca**.

[Ru_tts](https://github.com/poretsky/ru_tts) -- Синтезатор русской
речи. Альтернативная реализация широко известного синтезатора
**Фонемафон-5**. Написанный на чистом C, он практически не имеет себе
равных по компактности и нетребовательности к вычислительной мощности.

[RuLex](https://github.com/poretsky/rulex) -- Словарь русских
произношений. Изначально задумывался как словарь ударений для
синтезатора **Ru_tts**, что и по сей день остается его основным
назначением.

[FreeSpeech](https://github.com/poretsky/freespeech) --
Преобразователь английского текста в фонетическую
транскрипцию. Предназначен для совместного использования с
синтезатором **MBROLA**. Проект вырос из архива, когда-то давным-давно
найденного на
[http://tcts.fpms.ac.be/synthesis/mbrola/tts/English/fs.a10m.tar.gz](http://tcts.fpms.ac.be/synthesis/mbrola/tts/English/fs.a10m.tar.gz)

[Youtube-dl-el](https://github.com/poretsky/youtube-dl-emacs) --
Emacs-интерфейс для **Youtube**. Проект отпочковался от
[skeeto/youtube-dl-emacs](https://github.com/skeeto/youtube-dl-emacs)
и претерпел весьма существенное развитие. Теперь это не только (и даже
не столько) инструмент загрузки с Youtube, но в связке с браузером
**W3m** может служить также и удобным средством просмотра и поиска
информации на ресурсе.

[Gh-subscription](https://github.com/poretsky/gh-subscription) --
Расширение командного интерфейса GitHub для управления подписками.

[SmartVoice-translations](https://github.com/poretsky/SmartVoice-translations) --
Подлежащий переводу ресурс синтезатора речи
[SmartVoice](android/smartvoice/index-ru.md), который сам по себе не
входит в число открытых проектов.

Представленный список не является исчерпывающим. Тех же, кто
интересуется прочими моими проектами, приглашаю непосредственно на
[свою страницу](https://github.com/poretsky) на GitHub.
