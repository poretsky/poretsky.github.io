---
title: Технические аспекты обеспечения невизуальной доступности Android-приложений
description: Проблемы обеспечения невизуальной доступности Android-приложений и пути их решения.
keywords: разработка приложений,Android,специальные возможности,невизуальная доступность,универсальный дизайн
---

* TOC
{:toc}

----


## Введение

Возможно, читателю, далекому от рассматриваемой проблематики, название
покажется абсурдным, ведь дизайн интерфейса как самой системы Android,
так и разрабатываемых для нее приложений, ориентирован прежде всего
именно на визуальную наглядность и привлекательность, что усугубляется
использованием сенсорного экрана в качестве главного органа
взаимодействия пользователя с устройством. Однако существует категория
пользователей, волею природы или случая лишенных возможности в полной
мере насладиться всеми этими прелестями. Благодаря тому, что в Android
предусмотрены альтернативные, - или, лучше сказать, дополнительные, -
способы взаимодействия, интерфейс и основной функционал системы отнюдь
не являются принципиально недоступными для данной категории
пользователей. Именно обеспечению такой доступности посвящены пункт
"Специальные возможности" в меню настроек системы и входящее в ее
состав приложение TalkBack. Что же касается невизуальной доступности
сторонних приложений, то она варьируется от случая к случаю и порой
требует от разработчика не то чтобы каких-то специальных сверхусилий,
но хотя бы минимального внимания к проблеме.

Список Android-приложений, протестированных на предмет невизуальной
доступности, с соответствующими комментариями можно найти, например,
[здесь](http://ksrk-edu.ru/android/).
Разумеется, это не единственный такой список в глобальной сети
и наверное не самый представительный, но я ссылаюсь на него прежде
всего как на источник примеров, наглядно иллюстрирующих то, о чем идет
речь. Заметим, что невизуальная доступность интерфейса многих из этих
приложений обусловлена не специальными стараниями их разработчиков, а
является естественным результатом работы встроенных в систему
механизмов. Разработчики же приложений просто этому не препятствуют,
что, впрочем, я бы тоже вменил им в немалую заслугу.

Не станем углубляться в обсуждение целесообразности заботы о
невизуальной доступности приложений в принципе. Об этом достаточно
сказано в других местах. Отметим лишь, что разработчики Android
уделяют этой заботе определенное внимание, о чем можно судить по
[истории развития средств специального доступа](http://www.tiflocomp.ru/devices/android/a11y_history.php).
Мы же сосредоточим свое внимание на чисто технических
аспектах. Рассмотрим ряд типичных проблем и укажем пути их
решения. Иными словами, данное сочинение ориентировано главным образом
на разработчиков Android-приложений, по тем или иным причинам решивших
не игнорировать потребности пользователей, обремененных визуальными
ограничениями, и целью своей имеет помочь им воплотить благородные
помыслы в жизнь.

Так как дальнейшее изложение предполагает у читателя более или менее
ясное представление о принципах невизуального доступа к интерфейсу,
используемых в Android, с точки зрения как пользователя, так и
программиста, то тем, кому эта тема внове, рекомендуется прежде всего
ознакомиться с некоторыми источниками основополагающих сведений:

- [Основы специальных возможностей в Android](http://www.tiflocomp.ru/devices/android/basics.php)
- [Модель сенсорного управления OS Android 4.1 Jelly Bean](http://www.tiflocomp.ru/devices/android/touch_manage4.1.php)
- [Доступность OS Android в вопросах и ответах](http://www.tiflocomp.ru/devices/android/faq.php)
- [ОС Android: Базовая часть для незрячих пользователей. Учебное пособие](http://www.tiflocomp.ru/devices/android/basics_for_beginners.php)
- [Рекомендации по разработке приложений для платформы Android OS с учётом доступности](http://www.tiflocomp.ru/devices/android/a11y_dev.php)
- [Android Design: Accessibility](https://material.io/design/patterns/accessibility.html)
- [Android accessibility API guide](https://developer.android.com/guide/topics/ui/accessibility/index.html)

Приводимые ниже соображения и рекомендации будут иллюстрироваться и
подкрепляться конкретными примерами, взятыми главным образом из
проекта [TeamTalk](http://bearware.dk), мое участие в котором не в
последнюю очередь было связано именно с решением проблем доступности
Android-приложения.

Разумеется, как правило это будут не совсем буквальные выдержки из
текста. Я буду максимально упрощать их и даже порою несколько
видоизменять, дабы не утомлять читателя не относящимися к делу
подробностями и сделать иллюстрируемые идеи наиболее выпуклыми. Ведь
предметом нашего рассмотрения является не сам этот проект, а проблемы
невизуальной доступности, достаточно типичные для Android-приложений
вообще, и возможные пути их решения.

Те же, кто захочет ознакомиться с исходным кодом, скупые выдержки из
коего будут сопровождать повествование, во всей его полноте, смогут
легко удовлетворить свое законное любопытство на
[Github](https://github.com/BearWare/TeamTalk5).


## Концепция универсального дизайна и принцип здорового минимализма

Сразу скажу, что я далек от мысли проповедовать невизуальную
доступность интерфейса в ущерб его визуальной наглядности или
эстетике, не говоря уже о функциональности приложения. Я лишь ратую за
то, чтобы о доступности тоже не забывали, особенно там, где это не
требует от разработчика ни компромиссов, ни сколько-нибудь заметных
специальных усилий.

Я сторонник концепции **универсального дизайна**, согласно которой,
интерфейс приложения в идеале должен быть одинаково доступен _всем_
категориям пользователей. И прежде всего не нужно мешать самой системе
обеспечить такую доступность, что влечет за собой принцип **здорового
минимализма**, заключающийся в том, что _не следует плодить сущности
без реальной необходимости_.

То есть, когда возникает соблазн воспользоваться при разработке
интерфейса какой-либо сторонней библиотекой или же создать свой
собственный совершенно оригинальный элемент управления, недурно бы для
начала задуматься: а так ли оно необходимо на самом деле? Android SDK
предоставляет в распоряжение программиста весьма богатый набор средств
такого рода, и без достаточно серьезных оснований за его пределы
выходить не следует. Это, кстати, положительно отразится не только на
доступности приложения, но и на его совместимости.


## Об атрибуте `contentDescription`

Самое простое и очевидное, что разработчик приложения может (и должен,
на мой взгляд) сделать для пользователей с визуальными ограничениями,
не перетрудившись при этом и ничем не пожертвовав, - это аккуратно
подписать все чисто графические элементы интерфейса через атрибут
`contentDescription`. Однако, к сожалению, очень мало кто это делает. И
должное уважение к данному атрибуту представляется скорее счастливым
исключением, нежели общепринятой практикой.

Рекомендации использовать `contentDescription` для повышения доступности
интерфейса приложений встречаются и в
[руководящих документах Google](https://material.io/design/usability/accessibility.html),
и в других источниках, так что, честно говоря, даже неловко напоминать
еще раз. Я бы и воздержался, кабы все эти рекомендации не
игнорировались с постоянством, достойным явно лучшего применения.

Порою же в ответ на прямую просьбу подписать графические кнопки от
разработчиков доводилось слышать, что, мол, на экране для этого мало
места. Разумеется, подобный ответ свидетельствует прежде всего о
профессиональной несостоятельности программиста, который, не
удосужившись даже мало-мальски ознакомиться с документацией, образно
говоря, не пишет программу, а ляпает как попало. Хочется верить, что
среди разработчиков приложений настолько безграмотных найдется
немного, но все же на всякий случай еще раз подчеркну, что атрибут
`contentDescription` совершенно безобиден, он _абсолютно никак не
отражается на внешнем виде приложения_ и _не требует места на экране_.

Однако, как и ко всему на свете, к заполнению `contentDescription`
надлежит подходить с пониманием и без фанатизма. Механически бездумный
подход скорее всего приведет к совершенно нежелательным результатам.

Проиллюстрируем сказанное примером. Предположим, мы собираемся
отображать на экране список пользователей и для элемента списка имеем
следующую схему:

```xml
    <LinearLayout
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:layout_alignParentLeft="true">

        <ImageView
            android:id="@+id/usericon"
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:src="@drawable/user" />

        <TextView
            android:id="@+id/nickname"
            android:textSize="16sp"
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:singleLine="true" />

    </LinearLayout>
```

Как видим, чисто графический элемент =ImageView= в этой схеме не имеет
атрибута `contentDescription`. И это совершенно осознанно. Элемент
списка здесь рассматривается как единое целое, то есть, его части
(`ImageView` и `TextView`) не имеют самостоятельной роли: у них не
установлен атрибут `clickable`. Текстовая информация, необходимая службе
специального доступа, целиком содержится в `TextView`, а `ImageView` в
данном случае играет по большей части декоративную роль и с точки
зрения невизуального доступа полезной информации не несет.

Совсем другое дело если бы элемент `ImageView` на самом деле
использовался в качестве кнопки, нажатие на которую вызывало бы
какое-либо действие. В этом случае атрибут `contentDescription` был бы
крайне полезен.

Теперь предположим, что пользователи в нашем списке могут находиться в
различном состоянии, скажем, "online" и "offline", и для их индикации
мы будем пользоваться разными цветами. Сделать эту дополнительную
информацию также невизуально доступной нам опять-таки поможет атрибут
`contentDescription`, который на сей раз мы будем задавать динамически
вместе с цветом элемента в адаптере списка.

Вот как это может быть реализовано:

```java
class UserListAdapter extends ArrayAdapter<User> {

    public UserListAdapter(Context context, int resource) {
        super(context, resource);
    }

    @Override
    public View getView(int position, View convertView, ViewGroup parent) {
        Context context = getContext();
        LayoutInflater inflater = LayoutInflater.from(context);
        if (convertView == null)
            convertView = inflater.inflate(R.layout.item_user, null);
        User user = getItem(position);
        TextView nickname = (TextView) convertView.findViewById(R.id.nickname);
        nickname.setText(user.nickname);
        if (user.stateOnline) {
            convertView.setBackgroundColor(Color.rgb(133, 229, 141));

            // Мы намеренно дублируем здесь основное текстовое содержание,
            // так как при наличии атрибута contentDescription,
            // служба специального доступа использует именно его,
            // полностью игнорируя атрибут text.
            nickname.setContentDescription(context.getString(R.string.user_state_online, user.nickname));
        }
        else {
            convertView.setBackgroundColor(Color.rgb(0, 0, 0));

            // Обнуляя contentDescription, мы заставляем
            // службу специального доступа использовать атрибут text.
            nickname.setContentDescription(null);
        }
        return convertView;
    }

}
```

Предполагается, что в строковом ресурсе имеется определение:

```xml
    <string name="user_state_online">%1$s online</string>
```

Обратим внимание на то, что дополнительную информацию мы сообщаем
службе специального доступа лишь тогда, когда пользователь пребывает в
состоянии "online". Это помогает сократить объем речевых сообщений без
ущерба для информативности, так как возможных состояний всего два, то
есть никаких разночтений не возникает.

Речевые сообщения _требуют времени на восприятие_, поэтому их объем
следует сокращать везде, где это возможно сделать, не жертвуя полезной
информацией.

Кроме того, составляя комбинированный текст для `contentDescription`, мы
размещаем имя пользователя перед обозначением его состояния, ибо из
соображений эффективности восприятия наиболее востребованная
информация должна располагаться _в начале речевого сообщения_.


## Списки с "живыми" элементами

Продолжая рассматривать пример из предыдущего пункта, логично будет
предположить, что состояние пользователей меняется по какой-либо
внешней по отношению к приложению, или, точнее, его интерфейсу,
причине. И нам необходимо регулярно обновлять информацию на экране,
чтобы она соответствовала реальному положению вещей.

Для определенности предположим следующую реализацию:

```java
public class MainActivity extends Activity {

    private UserListAdapter userListAdapter;
    private CountDownTimer listUpdateTimer;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        userListAdapter = new UserListAdapter(this, R.layout.item_user);

        listUpdateTimer = new CountDownTimer(10000, 1000) {

                @Override
                public void onTick(long millisUntilFinished) {
                    userListAdapter.notifyDataSetChanged();
                }

                @Override
                public void onFinish() {
                    start();
                }
            };

        listUpdateTimer.start();
    }

}
```

То есть информация на экране будет обновляться примерно раз в
секунду. Но при каждом таком обновлении элементы списка будут
вырабатывать соответствующие события для службы специального доступа,
и если при этом фокус доступности будет находиться на одном из
элементов списка, то элемент этот будет непрестанно проговариваться,
что приведет к практически полной невозможности нормального
взаимодействия пользователя с приложением. Налицо тот случай, когда
излишняя услужливость средств специального доступа оказывается не
впрок и оголтелый фанатизм нуждается в разумном ограничении.

С этой целью введем в рассмотрение вспомогательный класс:

```java
public class AccessibilityAssistant extends AccessibilityDelegate {

    private final Activity hostActivity;
    private volatile boolean eventsLocked;

    public AccessibilityAssistant(Activity activity) {
        hostActivity = activity;
        eventsLocked = false;
    }

    // Перед обновлением списка мы будем запрещать выдачу событий.
    public void lockEvents() {
        eventsLocked = true;
    }

    // После обновления списка мы будем вновь разрешать выдачу событий,
    // однако реально это должно происходить лишь после того,
    // как информация на экране действительно обновится.
    public void unlockEvents() {
        if (!hostActivity.getWindow().getDecorView().post(new Runnable() {
                @Override
                public void run() {
                    eventsLocked = false;
                }
            }))
            eventsLocked = false;
    }

    @Override
    public void sendAccessibilityEvent(View host, int eventType) {
        if (!eventsLocked)
            super.sendAccessibilityEvent(host, eventType);
    }

    @Override
    public void sendAccessibilityEventUnchecked(View host, AccessibilityEvent event) {
        if (!eventsLocked)
            super.sendAccessibilityEventUnchecked(host, event);
    }

}
```

Теперь мы можем легко реализовать постоянное обновление информации на
экране, не жертвуя невизуальной доступностью интерфейса:

```java
public class MainActivity extends Activity {

    private AccessibilityAssistant accessibilityAssistant;
    private ArrayAdapter userListAdapter;
    private CountDownTimer listUpdateTimer;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        accessibilityAssistant = new AccessibilityAssistant(this);

        userListAdapter = new ArrayAdapter(this, R.layout.item_user) {
                @Override
                public View getView(int position, View convertView, ViewGroup parent) {
                    if (convertView == null)
                        convertView = LayoutInflater.from(getContext()).inflate(R.layout.item_user, null);
                    User user = getItem(position);
                    TextView nickname = (TextView) convertView.findViewById(R.id.nickname);
                    nickname.setText(user.nickname);
                    if (user.stateOnline) {
                        convertView.setBackgroundColor(Color.rgb(133, 229, 141));
                        nickname.setContentDescription(getString(R.string.user_state_online, user.nickname));
                    }
                    else {
                        convertView.setBackgroundColor(Color.rgb(0, 0, 0));
                        nickname.setContentDescription(null);
                    }

                    // Мы собираемся блокировать именно те события,
                    // источниками которых являются элементы списка.
                    convertView.setAccessibilityDelegate(accessibilityAssistant);
                    return convertView;
                }
            };

        listUpdateTimer = new CountDownTimer(10000, 1000) {

                @Override
                public void onTick(long millisUntilFinished) {
                    // Запрещаем выдачу событий
                    accessibilityAssistant.lockEvents();

                    // Инициируем обновление списка на экране
                    userListAdapter.notifyDataSetChanged();

                    // Вновь разрешаем выдачу событий
                    // когда информация на экране обновится
                    accessibilityAssistant.unlockEvents();
                }

                @Override
                public void onFinish() {
                    start();
                }
            };

        listUpdateTimer.start();
    }

}
```

В принципе, задачу можно было бы решить и переопределением метода
`notifyDataSetChanged()` в адаптере списка:

```java
    public void notifyDataSetChanged() {
        accessibilityAssistant.lockEvents();
        super.notifyDataSetChanged();
        accessibilityAssistant.unlockEvents();
    }
```

Но этот вариант хуже, ибо блокируются события, возникающие при _любом_
обновлении списка, даже если оно инициировано какими-либо действиями
пользователя. Система же специального доступа ориентирована на то,
чтобы пользователь имел адекватный отклик на свои действия, так что в
общем случае такая блокировка нежелательна.


## Сложные элементы списка и динамическая информация

Теперь рассмотрим ситуацию, когда каждый элемент списка имеет
сопряженную с ним кнопку, то есть описывается, например, следующей
схемой:

```xml
<RelativeLayout xmlns:android="http://schemas.android.com/apk/res/android"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    android:orientation="horizontal" >

    <LinearLayout
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:layout_alignParentLeft="true">

        <ImageView
            android:id="@+id/usericon"
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:src="@drawable/user" />

        <TextView
            android:id="@+id/nickname"
            android:textSize="16sp"
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:singleLine="true" />
    </LinearLayout>

    <LinearLayout
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:layout_alignParentRight="true">

        <Button
            android:id="@+id/msg_btn"
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:text="@string/button_msg"
            android:focusable="false"
            android:clickable="true" />

    </LinearLayout>

</RelativeLayout>
```

При взаимодействии с таким списком в режиме исследования касанием мы
можем устанавливать фокус доступности как на сами элементы списка, так
и на сопровождающие их кнопки.

Предположим далее, что помимо списка на экране отображается еще некая
постоянно меняющаяся информация. Упрощенная схема выглядит примерно
следующим образом:

```xml
<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    android:orientation="vertical" >

    <ListView
        android:id="@+id/user_list"
        android:layout_width="match_parent"
        android:layout_height="wrap_content" />

    <TextView
        android:id="@+id/count_state"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:text="0"
        android:singleLine="true" />

</LinearLayout>
```

И, по установившейся уже традиции, будем производить ежесекундные
обновления:

```java
public class MainActivity extends Activity {

    private int counter;
    private CountDownTimer updateTimer;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        counter = 0;

        updateTimer = new CountDownTimer(10000, 1000) {

                @Override
                public void onTick(long millisUntilFinished) {
                    ((TextView)findViewById(R.id.count_state)).setText(String.valueOf(++counter));
                }

                @Override
                public void onFinish() {
                    start();
                }
            };

        updateTimer.start();
    }

}
```

В этой ситуации проблема возникает тогда, когда фокус доступности
попадает на одну из кнопок внутри списка. Дело в том, что после
обработки событий, возникающих при обновлении информации на экране,
служба специального доступа восстанавливает его положение _на элементе
списка, а не на кнопке_. В результате оказывается крайне трудно, а при
более частых обновлениях и вовсе невозможно, нажать на кнопку в режиме
невизуального доступа. И блокировка событий, рассмотренная в
предыдущем пункте, здесь, увы, не помогает.

Для борьбы с этой неприятностью несколько расширим функциональность
нашего вспомогательного класса:

```java
public class AccessibilityAssistant extends AccessibilityDelegate {

    private final Activity hostActivity;
    private volatile boolean eventsLocked;

    // Нам надо знать когда режим специального доступа
    // действительно используется
    private final AccessibilityManager accessibilityService;

    // Этот флаг устанавливается тогда, когда обновление информации на экране
    // может болезненно отразиться на положении фокуса доступности.
    private volatile boolean discourageUiUpdates;

    public AccessibilityAssistant(Activity activity) {
        hostActivity = activity;
        accessibilityService = (AccessibilityManager) activity.getSystemService(Context.ACCESSIBILITY_SERVICE);
        discourageUiUpdates = false;
        eventsLocked = false;
    }

    // Мы не рекомендуем обновлять экран, если это может сбить фокус доступности,
    // но лишь тогда, когда режим специального доступа действительно используется.
    public boolean isUiUpdateDiscouraged() {
        return discourageUiUpdates && accessibilityService.isEnabled();
    }

    public void lockEvents() {
        eventsLocked = true;
    }

    public void unlockEvents() {
        if (!hostActivity.getWindow().getDecorView().post(new Runnable() {
                @Override
                public void run() {
                    eventsLocked = false;
                }
            }))
            eventsLocked = false;
    }

    @Override
    public void sendAccessibilityEvent(View host, int eventType) {
        // Следим за тем, когда фокус доступности попадает на кнопки.
        if (host instanceof Button)
            checkEvent(eventType);
        if (!eventsLocked)
            super.sendAccessibilityEvent(host, eventType);
    }

    @Override
    public void sendAccessibilityEventUnchecked(View host, AccessibilityEvent event) {
        // Следим за тем, когда фокус доступности попадает на кнопки.
        if (host instanceof Button)
            checkEvent(event.getEventType());
        if (!eventsLocked)
            super.sendAccessibilityEventUnchecked(host, event);
    }

    // Реакция на события, связанные с перемещением фокуса доступности
    private void checkEvent(int eventType) {
        switch (eventType) {
        case AccessibilityEvent.TYPE_VIEW_ACCESSIBILITY_FOCUSED:
            discourageUiUpdates = true;
            break;
        case AccessibilityEvent.TYPE_VIEW_ACCESSIBILITY_FOCUS_CLEARED:
            discourageUiUpdates = false;
            break;
        default:
            break;
        }
    }

}
```

И будем избегать обновления информации на экране при попадании фокуса
доступности на встроенные в список кнопки, но, разумеется, лишь тогда,
когда используется режим невизуального доступа:

```java
public class MainActivity extends Activity {

    private AccessibilityAssistant accessibilityAssistant;
    private ArrayAdapter userListAdapter;
    private CountDownTimer updateTimer;
    private int counter;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        accessibilityAssistant = new AccessibilityAssistant(this);
        counter = 0;

        userListAdapter = new ArrayAdapter(this, R.layout.item_user) {
                @Override
                public View getView(int position, View convertView, ViewGroup parent) {
                    if (convertView == null)
                        convertView = LayoutInflater.from(getContext()).inflate(R.layout.item_user, null);
                    User user = getItem(position);
                    TextView nickname = (TextView) convertView.findViewById(R.id.nickname);
                    Button button = (Button) convertView.findViewById(R.id.msg_btn);
                    nickname.setText(user.nickname);
                    if (user.stateOnline) {
                        convertView.setBackgroundColor(Color.rgb(133, 229, 141));
                        nickname.setContentDescription(getString(R.string.user_state_online, user.nickname));
                    }
                    else {
                        convertView.setBackgroundColor(Color.rgb(0, 0, 0));
                        nickname.setContentDescription(null);
                    }

                    // Мы собираемся следить за тем,
                    // когда фокус доступности попадает на кнопку.
                    button.setAccessibilityDelegate(accessibilityAssistant);

                    convertView.setAccessibilityDelegate(accessibilityAssistant);
                    return convertView;
                }
            };

        updateTimer = new CountDownTimer(10000, 1000) {

                @Override
                public void onTick(long millisUntilFinished) {
                    // Выполняем обновление лишь тогда,
                    // когда это не повредит доступности
                    // или когда режим специального доступа не используется.
                    if (!accessibilityAssistant.isUiUpdateDiscouraged())
                        ((TextView)findViewById(R.id.count_state)).setText(String.valueOf(++counter));
                }

                @Override
                public void onFinish() {
                    start();
                }
            };

        updateTimer.start();
    }

}
```

Замечу, что это единственный из приведенных здесь рецептов, имеющий
видимые последствия. То есть, при попадании фокуса доступности на
некоторые элементы интерфейса обновления экрана будут замирать. Но
происходить это будет лишь в режиме специального доступа. В обычном же
режиме _никаких_ побочных явлений не будет.


## События на невидимых страницах

Рассмотрим еще один интересный случай, а именно, использование
переключаемых вкладок (или страниц):

```xml
<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    android:orientation="vertical" >

    <android.support.v4.view.ViewPager
        android:id="@+id/pager"
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:layout_weight="1.0" >

        <android.support.v4.view.PagerTitleStrip
            android:id="@+id/pager_title_strip"
            android:layout_width="match_parent"
            android:layout_height="wrap_content"
            android:layout_gravity="top"
            android:background="#33b5e5"
            android:paddingBottom="4dp"
            android:paddingTop="4dp"
            android:textColor="#fff" />

    </android.support.v4.view.ViewPager>

</LinearLayout>
```

Дело в том, что ради гладкого переключения страниц, система держит в
рабочем состоянии не только ту, которая отображается на экране, но и
соседние с ней. И в случае обновления информации на этих соседних
страницах, находящихся за пределами видимой области, вырабатываются
соответствующие события для службы специального доступа. Происходит
это порою и при переходе от одной страницы к другой, когда система
готовит следующую и события инициируются уже с нее. В результате
речевой отклик не соответствует тому, что отображается на экране.

Чтобы избавиться от этого нежелательного эффекта, вспомним о том, что
решение об инициации события для службы специального доступа
принимается на верхнем уровне иерархии, и разовьем наш вспомогательный
класс следующим образом:

```java
public class AccessibilityAssistant extends AccessibilityDelegate {

    private final Activity hostActivity;
    private final AccessibilityManager accessibilityService;

    // Все контролируемые страницы
    private SparseArray<View> monitoredPages;

    // Страница, видимая в данный момент
    private View visiblePage;

    // Номер видимой страницы
    private int visiblePageId;

    private volatile boolean discourageUiUpdates;
    private volatile boolean eventsLocked;

    public AccessibilityAssistant(Activity activity) {
        hostActivity = activity;
        accessibilityService = (AccessibilityManager) activity.getSystemService(Context.ACCESSIBILITY_SERVICE);

        monitoredPages = new SparseArray<View>();
        visiblePage = null;
        visiblePageId = 0;

        discourageUiUpdates = false;
        eventsLocked = false;
    }

    public boolean isUiUpdateDiscouraged() {
        return discourageUiUpdates && accessibilityService.isEnabled();
    }

    public void lockEvents() {
        eventsLocked = true;
    }

    public void unlockEvents() {
        if (!hostActivity.getWindow().getDecorView().post(new Runnable() {
                @Override
                public void run() {
                    eventsLocked = false;
                }
            }))
            eventsLocked = false;
    }

    // Каждая страница должна регистрироваться при помощи этого метода
    // в момент своего возникновения. Это логично делать, например,
    // в методе onCreateView() или onViewCreated() соответствующего фрагмента.
    public void registerPage(View page, int id) {
        monitoredPages.put(id, page);
        if (id == visiblePageId)
            visiblePage = page;
        page.setAccessibilityDelegate(this);
    }

    public void setVisiblePage(int id) {
        visiblePageId = id;
        visiblePage = monitoredPages.get(id);
    }

    @Override
    public boolean onRequestSendAccessibilityEvent(ViewGroup host, View child, AccessibilityEvent event) {
        return ((monitoredPages.indexOfValue(host) < 0) || (host == visiblePage)) && super.onRequestSendAccessibilityEvent(host, child, event);
    }

    @Override
    public void sendAccessibilityEvent(View host, int eventType) {
        if (host instanceof Button)
            checkEvent(eventType);
        if (!eventsLocked)
            super.sendAccessibilityEvent(host, eventType);
    }

    @Override
    public void sendAccessibilityEventUnchecked(View host, AccessibilityEvent event) {
        if (host instanceof Button)
            checkEvent(event.getEventType());
        if (!eventsLocked)
            super.sendAccessibilityEventUnchecked(host, event);
    }

    private void checkEvent(int eventType) {
        switch (eventType) {
        case AccessibilityEvent.TYPE_VIEW_ACCESSIBILITY_FOCUSED:
            discourageUiUpdates = true;
            break;
        case AccessibilityEvent.TYPE_VIEW_ACCESSIBILITY_FOCUS_CLEARED:
            discourageUiUpdates = false;
            break;
        default:
            break;
        }
    }

}
```

Теперь остается только вовремя сообщать о смене страниц:

```java
public class MainActivity extends Activity implements ViewPager.OnPageChangeListener {

    private AccessibilityAssistant accessibilityAssistant;
    private ViewPager viewPager;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        accessibilityAssistant = new AccessibilityAssistant(this);
        viewPager = (ViewPager) findViewById(R.id.pager);
        viewPager.setOnPageChangeListener(this);
    }

    @Override
    public void onPageScrolled(int position, float positionOffset, int positionOffsetPixels) {
    }

    @Override
    public void onPageSelected(int position) {
        accessibilityAssistant.setVisiblePage(position);
    }

    @Override
    public void onPageScrollStateChanged(int state) {
    }
}
```

А каждый фрагмент, отвечающий за страницу, должен ее зарегистрировать:

```java
public class PageFragment extends Fragment {
    @Override
    public void onViewCreated(View view, Bundle savedInstanceState) {
        ((MainActivity)getActivity()).accessibilityAssistant.registerPage(view, PAGE_NUMBER);
        super.onViewCreated(view, savedInstanceState);
    }
}
```

Параметр `PAGE_NUMBER` здесь на самом деле означает позиционный номер
страницы. То же самое, что и параметр метода
[FragmentPagerAdapter.getItem()](https://developer.android.com/reference/android/support/v4/app/FragmentPagerAdapter.html#getItem(int)).


## Заключение

Может показаться, что изложенные здесь приемы в большинстве своем
имеют целью не помочь, а как раз помешать системе специального доступа
донести ту или иную информацию до сознания пользователя. В сущности,
так оно и есть. Но избыток информации иногда вредит не меньше, чем ее
недостаток. Особенно когда она явно лишняя и к делу не относится. Я не
устаю повторять, что хороший речевой интерфейс должен говорить как
можно меньше, но обязательно своевременно и всегда по-существу.

Встроенный в Android screenreader
[TalkBack](https://play.google.com/store/apps/details?id=com.google.android.marvin.talkback),
увы, от совершенства пока далек и, к сожалению, развивается куда менее
динамично, нежели
[accessibility API](https://developer.android.com/guide/topics/ui/accessibility/index.html)
в самой системе. Участие же сообщества в его развитии затруднено тем,
что [публикуемые исходники](https://github.com/google/talkback)
как правило неактуальны, а команда разработчиков попросту игнорирует
обращения энтузиастов и конструктивные предложения.

Однако эта тема, заслуживающая отдельного рассмотрения, лежит за
рамками данного сочинения. Я же хотел лишь обратить внимание
разработчиков приложений на проблему их доступности и, с одной
стороны, развеять некоторые бытующие опасения, с другой же, показать
как путем несложных телодвижений можно порой существенно улучшить
ситуацию. Надеюсь, мне это хоть в какой-то мере удалось.
