::=== PREPARATION ===
@echo off
@title Script aide ~ G�n�rateur code HTML ~ 1c2t1z
@setlocal EnableExtensions EnableDelayedExpansion
color 1f
::=== VARIABLE ===
REM ESPACE INSECABLE POUR DEBUT LINE 2
set "notepad.caution.message.line=2"
set "notepad.caution.message.line1=- Lorsque vous avez termin�, fermer le bloc note puis"
set "notepad.caution.message.line2=��revenez sur cette page..."
::=== DEMARRAGE ===
:start
::=== NETTOYAGE ===
if exist %temp%\html-*.txt (del /q %temp%\html-*.txt)
::=== MENU PRINCIPAL ===
cls
echo ������������������������������������������������������ͻ
echo �                     MENU PRINCIPAL                   �
echo ������������������������������������������������������ͼ
echo ������������������������������������������������������ͻ
echo � [A] - HTML                                           �
echo � [B] - CSS                                            �
echo �                                                      �
echo � [X] - QUITTER                                        �
echo ������������������������������������������������������ͼ
echo.
choice /C:ABX /N /M "- [A/B/X] Quel est votre choix ? "
if errorlevel 3  goto :exit
if errorlevel 2  goto :css
if errorlevel 1  goto :html.v
::=== HTML CONFIRMATION ===
:html.v
cls
echo ������������������������������������������������������ͻ
echo �                    HTML VALIDATION                   �
echo ������������������������������������������������������ͼ
echo ������������������������������������������������������ͻ
echo � [O] - OUI                                            �
echo � [N] - NON                                            �
echo ������������������������������������������������������ͼ
echo.
choice /C:ON /N /M "- [O/N] Etes-vous sur de votre choix ? "
if errorlevel 2  goto :html.no
if errorlevel 1  goto :html.yes
:html.yes
goto :html
:html.no
goto :start
:::=== HTML MENU PRINCIPAL ===
:html
cls
echo ������������������������������������������������������ͻ
echo �                    HTML COPIE CODE                   �
echo ������������������������������������������������������ͼ
echo ������������������������������������������������������ͻ
echo � NB : Il est a noter que certains code sont g�n�rique �
echo �     donc a adapter en fonction de la situation.      �
echo �                                                      �
echo � INFO :   Au niveau du fonctionnement, vous faites    �
echo �          votre choix parmis ceux propos� juste au    �
echo �          dessous puis un bloc note avec le code      �
echo �          s'ouvre, vous copiez et fermez la fenetre.  �
echo ������������������������������������������������������ͼ
echo ������������������������������������������������������ͻ
echo � [A] - HEAD (meta, :og, favicon...)                   �
echo � [B] - HEADER (nav id...)                             �
echo � [C] - MAIN (main id, content...)                     �
echo � [D] - PRE CODE (cmd, html, css, ps...)               �
echo � [E] - PRE CODE (console like cmd, ps)                �
echo � [F] - ASIDE (bulle info et erreur)                   �
echo � [G] - FOOTER (copyfuck, mask-icon...)                �
echo �                                                      �
echo � [X] - AUCUN (revenir a l'accueil)                    �
echo ������������������������������������������������������ͼ
echo.
choice /C:ABCDEFGX /N /M "- [A/B/C/D/E/F/G/X] Quel code voulez-vous copier ? "
if errorlevel 8 goto :start
if errorlevel 7 goto :html.footer
if errorlevel 6 goto :html.aside
if errorlevel 5 goto :html.precode.console
if errorlevel 4 goto :html.precode.language
if errorlevel 3 goto :html.main
if errorlevel 2 goto :html.header
if errorlevel 1 goto :html.head

:html.footer
cls
echo.
echo - Appuyez sur une touche pour commencer...
pause > nul
for /f "useback delims=" %%_ in (%0) do (
  if "%%_"=="___RETOOF___" set $=
if defined $ echo(%%_ >> %temp%\html-footer.txt
  if "%%_"=="___FOOTER___" set $=1
)
goto :call.html.footer
___FOOTER___
<footer><a href="/"><img src="/mask-icon.svg" width="512" height="512" alt="">Cerber</a><ul id="copyfuck"><li>Aucun droit r�serv� - Fait par CT</li></ul></footer>
___RETOOF___
:call.html.footer
cls
echo.
for /l %%A in (1,1,%notepad.caution.message.line%) do (for /f "tokens=*" %%B in ("!notepad.caution.message.line%%A!") do (echo %%B))
call %temp%\html-footer.txt
del /q %temp%\html-footer.txt
cls
echo.
echo - Retour automatique vers le menu : "HTML COPIE CODE"...
ping -n 4 127.0.0.1>nul
goto :html
::=== MENU PRINCIPAL -> CSS ===
:css
cls
echo.
echo - Rubrique pas encore cr�er, red�marrage du script en cours...
ping -n 5 127.0.0.1>nul
goto :start
::=== MENU PRINCIPAL -> QUITTER ===
:exit
cls
echo.
echo - Nettoyage et fermeture du script en cours...
ping -n 3 127.0.0.1>nul
goto :eof
