===========================
����������� �� ������������
===========================

:������:    Johann Samuellson, Matthias Rustler
:Copyright: Copyright � 2007, The AROS Development Team
:������:    $Revision$
:����:      $Date$
:������:    Beta
:ToDo:      �������� ��������� �������� ��������.


.. ����������:: 

��������
========

��� ����������� ������������ � ������������ ��� AROS ������������ �����������,
����������������� � configure ��� make-���������. ��� ����������� ��� �����������
�������� � �������� �������� ����� �� ���� Linux. ������ ����������� �������� ��
`���������`__, ���������� ������� ������������ ��� AmigaOS4.

__ http://utilitybase.com/article?action=show&id=210


��� �����������?
----------------

* �������� ������� ������ ��� ������������ �������� C. � C++ ����������� ��������� 
  �����������.

* ������� �� ���, ����� �������������� ������ ������� ���������, ������� �� ����������.
  ������ ������ ����������� ����������, ������������ ����� ������ ����������� ���������
  ��� GTK ��� Qt. ����������� �������� ����� ������ ���������, ���������� � ���������
  ������.

* ���� �� ������ ����������� ����, �� ����������, �� ���������� �� ��� `libSDL`__.
  �� ������������� ��������, ������������ OpenGL.

__ http://www.libsdl.org


��������� SDK
-------------

�������� ������ ����������� ��������� ��� AROS �� Linux, �.�. ��� ����� ������
���� ��� ����������� �������� ����������. �������� `����������� ������������`__ 
��� ���������� � ���, ��� ���������� SDK.

__ app-dev/introduction.php#compiling-on-linux-with-gcc


������
------

������ �� ����� ��������� ����� ����� ���������� � ���, ��� �������� ��� ������.
���� � �������� ���������� ������ ���� ���� ��� ��������� *configure*, �� ��
������� ��������� ��� ��� ���� ���������. ��� ��� ������� - ������� � ���������
�����.

����� ���� ��� ������ ��������� ��������, ��������� ����� ��� ������� �����������.
��������� ������ ������ ������� �������� ``make``.

������, ���� ����� *configure* ���, �� ����� ���� ��� ��������� *Makefile*.
��������� ��� � ������������ � ������������ AROS � �������� ������ ��������
``make``.

���� �� ���������������� � ��������������, �� �� ������ � ������������ �������������
������ ����� ���������. ����� ����� ����������� ��������, ����� ��������� �� �����
����� ���� ����� ������, ��� �������� � �����. ��������� ����, ��� ������� �
����� �� ����������� �����, � ���������� �����.

��������� ������� ``strip`` ��� ������� ������������ ����� �� ���������� ����������,
��� ���� ����� ������� �� ������.

������, ���� �� ��������, �� ��������� ������������� ��������� ��
http://archives.aros-exec.org � http://www.aminet.net!


��� ���������
-------------

��� Linux ������ � ������������ ��������� ������ ��������������� � 3 ����::

    ./configure
    make
    sudo make install

��� ����, ��� �� ���������� ��������������� ������ ��������� ��� AROS �����
�������, ���, ��������, ��� AmigaOS4.

������� ``./configure --help``, ����� ���������� ��������� ����� ���������. ����
��������� ����������� ��������, ����� ���������� ��������� ��������� �����������.


������� ������
--------------

::

    ./configure CC=i386-aros-gcc \
    --build=local --host=i686-aros
    --disable-nls --without-x --without-pic --disable-shared

.. ���������::

    ����� ����� �������� ����� ��������� � ��������� ����. � ���� ������ ��
    ������ ��� ����� ��������� ������, ����� ``sh build.sh``. �� ����� ���, ���
    �� �������� �������� ������, ���������� ��������� ������� ``rm -f config.cache``,
    ��� ���� ����� ������� ������� ��������� � �������� ���������. 

��������� � ������, ������� �� ������������ ����:

``CC=i386-aros-gcc``
    ���������, ��� �� ����� ������������ ���������� ��� AROS. ����� �� �������
    ����������� ���� ��� Linux.

``--build=local --host=i686-aros``
    ��������� ������� ��������� ��� ��������������� ��� i686-aros.
    
``--disable-nls --without-x --without-pic --disable-shared`` 
    ��������� ��������� ����������� �� �������������� � AROS.
    
.. ��������������::

    �� ���������� ������� ``sudo make install``, ��� ��� ����� ���� ���������� 
    ����� ����������� � Linux �� ������ */usr/local*.

������ �� SDL (������ ���������)
--------------------------------

��������� ������ ��������� ������� ��������� ��������� `Ltris`__, �� �� �������
��������� ������ SDL ����������::

    ./configure CC=i386-aros-gcc  LDFLAGS="-nix" \
    --prefix=/PROGDIR \
    --build=local --host=i686-aros \
    --disable-nls --without-x --without-pic --disable-shared \
    --with-sdl-prefix=/usr/local/aros-sdk/i386-aros

``LDLAGS="-nix"``
    �������� ������������� ��������� �����, �������� � Linux. ���������� ��� Linux
    ����� ���������� ���������� ���� ��� ����� ������ ������. �� ���������� ����
    ����� */usr/local/app* ������ ��� AROS ���������: ��������� �� ���� ������� 
    ����, ����� ������� � ���������� *usr*.
    
``--prefix=/PROGDIR``
    ��������� �� ���� ����� ������� */PROGDIR*. ������ � ������ *-nix* ���
    ��������� ������������ ���� � ����� Linux � �������� �������������� � ���� �
    ����� AROS � �������� ����������.
    
``--with-sdl-prefix=/usr/local/aros-sdk/i386-aros``
    ������ ��������� �������� *sdl_config* ��� ���������� ��������� ����������
    CFLAGS � LDFLAGS ��� SDL ����������. ��� ���� ����� ����� ���������� ������
    *sdl_config* ��� Linux, ������� ���� ������������ ����������.
    
����� ��������� ���������� ������� ��������� � ������� *make* �� ������
����������� ����������� ���� ltris � ��� ����� ������ �� ������ ������, ���
����������� ���� ����� ����� ������::

    ltris
        ltris (binary)
        share
            ltris
                gfx
                sounds

__ http://lgames.sourceforge.net/index.php?project=LTris


������ �� SDL (������������������ ���������)
--------------------------------------------

�� ����� ������������ ����� ����� �� ����� ��� � ����::

    ./configure CC=i386-aros-gcc  LDFLAGS="-nix" \
    --prefix=/PROGDIR --bindir=/PROGDIR \
    --build=local --host=i686-aros \
    --disable-nls --without-x --without-pic --disable-shared \
    --with-sdl-prefix=/usr/local/aros-sdk/i386-aros

``--bindir=/PROGDIR`` 
    ��������� �������� ������������� *bin*.
    
�� �������� ����� *--prefix* ����� ��� ������� � ��������� ������ AROS �
��������� ���������� Linux.

������ �� ������ ����������� ��� ������ (��������� ``make distclean``, ���������
������ ���������, ��������� ``make``). ������ ��� ���� ��������� ``sudo make
install``. �� ����� ������� ������� ��������� ����:

+ sudo mkdir /PROGDIR
+ sudo chmod a+rwx /PROGDIR

��� ���� ��� ����������� �������� ������ � */PROGDIR* ��� ���� root'�. ������ ��
�������  ��������� ``make install``, ��� ������ ���������� ��������� � ����������
*/PROGDIR*. ��� ��� ��� �� ������� ���������� �����, �� �� ��������� � � �����, ���
AROS ������ � ����� (��������, cp -r /PROGDIR~/AROS/games/ltris).

�� �������� ��������� ``rm -rf /PROGDIR/*`` ����� ���, ��� �������� �����-����
������ ������.


���������������� ��� ��������� ������ 
-------------------------------------

*� ������� ������ � ���, ��� ���� ��� ���� i686-aros �� �������� (target or host 
i686-aros isn't available).*

�������:
  ������ *config.sub* ��������, ������� ��� �� ����������. ��������� ``autoconf``
  � �������� ���������� ������. ���� ��� �� �������, �� ���������� ������� ������
  ����� *config.sub* �������� �� */usr/share/automake*.

.. _autoconf: http://ftp.gnu.org/gnu/autoconf/

� ������� ��� ����� ������:
  checking for IMG_Load in -lSDL_image... no

�������:
  �� ���������� ���������� �� ������������ ������������, � ������ ����� �������,
  � ��� �����������. ��������� ��� ������ � ������ ���������::

    LIBS="-lSDL_image $LIBS"

  ��� ���������� ������ SDL_image ���������� ��� ��������� ���������, ������� ��::

    LIBS="-lSDL_image -lpng -ljpeg -lz $LIBS"

� ������� ��� ����� ������:
  checking for Mix_OpenAudio in -lSDL_mixer... no

�������:
  �� ���������� ���������� �� ������������ ������������, � ������ ����� �������,
  � ��� �����������. ��������� ��� ������ � ������ ���������::
  
    LIBS="-lSDL_mixer $LIBS"

  ��� ���������� ������ SDL_mixer ���������� ��� ��������� ���������, ������� ��::

    LIBS="-lSDL_mixer -lvorbisfile -lvorbis -logg $LIBS"
    
�������� ����� ����� ���������, ����� configure ���� SDL_ttf, � ������ �� ������
������. ��� ���� ������� ��� ��������� ���������, ����� ���, �� �������
������� SDL_ttf. �� ���������� -lfreetype � -lz. �������� �� �������������� �
�������� ����������.

���� �� �������� ����������� ����������� � ������ ���������, � �� ��-�������� ��
��������, �� ��������, �������� ����� � SDK. ��������, ��� ��������� SDL.

���� ������ �� ��� �� �������� � �� �������, ��� ���������� ����������, �� ����������
������� � ������� ��������� ������� ������, � ������� ������������ ��������
����������� ����������. ��� �� ������������� � ��������� ������ ���� ���������
��������� �����������.

������ �� ������ � ������ ������ �������. ��� ������������ ���������� �� unix
������ ������� ``make``.


�������� makefile �������
=========================

����� makefile ����� ������������, ���� ������� ������ ���������, � �� ������ �
������� ���������, �������� � ������������ � ������ �������. ������ ��� ����
����� ���� �������� ������������ makefile, �������� �������� ����������� C (�����
����� ������ ����������� ���� ��� Linux) � �������� ��������� ������ ��
����������� ����������.

����� �����������, ��� ������ �����.

CC
    ��� ��������������� ����� ����������� ����� C.

RM
    ��� ������� ��������.

STRIP
    ��� ������� strip (������������ ��� �������� ���������� ���������� ��
    ����������� ������).

CFLAGS
    ��������� �����������, ��� ������ ��������� (includes) (-I) � �.�.

LDFLAGS
    ��������� ������������, ����� ���������� ���������� (-I) � ��� �� ����� (-L).
    
OBJS
    ���������� (GCC/G++) ����������� ��������� ����� (#?.o) �� ����� .c ������,
    ������� ����� ����������� ������ ��� �������� ������������ �����. ����� ����
    ������� ����� ��������� ������.
    
OUTPUT
    ��� ��������� ������������ �����.

::

  CC      = i386-aros-gcc
  RM      = rm
  STRIP   = i386-aros-strip --strip-unneeded --remove-section .comment
  CFLAGS  = -Wall -O2 
  LDFLAGS = -nix -lsmpeg -lSDL_gfx -lSDL_net -lSDL_image -lpng -ljpeg -lz -lSDL_mixer \
            -lvorbisfile -lvorbis -logg -lSDL_ttf -lfreetype -lz -lsdl -lauto -lpthread -lm
  OBJS    = a.o b.o c.o
  OUTPUT  = test.exe

  all: $(OBJS)
          $(CC) $(CFLAGS) $(LDFLAGS) $(OBJS) -o $(OUTPUT) 

  main.o: main.cpp main.h 
          $(CC) $(CFLAGS) -c main.cpp

  strip:
          $(STRIP) $(OUTPUT)
        
  clean:
          $(RM) -f $(OBJS) $(OUTPUT)

�� ��������, ��� ��� ���� ������������ ������� ��������� ����� ��������� (�� �������).


������������� ������� ������
============================

������� ������ �������� ������� ��� ��������� �������. ������� ������������� ���
������������� ������� ������ �������� ������� ������������
���������� �� ������ ������������� AROS.

+ %build_with_configure
+ %fetch_and_build
+ %fetch_and_build_gnu_development

�������� ���� $(TOP)/config/make.tmpl ��� ��������� � ����������. � *$(TOP)/contrib/gnu*
��� ������������ ������� ���������� ������� GNU.


������
======

�������������� ����� Unix � ���� AROS
-------------------------------------

��� ������������� ���� Unix � ���� AROS? �������� *getenv("HOME")* �� *"/PROGDIR/"*.

�������::

    ����: strcpy(path, getenv("HOME"));
    �����: strcpy(path, "/PROGDIR/");

    ����: strcpy(home,getenv("HOME"));
    �����: strcpy(home,"/PROGDIR/");

    ����: sprintf(rc_dir, "%s/.gngeo/romrc.d", getenv("HOME"));
    �����: sprintf(rc_dir, "%sgngeo/romrc.d", "/PROGDIR/");

��������, ��� � ����� "/." � ��������� �������.

���� � ����������� � ������� ����� ��������������� � �������� ��������� ��� ������
����� *-DDATADIR=*. � ���� ������ ���������� ��� ���: *-DDATADIR=/PROGDIR/*.
����� ����� ���������� � ������� ��������� � makefile. ������� � ��� �����
*DATADIR=* � �������� � �� *DATADIR=/PROGDIR/*.


�����������
-----------

����������� (defines) ����� ��������������� � *config.h*, ���� ���-�� ���������
�����������, �� �� ������ ������� ������ ��� ������ ���������, ��������� *#define*
� *#undef*.

������ �����������, ������� �������� ��� ���� �������������� AmigaOS::

  #ifdef __AMIGA__
          blah blah blah
  #else 
          blah blah blah
  #endif

������ �����������, ������� �������� ������ ��� AROS::

  #ifdef __AROS__
          blah blah blah
  #else 
          blah blah blah
  #endif

������ �����������, ������� �������� ��� BeOS � AROS::

  #if !defined(__BEOS__) && !defined(__AROS__)

������ ����� �������� #ifdef::

  #ifdef GP2X
    char *gngeo_dir="save/";
  #elif defined __AROS__
    char *gngeo_dir="/PROGDIR/save/";
  #else
    char *gngeo_dir=get_gngeo_dir();
  #endif

��������� ������ � �������� �������� ����� ��� ������������ ��� ������������
�������, �������� Amiga. ���� �� ������ � �������� ���� ���-������ �����
*#ifdef __AMIGA__*, �� ������ ���������� �������� ����������� � ������ ���������
(��������, CFLAGS="-nix -D__AMIGA__").


����������� ��������� �� �������
--------------------------------

Error: No return statement in function returning non-void (������: �� ���������� �������� �� ������� � �������� ������������ ���������)
  �������, ������� ������ ���������� ��������, *�� ����������* ���.

Error: Control reaches end of non-void function (������: �������� �������� ����� ������� � �������� ������������ ���������)
  ��������� ����� �������, ������� ������ ���������� ��������, �� �� ���������� ���.

Error: May be used uninitialized in this function (������: �������� ������������ �������������������� ���������� � ���� �������)
  ���������� �� ���� ����������������.

Warning: implicit declaration of function 'blah blah' (��������������: ������� ���������� ������� 'blah blah')
  ��� ���� ���������� ���� ����������.
  
  
���������������� ������
-----------------------

warning: incompatible implicit declaration of built-in function 'exit';
warning: incompatible implicit declaration of built-in function 'abort'::

    �������: #include <stdlib.h>

warning: implicit declaration of function 'strlen';
warning: incompatible implicit declaration of built-in function 'strlen'::

    �������: #include <string.h>

warning: implicit declaration of function 'memcpy';
warning: incompatible implicit declaration of built-in function 'memcpy'::

    �������: #include <string.h>

error: memory.h: No such file or directory::

    �������: #include <string.h>

error: malloc.h: No such file or directory::

    �������: #include <stdlib.h>

warning: incompatible implicit declaration of built-in function 'printf'::

    �������: #include <stdio.h>

warning: implicit declaration of function 'MyRemove'::

    �������: #define MyRemove Remove
    
    
��������� � ��������
--------------------

��� ����� ������ � ������ ��������� GREP?

::

  grep -R "����� �����, ������� ���� �����" *

��� ��� ������� DIFF ���� � ����� �����������?

::

  diff ��������_����.c ����������_����.c >./��������_����.patch

��� ����������� ���� �������� �������� ������, ��� ��� ��������?
  ������ `����������� �� ������� <debugging>`_. �� ������ ������������
  sys:utilities/snoopy ��� ������������ �������� ������ ����������.
  
��� ������������� ��������� � �� ������� � �������������� ����������� GCC �
��������� ����?

::

  make 2>warnings.txt
