---
title: Средства невизуального доступа на базе Emacspeak
description: Репозитории пакетов для Debian и Ubuntu, посвященные средствам невизуального доступа. здесь исправленная и дополненная версия Emacspeak, многоязычный речевой сервер, речевые синтезаторы и прочее.
keywords: невизуальный доступ,многоязычный речевой сервер,Multispeech,Emacspeak,Ubuntu,Debian
language: ru
locale: ru_RU
---

Расположенные здесь репозитории содержат полный набор пакетов для
организации рабочего места на базе
[Emacspeak](https://github.com/tvraman/emacspeak)
с многоязычной речевой поддержкой. Они включают в себя современную
версию Emacspeak, несколько исправленную и дополненную,
[многоязычный речевой сервер](https://github.com/poretsky/multispeech)
с поддержкой русского, английского, немецкого, французского,
итальянского, испанского и португальского языков и возможностью
автоматического переключения языка на лету по контексту,
программы синтеза речи и прочие средства так или иначе имеющие
отношение к невизуальному доступу. Разумеется, здесь находятся лишь те
пакеты, которые либо вовсе не входят в состав соответствующих
дистрибутивов, либо представлены там старыми или недоброкачественными
версиями.


## Краткая инструкция

Интересующиеся репозиторием как таковым, скажем, для зеркалирования
или просто из любопытства, приглашаются
[сюда](https://github.com/poretsky/ppa).
А чтобы подключить его к системе управления пакетами, достаточно
выполнить следующие несложные действия:

- Загрузить открытый ключ [poretsky.gpg](repo/poretsky.gpg),
 который будет использоваться для проверки подлинности моей подписи;

- Внести его в связку ключей системы управления пакетами посредством
  команды:

```bash
$ sudo apt-key add poretsky.gpg
```

- Загрузить файл `accessibility.list` со списком источников,
  соответствующий вашему дистрибутиву:
  - [Ubuntu 8.04 LTS (Hardy Heron)](files/hardy/accessibility.list)
  - [Ubuntu 10.04 LTS (Lucid Lynx)](files/lucid/accessibility.list)
  - [Ubuntu 12.04 (Precise Pangolin)](files/precise/accessibility.list)
  - [Ubuntu 14.04 (Trusty Tahr)](files/trusty/accessibility.list)
  - [Ubuntu 16.04 (Xenial Xerus)](files/xenial/accessibility.list)
  - [Ubuntu 18.04 LTS (Bionic Beaver)](files/bionic/accessibility.list)
  - [Ubuntu 20.04 LTS (Focal Fossa)](files/focal/accessibility.list)
  - [Debian 6.0 (Squeeze)](files/squeeze/accessibility.list)
  - [Debian 7.0 (Wheezy)](files/wheezy/accessibility.list)
  - [Debian 8.0 (Jessie)](files/jessie/accessibility.list)
  - [Debian 9.0 (Stretch)](files/stretch/accessibility.list)
  - [Debian 10.0 (Buster)](files/buster/accessibility.list)

- Поместить его в каталог `/etc/apt/sources.list.d` или просто
  скопировать содержимое в файл `/etc/apt/sources.list`;

- Актуализировать индексы системы управления пакетами посредством
  команды:

```bash
$ sudo apt-get update
```

- Очень рекомендуется сделать данный репозиторий предпочтительным для
  Apt, дабы предотвратить случайную установку несовместимых версий
  пакетов из других источников. Для этой цели скачайте файл
  [accessibility.pref](files/accessibility.pref) и поместите его
  в каталог `/etc/apt/preferences.d`.

После этого пакеты можно устанавливать и обновлять стандартными
средствами, например, командой `apt-get install`.

Основной комплект устанавливается командой:

```bash
$ sudo apt-get install multispeech mbrola mbrola-en1 freephone enlex ru-tts rulex emacspeak
```

Предполагается, что Emacs к этому моменту уже установлен. Если нет, он
будет установлен тоже благодаря зависимостям. Если в системе
используются средства невизуального доступа к среде Gnome на основе
Orca, то,воизбежание возможных конфликтов, очень рекомендуется
выбирать версию Emacs без поддержки gtk. Например, пакеты с суффиксом
`-lucid`.

При первой установке Emacspeak предлагает выбрать речевой сервер. Если
в этой роли предполагается использовать Multispeech, а он еще не
установлен на данный момент и потому, естественно, в списке
отсутствует, беспокоиться не стоит: можно выбрать любой другой, а
потом установить Multispeech и вернуться к этому вопросу посредством
команды:

```bash
$ sudo dpkg-reconfigure emacspeak
```

Влюбом случае рекомендуется не обходить своим вниманием документацию,
поставляемую в составе пакетов.


## Дополнительные конфигурационные файлы

И, наконец, вот еще парочка конфигурационных файлов для пущего
облегчения жизни. Место их в каталоге `/etc/emacs/site-start.d`.

- [80keybindings.el](files/80keybindings.el) -- [Клавиатурные комбинации](emacs-keybindings-ru.md)
  для ряда полезных функций Emacs
- [80site-defaults.el](files/80site-defaults.el) -- [Общие настройки Emacs](emacs-settings-ru.md)
