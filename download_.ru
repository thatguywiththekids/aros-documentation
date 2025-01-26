==================
Загрузки(Download)
==================

.. Contents::

Дистрибутивы
============

Дистрибутивы являются протестированными и преднастроенными версиями AROS,
содержащими определенное количество дополнительных программ. Они могут
иметь не самые новые системные файлы, но их стабильность и дружелюбность к
пользователю значительно выше, чем у ночных сборок. Если вы - пользователь,
стремящийся узнать, что из себя представляет AROS, дистрибутивы помогут 
вам получить наиболее полное впечатление.

VmwAROS
-------
VmwAROS распространяется в виде файла-образа жёсткого диска, который может
быть использован в семействе программных продуктов для виртуализации VmWare
(`Player`__, Fusion, Server, Workstation). Дистрибутив содержит предустановленные
программы, такие как клиент электронной почты, текстовый редактор, редактор 
изображений, интегрированную среду разработки, набор компиляторов, обозреватель 
web, клиент чата IRC, и многое другое. Поддерживается установление сетевого 
соединения вручную или с помощью клиента DHCP на компьютерах с Windows,
Linux или MacOS. Также доступен обмен файлами с AROS через встроенный
ftp.

Информация о последних выпусках находится `здесь`__. Основная страница
дистрибутива `здесь`__.

VmwAROS Live!
-------------

Основанный на VmwAROS, дистрибутив VmwAROS Live!
представляет преднастроенную и готовую к использованию среду в виде LiveCD.
Этот загрузочный диск можно запустить на любом поддерживаемом AROS x86-совместимом
компьютере и работать без лишней нагрузки, приходящейся на виртуализацию.
Если вы хотите получить от системы ещё больше, дистрибутив можно установить
непосредственно с LiveCD на жёсткий диск в качестве альтернативной системы
для вашей Windows или Linux.

Информация о последних выпусках находится `здесь`__. Основная страница
дистрибутива `здесь`__.

WinAROS
-------

WinAROS - дистрибутив, использующий виртуальную машину QEMU в качестве базовой среды.
Этот дистрибутив может работать в QEMU на Windows или Linux. Содержит преднастроенный
набор компиляторов C/C++ наряду с Murks!IDE - лучшей (и единственной) интегрированной
средой разработки (IDE) для AROS.

Основная страница дистрибутива находится `здесь`__.

__ http://vmware.com/products/player/
__ http://vmwaros.blogspot.com/2008/04/vmwaros-is-complete-aros-desktop.html
__ http://www.vmwaros.org/

__ http://vmwaros.blogspot.com/2008/04/blog-post.html
__ http://www.vmwaros.org/

__ http://amidevcpp.amiga-world.de/WinAros.php

Снимки (Snapshots)
==================

Снимки - это непериодические, неавтоматические сборки AROS. Они выпускаются
разработчиками, которые не могут производить ночные сборки по каким-либо техническим
или политическим причинам.

Эти версии не являются неподдерживаемыми, поэтому пожалуйста используйте `bug tracker`__
для размещения сообщений об ошибках.

.. raw:: html

   <?php virtual( "/cgi-bin/files?type=snapshots&lang=ru" ); ?>

__ http://sourceforge.net/tracker/?atid=439463&group_id=43586&func=browse

Ночные сборки
=============

Ночные сборки, соответственно имени, генерируются автоматически каждую ночь 
непосредственно из исходников в Subversion и содержат все последние изменения в коде. 
Однако следует учесть, что обычно они никаким образом не тестируются, и при 
особом невезении могут быть нерабочими или ужасно глючными. Правда, как правило, 
они работают совершенно нормально.

Если при использовании ночных сборок Вы обнаружили ошибку, пожалуйста, сообщите 
о ней, используя `bug tracker`__. Для прочих вопросов, напишите в форум на 
`AROS-Exec`__.

.. Note::

   Скачивая ночные сборки, необходимо использовать менеджер закачки, способный 
   продолжать прерванные закачки, или утилиту для командной строки наподобие
   wget (например, докачивая прерванную закачку другой программы при помощи 
   "wget -c").

.. raw:: html

   <?php virtual( "/cgi-bin/files?type=nightly&lang=ru" ); ?>

__ http://sourceforge.net/tracker/?atid=439463&group_id=43586&func=browse
__ https://ae.amigalife.org/
