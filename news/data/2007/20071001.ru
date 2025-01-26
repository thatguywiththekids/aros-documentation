===========
Обновление!
===========

:Author:   Paolo Besser
:Date:     2007-10-01

Срочно в выпуск!
----------------

Горячие новости! Neil Cafferkey внёс код нового `инсталятора`__ для AROS, 
позволяющего безболезненно устанавливать систему на жёсткие диски.

Новые возможности включают:

- Возможен выбор устройства и раздела для установки
- Возможно создание раздела Work и копирование файлов на него
- Можно задавать размеры разделов, уже существующие разделы остаются нетронутыми.
- Установленная Windows добавляется в меню GRUB если будет найден характерный 
  для этой системы раздел.
- При установке можно выбрать локаль устанавливаемой системы


Тем не менее, просьба учесть, что программа пока имеет бета-статус.
Neil предупреждает: "Новый HD-инсталятор включен в состав сборок на ISO
и готов к тестированию. Однако, в текущее время присутствует ошибка в Wanderer
либо FFS, требующая исправления. После запуска инсталятора, необходимо выйти из
Wanderer перед дальнейшими действиями (особенно если вы собираетесь форматировать 
какие-либо разделы). Соблюдайте особую осторожность при работе даже с этой 
версией, то есть - не испытывайте её на машинах, где могут быть несохранённые
важные данные. Все разделы, имеющиеся на дисках, должны быть сохранены,
если вы захотите, но эта возможность пока слишком скудно испытана."

Если у Вас под рукой имеется испытательная машина без важных данных, было бы
весьма мудро с Вашей стороны скачать сборку от 1 октября (или новее), и
принять участие в тестировании. Чтобы сообщать об ошибках, используйте Bug Tracker
или шлите сообщения в `этой ветке`__ форума AROS-Exec.
      

AROS напоказ
------------

Как уже сообщалось ранее, AROS стала почётным гостем выставки `Pianeta Amiga 2007`__.
Во время выставки, Paolo Besser представил AROS клану заинтересованных "амиганов".
Его выступление было освещено рядом известных IT-новостных сайтов, таких как
`TGM Online`__ и `HW Upgrade`__. Отчёт о прошедшей выставке был опубликован и на 
`The AROS Show`__ (читайте `здесь`__). Также можно посмотреть интересный
`видеоролик`__ с выставки на YouTube.


AROS WWWокруг
-------------

За прошедшее время наш сайт получил несколько новых переводов документации - 
на греческий (от Ioannis Koniaris), испанский (от Ariel Gomez) и чешский
(от Petr Novak) языки, при неизменной и необходимой поддержке Neil Cafferkey.
Также, готовятся дополнения к шведской (от Jon Anderson) и русской (от Softy) 
документации. Возможны также ещё более обширные добавления (от... Вас?).

__ http://mama.indstate.edu/users/nova/installer.jpg
__ https://ae.amigalife.org/modules/newbb/viewtopic.php?topic_id=2319
__ http://www.pianetaamiga.it/2007/eng/
__ http://tgmonline.futuregamer.it/news/settembre2007/20070910111905
__ http://www.hwupgrade.it/news/videogiochi/presentazione-italiana-per-l-os-indipendente-aros_22619-0.html
__ http://arosshow.blogspot.com
__ http://arosshow.blogspot.com/2007/09/pianeta-amiga-2007-report-from-paolo.html
__ http://video.google.it/videoplay?docid=-3563710058663289244
