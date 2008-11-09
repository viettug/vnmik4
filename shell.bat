@echo off
rem This file is part of VnMiK 4.0.0 <http://vnmik.sf.net/>
set PATH=%~dp0\bin;%~dp0\bin\svn;c:\cygwin\bin;%PATH%
set HOME=%~dp0
set PS1=vnmik \[\033[0;1;34m\]\W\[\033[0;0;37m\] $ 
bash --login -i 
