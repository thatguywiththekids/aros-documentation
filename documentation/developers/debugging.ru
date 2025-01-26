===========================
Руководство по отладке AROS
===========================

:Авторы:    David Le Corfec
:Copyright: Copyright © 2004, The AROS Development Team
:Версия:    $Revision$
:Дата:      $Date$
:Статус:    Не завершено.

Это руководство объясняет различные возможности по поиску и устранению
неисправностей в AROS. 
 
.. Содержание::

--------
Введение
--------

Для большинства разработчиков простейший способ написания и отладки
заключается в использовании hosted-версии AROS, портированной под Linux (что
встречается наиболее часто) или BSD. В этом случае вы сможете пользоваться в
Linux отладчиком GDB для поиска и устранения ошибок в AROS. Для этого перед
компилированием AROS вам понадобится ввести для скрипта конфигурации ключ
``--enabe-debug``. Будьте внимательны, отладочная информация может значительно
увеличить место, занимаемое AROS на диске.

Разработчикам, работающим с аппаратурой на низком уровне, вероятно, удобнее будет
использовать вывод отладочной информации на последовательный порт.

Разработчики приложений должны гарантировать, что их программы после завершения
работы высвобождают все занимаемые ими ресурсы системы. AROS предоставляет для
этого некоторые инструменты.

---------------------------
Вывод отладочных операторов
---------------------------

 ::

    #define DEBUG 1
    #include <aros/debug.h>
    ...
    D(bug("value1=%ld, path=%s", value, path));

Если значение ``DEBUG`` равно 0 или неопределено, то результатом раскрытия
``D()`` будет ничто. Для принудительного вывода отладочной информации вне
зависимости от того, каково значение ``DEBUG`` используйте функцию ``bug()``
отдельно . Синтаксис такой же, как и у функции ``printf()``. В hosted-версии,
вывод будет производиться на ту консоль, в которой была запущена AROS.

-----------------------------------------------
Hosted-версия AROS: использование отладчика GDB
-----------------------------------------------

Вы можете либо запустить AROS в GDB, либо использовать GDB после того, как AROS
завершит работу и оставит дамп памяти. Не забудьте, что перед этим необходимо
компилировать AROS с опцией отладки (``./configure --enable-debug``).


Отладка в реальном времени
==========================

Запустите GDB как показано ниже::

    > cd /AROS/bin/linux-i386/AROS/
    > gdb aros
    GNU gdb 6.0-debian
    Copyright 2003 Free Software Foundation, Inc.
    GDB is free software, covered by the GNU General Public License, and you are
    welcome to change it and/or distribute copies of it under certain conditions.
    Type "show copying" to see the conditions.
    There is absolutely no warranty for GDB.  Type "show warranty" for details.
    This GDB was configured as "i386-linux"...
    (gdb) 

Затем запустите AROS для отладки в GDB::

    (gdb) r
    Starting program: /AROS/bin/linux-i386/AROS/aros 
    (...далее большое количество отладочной информации...)
    
Вы можете передавать AROS аргументы, записывая их после команды ``r``.
Используйте сочетание клавиш Ctrl-C в консоли для прерывания работы AROS и
возврата обратно в командную строку GDB. Команда ``help`` предназначена для
вывода справки, а ``q`` - для выхода.


Отладка по дампу памяти
=======================

Во-первых, вам надо включить создание дампа памяти, например, используя параметр
ulimit оболочки bash. После этого запустите AROS и сгенерируйте дамп памяти::

    > cd /AROS/bin/linux-i386/AROS/
    > ulimit -c unlimited # см. руководство оболочки для включения дампа памяти
    > ./aros
    Quit (core dumped)

Теперь запустите GDB, задав имена исполняемого файла AROS и файла дампа::

    > gdb aros core
    GNU gdb 6.0-debian
    Copyright 2003 Free Software Foundation, Inc.
    GDB is free software, covered by the GNU General Public License, and you are
    welcome to change it and/or distribute copies of it under certain conditions.
    Type "show copying" to see the conditions.
    There is absolutely no warranty for GDB.  Type "show warranty" for details.
    This GDB was configured as "i386-linux"...
    Core was generated by `aros'.
    Program terminated with signal 3, Quit.
    Reading symbols from /usr/X11R6/lib/libX11.so.6...done.
    Loaded symbols for /usr/X11R6/lib/libX11.so.6
    Reading symbols from /usr/X11R6/lib/libXext.so.6...done.
    Loaded symbols for /usr/X11R6/lib/libXext.so.6
    Reading symbols from /lib/libc.so.6...done.
    Loaded symbols for /lib/libc.so.6
    Reading symbols from /lib/libdl.so.2...done.
    Loaded symbols for /lib/libdl.so.2
    Reading symbols from /lib/ld-linux.so.2...done.
    Loaded symbols for /lib/ld-linux.so.2
    #0  0x40125607 in sigsuspend () from /lib/libc.so.6
    (gdb)


GDB (основные команды)
======================

Команда ``help`` вызывает справку по всем командам GDB. Её можно вызывать либо
вызвав список известных справочных статей, либо найдя по разделу или названию
(или даже по аббревиатуре) команды.

Прямо в режиме отладки вы можете получить пригодную для чтения справку по всем
командам, которые кратко описаны далее.

Команда ``bt`` (backtrace) выводит все отслеженные кадры стека всех активных
подпрограмм. Далее показан пример отслеживания после прерывания AROS по нажатию
Ctrl-C в консоли GDB::

    Program received signal SIGINT, Interrupt.
    0x40125607 in sigsuspend () from /lib/libc.so.6
    (gdb) bt
    #0  0x40125607 in sigsuspend () from /lib/libc.so.6
    #1  0x080531d5 in idleTask (sysBase=0x40231290) at idletask.c:23
    #2  0x08052ba7 in Exec_NewAddTask (task=Cannot access memory at address 0x8
    ) at newaddtask.c:280
    Previous frame inner to this frame (corrupt stack?)
    (gdb) 

Здесь #0 является внутренним кадром.

Для вывода значения выражения доступного из текущего кадра, используйте команду
``p`` (print)::

    (gdb) p SysBase
    $1 = (struct ExecBase *) 0x40231290

GDB обладает очень мощными командами вывода отладочной информации.
Он понимает снтаксис языка Си, поэтому вы можете вывести любое допустимое
выражение::

    (gdb) p SysBase->IntVects[2]
    $2 = {iv_Data = 0x0, iv_Code = 0x8052f30 <SoftIntDispatch>, iv_Node = 0x4023c528}

Вы также можете использовать ``print`` в качестве 16-ричного калькулятора::

    (gdb) p 0x42 + 0xc0de
    $1 = 49440

Для вывода результата в 16-ричном виде используйте ``p/x`` (при этом вы можете
вызвать предыдущее выражение)::

    (gdb) p/x $1
    $2 = 0xc120

Для перемещения между кадрами используйте команду ``f`` (frame)::

    (gdb) f 1
    #1  0x080531d5 in idleTask (sysBase=0x40231290) at idletask.c:23
    23              sigsuspend(&sigs);

Для вывода следующих 10-ти строк кода служит команда ``l`` (list), которая также
может использоваться для вывода определенной строки.

Если вы отлаживаете программу в реальном времени:

+ Для продолжения выполнения (или перезапуска с начала) программы до того момента
  как вы её прервёте, или по достижению точки останова, или при сбое программы, 
  используйте команду ``r`` (run) с дополнительными параметрами, которые будут
  передаваться программе;

+ Для пошагового выполнения программы используйте команды ``s`` (step) или ``n``
  (next) (вторая из них выполненит вызов подпрограммы за один шаг);

+ Для установки точки останова введите команду ``b`` и номер строки или функции;

+ Для продолжения выполнения программы в отладчике служит команда ``c``.

Используйте команду ``q`` для выхода из GDB::

    (gdb) q
    The program is running.  Exit anyway? (y or n) y
    >

Специфичные для AROS команды GDB 
================================

Специфичные для AROS команды GDB находятся в файле ``/AROS/_gdbinit``, который
устанавливается в ``/AROS/bin/linux-i386/AROS/.gdbinit``.

Этот файл прочитывается отладчиком GDB при запуске и содержит следующие команды::

    findaddr - показывает модуль, который содержит данный адрес
    thistask - выводит информацию о запущенной в данный момент задаче.
    liblist - список загруженых в системе библиотек
    devlist - список действующих в системе устровйств
    resourcelist - список ресурсов системы в данный момент
    residentlist - список резидентных программ в системе
    taskready - список задач готовых к запуску
    taskwait - список задач, ожидающих какого-либо события
    modlist - список всех модулей в текущий момент загруженных в память
    printtaglist - выводит данный список тегов

В этом списке ``findaddr`` необходима для правильной отладки кода в изменяемой
памяти (совместно используемых библиотек, приложений...)

Использование команды findaddr
------------------------------

Наиболее часто вам будет необходимо отлаживать библиотеки или приложения, но
при необходимости команда ``backtrace`` выдаст вам один или больше 
не отслеженных адресов::

    Core was generated by `aros'.
    Program terminated with signal 11, Segmentation fault.
    Reading symbols from /usr/X11R6/lib/libX11.so.6...done.
    Loaded symbols for /usr/X11R6/lib/libX11.so.6
    Reading symbols from /usr/X11R6/lib/libXext.so.6...done.
    Loaded symbols for /usr/X11R6/lib/libXext.so.6
    Reading symbols from /lib/libc.so.6...done.
    Loaded symbols for /lib/libc.so.6
    Reading symbols from /lib/libdl.so.2...done.
    Loaded symbols for /lib/libdl.so.2
    Reading symbols from /lib/ld-linux.so.2...done.
    Loaded symbols for /lib/ld-linux.so.2
    #0  0x080c8830 in Intuition_SetAttrsA (object=0x317ceb, tagList=0x402f7504, 
        IntuitionBase=0x40289dfc) at setattrsa.c:84
    84          result = DoMethodA (object, (Msg)&ops);
    (gdb) bt
    #0  0x080c8830 in Intuition_SetAttrsA (object=0x317ceb, tagList=0x402f7504, 
        IntuitionBase=0x40289dfc) at setattrsa.c:84
    #1  0x402bd919 in ?? ()
    #2  0x00317ceb in ?? ()
    #3  0x402f7504 in ?? ()
    #4  0x40289dfc in ?? ()
    #5  0x8042bfe0 in ?? ()
    #6  0x404ca36c in ?? ()

В этом случае используйте ``findaddr`` для любого адреса, который вы хотите
отследить (возможно, даже наиболее глубоко вложенного)::

    (gdb) findaddr 0x402bd919
    Searching in the loaded modules...
    Address found in System:Tests/Zune/list1, which is loaded at 0x402bd454.
    If this is an executable, its .text section starts at 0x402bd460

Затем воспользуйтесь командой ``add-symbol-file`` для загрузки таблицы символов
по указанному адресу секции .text исполняемого модуля::

    (gdb) add-symbol-file Tests/Zune/list1 0x402bd460
    add symbol table from file "Tests/Zune/list1" at
            .text_addr = 0x402bd460
    (y or n) y
    Reading symbols from Tests/Zune/list1...done.

Теперь снова попробуем отследить адреса::

    (gdb) bt
    #0  0x080c8830 in Intuition_SetAttrsA (object=0x317ceb, tagList=0x402f7504, 
        IntuitionBase=0x40289dfc) at setattrsa.c:84
    #1  0x402bd919 in main () at list1.c:107
    #2  0x402bd5d1 in __startup_entry (argstr=0x402bcd24 "\n", argsize=1, 
        sysbase=0x40232290) at startup.c:102
    #3  0x080580a7 in Dos_RunProcess (proc=0x403f76f0, sss=0x403daac4, 
        argptr=0x402bcd24 "\n", argsize=1, entry=0x402bd458, DOSBase=0x402a6888)
        at runprocess.c:123
    #4  0x0806a1c7 in Dos_RunCommand (segList=0x402bd454, stacksize=40960, 
        argptr=0x402bcd24 "\n", argsize=1, DOSBase=0x402a6888) at runcommand.c:107
    #5  0x40400461 in ?? ()
    #6  0x402bd454 in ?? ()
    #7  0x0000a000 in ?? ()
    #8  0x402bcd24 in ?? ()
    #9  0x00000001 in ?? ()
    #10 0x402a6888 in ?? ()

Таким образом похоже, что вы нашли ошибку::

    (gdb) f 1
    #1  0x402bd919 in main () at list1.c:107
    107             set(3243243, MUIA_Window_Open, TRUE);

Повторите операции для оставшихся адресов, которые вы хотите отследить.

Использование команды thistask
------------------------------

Эта команда выводит некоторую информацию о запущенной в данный момент задаче.
Эти данные вы также можете найти в ``SysBase->ThisTask``::

    (gdb) thistask 
    Task     SigWait  SigRecvd StkSize   StkUsed Pri Type Name
    -----------------------------------------------------------------------------
    40231fb8 00000000 00000000    40960      872 -128    1 Idle Task

Подсказки и хитрости
====================

Вызываемое программой прерывание на i386
----------------------------------------

Если вы вставите фрагмент::

    asm("int $3");

в код на Си, то обработка исключительной ситуации будет произведена во время
выполнения программы. Когда программа запущена в GDB, это может пригодиться для
перехода в интерактивный режим отладки при достижении определённых условий::

    if (byteSize == 112)
        asm("int $3");

--------------------
Трассировка ресурсов
--------------------

Трассировка ресурсов в том виде, как она есть в других операционных системах,
пока не доступна для AROS, поэтому вам самостоятельно надо внимательно следить
за высвобождением ресурсов. Здесь вы найдёте некоторые инструменты, которые
помогут вам проверить вашу программу.

Трассировка памяти при помощи Mungwall
======================================

Если AROS скомпилирована с ключом ``--enable-debug``, то отладчик Mungwall
включен. При этом создается небольшая область памяти до и после области, 
занимаемой вашей программой для проверки отсутствия записи вне границ отведённой
программе области. Эта проверка происходит во время процесса выделения памяти, 
или в любое время вызовом ``AvailMem(MEMF_CLEAR)``.

Команда ``CheckMem`` в командной строке просто вызывает эту функцию и выводит
результат на заданное для отладчика устройство вывода (последовательный порт для
native-версии, консоль для hosted-версии). Если выход за допустимые границы
выделенной памяти не обнаружен, то будет выведено текущее количество случаев 
выделения памяти и её суммарный объём::

    === MUNGWALL MEMORY CHECK ============
    
    Num allocations: 1579   Memory allocated 3333326

LeakWatch
=========

Это простой, но полезный инструмент. Он отслеживает всю память и исполняемые
объекты Exec: библиотеки, устройства, шрифты, ресурсы, порты и семафоры. Он 
запускает очистку памяти от объектов, которые не используются, для вывода 
реального количества памяти после того, как некоторые ресурсы будут закрыты.

Запустите ``LeakWatch`` в его собственной оболочке, используя следующие
сочетания клавиш:

+ ``Ctrl-C`` для выхода
+ ``Ctrl-D`` для вывода текущего состояния ресурсов
+ ``Ctrl-E`` для вывода ресурсов, изменившихся с момента запуска LeakWatch
+ ``Ctrl-F`` для вывода ресурсов, изменившихся с последнего нажатия ``Ctrl-F``

``Ctrl-F`` является наиболее полезным сочетанием, если нажать его перед запуском
программы, а затем - после. В норме будет показано, что между нажатиями ресурсы 
не были заняты. 
В противном случае:

+ Проверьте, не занимали ли ресурсы другие программы в течение этого времени.
+ Повторите запуск. Смотрите, нет ли утечек ресурсов.
+ Ограничьте место, где имеет место утечка мысленно ограничив возможности, 
  которые вы используете в программе, а потом закомментировав эту часть 
  исходного кода.

Если вы думаете, что ваша программа инициирует утечку в библиотеке AROS, то
найдите существующую или напишите небольшую тестовую программу, приводящую к
возникновению утечки, чтобы убедиться, что утечка действительно возникает в
библиотеке.

Различные инструменты командного интерпретатора
===============================================

Также есть упрощённые инструменты для отладки, которые можно найти на ``C:``.

Оболочка AROS
-------------

Введите ``set __debug_mem`` в командной строке для включения вывода информации о
доступной памяти до и после выполнения каждой команды, а также информации об
изменениях памяти. Очень похоже на ``LeakWatch``, но только для памяти.

Avail
-----

Используйте ``Avail`` для вывода информации о памяти. Параметр FLUSH удалит из
памяти неиспользуемые объекты.

Liblist
-------

Показывает список открытых в данный момент библиотек и некоторую информацию о
них, вроде версии и счётчика открытий.

Devlist
-------

Тоже что и ``Liblist``, только для устройств.

Подсказки и хитрости
====================

Проверка Mungwall в планировщике
--------------------------------

Полезной хитростью при использовании ``Mungwall`` является настройка
планировщика на вызов ``AvailMem(MEMF_CLEAR)`` при каждом переключении задач,
если вы видите странное повреждение памяти, но не можете отследить его другими
способами. Проверка памяти будет производиться после каждой отработки каждой 
задачей своего кванта времени. Это происходит медленно, но в этом случае 
подозреваемому не уйти.

Утечки памяти
-------------

+ Установите, насколько много памяти утекает и как много её распределено: для получения
  размера утечки и количества размещений запустите ``checksum`` до и после
  запуска подозрительной программы, затем вычтите размер загруженных данных (не
  забудьте очистить перед каждым ``checksum``, это делается автоматически, если
  установлен ``__debug_mem``).

+ Будте внимательны по отношению к побочным эффектам Mungwall'a:
  96 байт добавляются к каждому размещению. Только ``checksum`` даст вам
  истинные размеры размещения.

+ Память выделена функцией ``AllocVec()`` или ``AllocMem()``? Добавьте несколько
  байт к размеру ``AllocVec`` распределяемой при старте ``rom/exec/allocvec.c`` 
  и проверьте, изменится ли соответствующим образом размер утечки.

+ Попытайтесь определить размещение утечки в памяти вставкой в код
  отслеживаемого исключения (``asm("int $3")`` для платформы i386) в
  определённое место размещения в ``rom/exec/allocvec.c`` или
  ``rom/exec/allocmem.c``. Конечно, для этого вам понадобится запустить вашу 
  программу в GDB. Используйте ``bt`` и другие команды GDB для определения 
  причины каждого подозрительного размещения.

+ Если вы нашли возможное место утечки, измените его размер выделения
  (например, добавьте символьный массив в конец размещаемой в памяти структуры)
  и проверьте, увеличится ли соответствующим образом размер утечки. 
