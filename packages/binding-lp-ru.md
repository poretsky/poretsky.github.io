---
title: Подключение репозитория
language: ru
locale: ru_RU
---

Для автоматического подключения репозитория выполните команду:

```bash
$ sudo add-apt-repository ppa:poretsky/a11y
```

Или следуйте инструкциям на
[странице PPA](https://launchpad.net/~poretsky/+archive/ubuntu/a11y).

Очень рекомендуется сделать данный репозиторий предпочтительным для
Apt, дабы предотвратить случайную установку несовместимых версий
пакетов из других источников. Для этой цели скачайте файл
[accessibility-ppa.pref](files/accessibility-ppa.pref) и поместите его
в каталог `/etc/apt/preferences.d`.
