@echo off
set OPTS=i
set arg1=%1
set arg2=%2

set LIBDIR=%CD%
set SRCDIR=%LIBDIR%\..\..\..\source

:: GD
cd %SRCDIR%\gd-2.0.15
call makelib %OPTS%
copy libgd.lib %LIBDIR%\gd.lib

:: GLUI
cd %SRCDIR%\glui_v2_1_beta
call makelib %OPTS%
copy  libglui.lib %LIBDIR%\glui.lib

:: GLUT
cd %SRCDIR%\glut-3.7.6
call makelib %OPTS%
copy libglutwin.lib %LIBDIR%\glut32.lib

:: JPEG
cd %SRCDIR%\jpeg-6b
call makelib %OPTS%
copy libjpeg.lib %LIBDIR%\jpeg.lib

:: PNG
cd %SRCDIR%\png125
call makelib %OPTS%
copy libpng.lib %LIBDIR%\png.lib

:: ZLIB
cd %SRCDIR%\zlib114
call makelib %OPTS%
copy libz.lib %LIBDIR%\zlib.lib

:: pthreads
cd %SRCDIR%\pthreads
call makelib %OPTS%
copy libpthreads.lib %LIBDIR%\pthreads.lib

if NOT x%arg2% == xlua goto skip_lua
:: Lua interpreter
cd %SRCDIR%\lua-5.3.1
call makelib.bat
copy src\liblua.a %LIBDIR%\liblua.a

:: LPEG
cd %SRCDIR%\lpeg-1.0.0
call makelib.bat
copy lpeg.dll %LIBDIR%\lpeg.dll
:skip_lua

cd %LIBDIR%

echo library builds complete
if x%arg1% == xbot goto skip1
pause
:skip1
