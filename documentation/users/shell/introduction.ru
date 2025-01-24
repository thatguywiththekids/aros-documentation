=====================
Введение в AROS Shell
=====================

:Authors:   Matthias Rustler 
:Copyright: Copyright Љ 2006, The AROS Development Team
:Version:   $Revision$
:Date:      $Date$
:Status:    Draft

-------------

`Index <index>`_

-------------

AROS так же обладает интерфейсом командной строки, 'Shell'. 
Его можно запустить через меню Wanderer>Shell. При этом открывается окно с
косандной строкой и путём текущего открытого окна AROS. Подсказка обычно показывает номер запущенной оболочки Shell и текущий путь.

Оболочка имеет историю команд, которую можно просмотреть курсорными клавишами
"вверх" и "вниз".

Также предусмотрена возможность автозавершения. Если написать первые символы команды или имени файла и нажать клавишу табуляции TAB, то Оболочка производит поиск соответствующих имен. При нахождении нескольких совпадений, открывается дополнительное окно для выбора имени.

Команды и мена файлов в AROS нечувствительны к регистру. Можно даже использовать символы смешанных регистров.

AROS будет искать команду в текущей директории и в пути поиска.
Путь поиска можно просмотреть или изменить командой `path <path>`_ 

Некоторые важные команды
------------------------
+ `CD <cd>`_ -- сменить директорию
+ `DIR <dir>`_ -- показать содержимое директории
+ `COPY <copy>`_ -- скопировать файлы и директории
+ `DELETE <delete>`_ -- удалить файлы и директории
+ `INFO <info>`_ -- показать доступные имена дисков
+ `MAKEDIR <makedir>`_ -- создать директорию
+ `RENAME <rename>`_ -- переименовать файлы и директории
+ `TYPE <type>`_ -- показать содержимое текстового файла

Путь
----
Абсолютные пути начинаются с имени устройства и двоеточия(:), директории разделяются наклонной чертой (/).
Имя диска может быть именем устройства (dh0:), именем тома (workbench:) или
логическим диском (см. команду `assign <assign>`_).

::
  
  Пример: dh0:dir1/dir2/file.dat

Если аргументом комады должен быть текущий путь, можно просто написать "".

::

  Пример: copy from ram:x to ""
  
Одно двоеточие означает начальную директорию текущего пути. Если путь начинается с двоеточия, тогда он берется по отношению к начальной директории заданного пути.

Наклонная черта в начале пути означает переход на уровень вверх, две - на два уровня и т.д. 

Если путь содержит пробелы, он должен быть заключен в двойные кавычки.

::

  Пример: type "имя с пробелами"

Шаблон команд
-------------
Знак вопроса после команды показывает шаблон параметров команды.
После вывода команда ожидает ввода параметров, ввод пустой строки равносилен
запуску комады без параметров.

::

  Пример: copy ?
  FROM/M,TO/A,ALL/S,QUIET/S,BUF=BUFFER/K/N,CLONE/S,DATES/S,NOPRO/S,COM/S,NOREQ/S

Ключи могут иметь следующие варианты::

  /A -- требуется аргумент
  /K -- ключ следует писать при использовании этого аргумента
  /S -- переключатель; имя переключателя включает опцию
  /N -- численный аргумент
  /M -- требуется аргумент, возможны несколько аргументов
  /F -- rest of command line
  =  -- сокращение; используется опционально

При вызове команды '=' можно использовать для чёткого разделения ключа и значения::

  Пример: copy from=a.dat to=b.dat
  
Шаблоны имён
------------
Некоторые команды позволяют использовать шаблоны в именах параметров::

  ?  -- один произвольный символ
  #? -- ноль и более произвольных символов
  #x -- ноль и более x
  ~  -- отрицание
  |  -- ИЛИ
  () -- группа
  [] -- диаппазон

Примеры::

  dir #?.info
  dir #?~(.info)
  dir a(b|c)d
  dir [a-c]e

Перенаправление
---------------

::

  > перенаправляет вывод в файл или устройство
  >> перенаправляет вывод и добавляет в конец файла
  < перенаправляет вывод из файла или устройства
  Пример: dir >ram:a 

Pipe
----
Для перенаправления вывода из одной команды в другую можно использовать поток. 
При этом команды соединяются символом \|. Необходимо ввести хотя бы один пробел
до и после \|::

  Пример: dir | othercommand
  
А если вторая команда ожидает ввода из файла ? В этом случае можно использовать 
виртуальное устройство 'in:'::

  Пример: dir | more in:  

Специальные устройства
----------------------
+ ram: Этот ram-диск можно использовать как жёсткий диск, но после перезагрузки его содержимое будет утеряно.
+ nil: если вы не хотите, чтобы сообщения команды попадали на экран, можно использовать устройство 'nil:'. Пример: delete #? >nil:

Запуск в фоновом режиме
-----------------------
Обычно команда занимает Оболочку до тех пор, пока не завершится. Команды
можно запускать в фоне командой `run <run>`_.

::

  Пример: run delete #?

Info-файлы
----------
Файлы с расширением '.info' играют важную роль в Wanderer. Они содержат иконку и некоторую дополнительную информацию. При работе с Оболочкой их необходимо принимать во внимание.

