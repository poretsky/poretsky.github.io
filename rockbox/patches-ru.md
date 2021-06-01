---
title: Список наложенных заплаток
---

[English version of this page](patches.md)

{% assign tracker="http://www.rockbox.org/tracker" %}

Следующие заплатки были заимствованы из
[системы отслеживания ошибок]({{ tracker }}/index.php?type=4)
проекта Rockbox:

- [FS#12191]({{ tracker }}/task/12191) -- Улучшение качества звучания
  для плееров на базе AS3515 [^1];
- [FS#11388]({{ tracker }}/task/11388) -- Разрешение конфликта формата
  закладок с именами файлов, содержащими точку с запятой (";") [^3];
- [FS#11541]({{ tracker }}/task/11541) -- Голосовые сообщения в режиме
  воспроизведения [^2],
  подробности использования [здесь](features-ru.md#anchor1);
- [FS#11619]({{ tracker }}/task/11619) -- Сохранение и восстановление
  настроек высоты тона и скорости воспроизведения;
- [FS#7779]({{ tracker }}/task/7779) -- Использование голосовых меток
  для названий радиостанций [^4],
  подробности [здесь](features-ru.md#anchor3);
- [FS#10698]({{ tracker }}/task/10698) -- Управление воспроизведением
  в режиме блокировки для Cowon D2;
- [FS#9114]({{ tracker }}/task/9114) -- Пауза между треками [^2];
- [FS#12074]({{ tracker }}/task/12074) -- Включение/выключение
  линейного выхода на плеерах Sansa Fuze V2 [^5];
- [FS#12779]({{ tracker }}/task/12779) -- Модификация и исправление
  таймера сна [^6];
- [FS#9356]({{ tracker }}/task/9356) -- Настройка длительности долгих
  нажатий [^2].

Следующие заплатки были добавлены мной:

- Полный русский перевод интерфейса;
- В контекстном меню для открытия файла предлагаются лишь те плагины,
  которые реально могут с ним работать, подобно тому, как предложено
  в [FS#9043]({{ tracker }}/task/9043);
- Добавлен таймер будильника, позволяющий задать время работы
  устройства после пробуждения. Таким образом, теперь будильник можно
  использовать для программирования автоматической записи по
  времени. Подробное объяснение [здесь](features-ru.md#anchor2);
- Увеличена допустимая длина названий радиостанций;
- Добавлена возможность менять местами каналы при стереофоническом
  воспроизведении;
- Более тщательная фильтрация дребезга при нажатии кнопок;
- Привязка соответствующих действий к ярлыкам для файлов и папок;
- Увеличена допустимая длина имен файлов;
- Сокращено общее потребление стека;
- Поддержка файлов формата ASF, использующих MP3-кодирование;
- Скорректирована оценка времени работы для устройств на базе AMSv2;
- Предотвращено обрезание звука при включении;
- Исправлена установка режима радиоприемника во внешнем контекстном
  меню;
- Инвертированы функции вертикальных стрелок в экране быстрого
  доступа: стрелка вверх теперь увеличивает значение управляемого
  параметра, а стрелка вниз - уменьшает, что представляется более
  естественным;
- Более универсальный в смысле языка способ проговаривания числовых
  значений;
- Усовершенствована сортировка файлов и каталогов;
- Унифицирован формат даты и времени;
- Исключено отладочное меню, так как для повседневного использования
  оно представляется лишним и скорее вредным, нежели полезным;
- Для Sony NWZ-E370/E380 исключена из сборки горячая кнопка, так как
  она все равно там ни на что не назначена и нигде не используется;
- Предотвращено повторное чтение каталога если он в действительности
  не изменился;
- Отдельная настройка звуковой индикации начала и конца списка при
  навигации;
- Разумные ограничения просмотра при выборе плагина режима
  воспроизведения.

Полный комплект исходников доступен
[здесь](https://github.com/poretsky/rockbox/tree/r{{ site.data.rockbox.version }}).

----

[^1]: Clipv1, Fuzev1, m200v4, c200v2 and e200v2. Вторая часть, реализующая лишь документированную рекомендацию "Not set AUDIOSET3_IBR_HPH" для 16-омной нагрузки.

[^2]: С моими поправками.

[^3]:Доработано мной таким образом, что старый формат закладок воспринимается адекватно и не вызывает конфликта.

[^4]: С моими доработками и усовершенствованиями.

[^5]: По-умолчанию звук поступает в наушники.

[^6]: Модифицировано мною таким образом, что поведение таймера сна меняется только для режима воспроизведения.