@echo off
setlocal EnableDelayedExpansion
::=== PREPARATION ===
@title cerber.re - generateur code HTML - 1c2t1z
@color 0f
::=== DEMARRAGE ===
:debut
color 0f
cls
::=== MENU PRINCIPAL ===
echo.
set choixdisp=123
set amount=3
echo. [1] - HTML
echo. [2] - CSS (pas creer)
echo.
echo. [3] - quitter
echo.
choice /c !choixdisp:~0,%amount%! /N /M "- Que veux tu copier ?"  
goto :%errorlevel% 
::=== HTML CONFIRMATION ===
:1
cls
echo.
set choixdisp=12
set amount=2
echo. [1] - OUI
echo. [2] - NON
echo.
choice /c !choixdisp:~0,%amount%! /N /M "- Tu as choisi HTML ?"  
goto :HTML_V%errorlevel%
::=== HTML VALIDATION ===
REM OUI
:HTML_V1
goto :HTML_MAIN_MENU
REM NON
:HTML_V2
goto :debut
:::=== HTML MENU PRINCIPAL ===
:HTML_MAIN_MENU
cls
echo.
echo HTML code a copier
echo il est a noter que tout les codes sont generique
echo donc il faut les remplir en fonction du besoin.
echo.
set choixdisp=123456789
set amount=9
echo. [1] - head (1er)
echo. [2] - header (nav id etc...)
echo. [3] - div content (contenu)
echo. [4] - code (chgmt fonction language)
echo. [5] - code (console cmd ou PS)
REM 6 & 7 sont quasi pareil voir comment je peux les reunir
echo. [6] - aside (info et erreur)
echo. [7] - footer
echo.
echo. [8] - suivant
echo.
echo. [9] - retour
echo.
choice /c !choixdisp:~0,%amount%! /N /M "- Que veux tu copier ?"  
goto :HTMLc%errorlevel%

::=== HTML choix 9 BACK ===
:HTMLc9
cls
color a
echo.
echo. retour a l'accueil !
ping -n 2 127.0.0.1>nul
goto :debut

:HTMLc8
goto :HTML_SECONDARY_MENU

:HTMLc7
cls
echo.
echo un fichier va s'ouvrir il contient les donnees pour creer un footer.
echo une fois la copie faites revenez sur ce script.
echo.
echo appuyez pour commencer
pause > nul
for /f "useback delims=" %%_ in (%0) do (
  if "%%_"=="___ATAD1___" set $=
if defined $ echo(%%_ >> %temp%\test.txt
  if "%%_"=="___DATA1___" set $=1
)
goto :call_footer_html
___DATA1___
<footer><a href="/"><img src="mask-icon.svg" width="512" height="512" alt="">Cerber</a><ul id="copyfuck"><li>Aucun droit réservé - Fait par CT</li></ul></footer>
___ATAD1___
:call_footer_html
call %temp%\test.txt
pause
del /q %temp%\test.txt
cls
echo.
echo retour automatique vers le MENU HTML PRINCIPAL
ping -n 4 127.0.0.1>nul
goto :HTML_MAIN_MENU


:HTMLc6

:::=== HTML MENU SECONDAIRE ===
:HTML_SECONDARY_MENU
cls
echo.
echo HTML code a copier
echo il est a noter que tout les codes sont generique
echo donc il faut les remplir en fonction du besoin.
echo.
set choixdisp=12345678
set amount=8
echo. [1] - a definir
echo. [2] - a definir
echo. [3] - a definir
echo. [4] - a definir
echo. [5] - a definir
echo. [6] - a definir
echo. [7] - a definir
echo.
echo. [8] - retour
echo.
choice /c !choixdisp:~0,%amount%! /N /M "- Que veux tu copier ?"  
goto :HTMLcc%errorlevel%

:HTMLcc8
goto :HTML_MAIN_MENU

REM DEB CI 

set MAX_LIGNES=3
set ligne1=%SYSTEMDRIVE%\Users\%matricule%\AppData\Roaming\Zoom\uninstall\Installer.exe /uninstall /S
set ligne2=%SYSTEMDRIVE%\Users\%matricule%\AppData\Zoom\uninstall\Installer.exe /uninstall /S
set ligne3=del %APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\Zoom.Ink

REM BOUCLE ECRITURE VERS ok.bat

for /l %%A in (1,1,%MAX_LIGNES%) do (
    for /f "tokens=*" %%B in ("!ligne%%A!") do (
        echo %%B >> ok.bat
        )
    )

REM ENVOIE DE ok.bat VERS LE PC + AUTOSUPRESSION

powershell.exe -command xcopy $env:USERPROFILE\Desktop\ok.bat '\\%nom%\c$\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup'
Del /Q %USERPROFILE%\desktop\ok.bat
Del /Q ok.bat
cls

REM FIN CI

goto log


REM SUPRESSION RESIDUS

:: CREATION FICHIER LOG SUR BUREAU
:log
set datetimef=%date:~0,2%:%date:~3,2%:%date:~-4%-%time:~0,2%:%time:~3,2%:%time:~6,2%
cd /D "%userprofile%\desktop"
echo %datetimef% - matricule: %matricule% - nom de poste: %nom% >> log_dezoomage.txt
ping -n 1 127.0.0.1>nul
cls
echo Ping en cours 
echo Veuillez patientez 3 sec...
ping -a %nom% >> log_dezoomage.txt
ping -n 3 127.0.0.1>nul
cls

REM OUVERTURE LOG

echo Ouverture du LOG...
ping -n 2 127.0.0.1>nul
cls
start log_dezoomage.txt

REM SCRIPT FERMETURE NOTEPAD

set MAX_LIGNES=4
set ligne1=test
set ligne2=test
set ligne3=test
set ligne4=test

for /l %%A in (1,1,%MAX_LIGNES%) do (
    for /f "tokens=*" %%B in ("!ligne%%A!") do (
        echo %%B >> %temp%\test.txt
        )
    )
start test.txt
::=== CHOIX 2 CSS ===
:2
echo.
echo rubrique pas encore creer, redemarrage du script en cours... !
ping -n 4 127.0.0.1>nul
goto :debut
::=== CHOIX 3 EXIT ===
:3
exit