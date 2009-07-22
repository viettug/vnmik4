@echo off
rem This file is part of VnMiK 4.0.0 <http://vnmik.sf.net/>
set PATH=%~dp0\bin;%~dp0\bin\svn;c:\cygwin\bin;%PATH%
set HOME=%~dp0
rem call user.cfg.bat
bash vnmik.install.package
bash vnmik.update.core
