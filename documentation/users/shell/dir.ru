===
Dir
===

.. This document is automatically generated. Don't edit it!

`Index <index>`_ `Prev <delete>`_ `Next <echo>`_ 

---------------

::

 Dir [(dir | pattern)] [OPT A | I | D | F] [ALL] [DIRS] [FILES] [INTER]

Шаблон
~~~~~~
::


 DIR,OPT/K,ALL/S,DIRS/S,FILES/S,INTER/S


Расположение
~~~~~~~~~~~~
::


 Workbench:C


Функции
~~~~~~~
::


 DIR показывает файлы и директории, расположенные в текущей или указанной
 директории. Директории перечисляются первыми, далее в алфавитном порядке
 в две колонки перечисляются файлы. Нажатие CTRL-C прекращает вывод информации.
 


Ввод
~~~~
::


 ALL    --  Показывать рекурсивно все поддиректории и их файлы.
 DIRS   --  Показывать только директории.
 FILES  --  Показывать только файлы.
 INTER  --  Включить интерактивный режим.

            Интерактивный режим перечисления останавливается после каждого
            выведенного имени и выдаёт вопрос, в ответ на который можно вводить 
            команды. Перечислим их:
            
            Return      --  Перейти к следующему файлу/директории.
            E/ENTER     --  Войти в директорию.
            DEL/DELETE  --  Удалить файл или пустую директорию.
            C/COM       --  Позволяет сделать файл или директорию вводом 
                            для команды DOS (указанную после C или COM,
                            или отдельно указанную после ввода).
            Q/QUIT      --  Выйти из интерактивного режима.
            B/BACK      --  Вернуться в директорию ниже уровнем.
