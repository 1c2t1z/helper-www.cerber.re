:: ### POUR LE BUG DES ACCENTS POUR FOOTER ET "A COMPLETER"
:: ### IL FAUT CONVERTIR EN ANSI PUIS COMPLETER LES , PAR DES
:: ### ACCENTS. FAIRE SAVE DU CODE AVANT. C'EST A FAIRE A LA
:: ### TOUTE FIN.

::=== PREPARATION ===
@echo off
@title Script aide ~ Gnrateur code HTML ~ 1c2t1z
@setlocal EnableExtensions EnableDelayedExpansion
color 1f
::=== VARIABLE ===
REM ESPACE INSECABLE LINE 2
set "notepad.caution.message.line=2"
set "notepad.caution.message.line1=- Lorsque vous avez termin, fermez le bloc note puis"
set "notepad.caution.message.line2=ÿÿrevenez sur cette fenetre..."
set "all.instruction.message.line=5"
set "all.instruction.message.line1=ษออออออออออออออออออออออออออออออออออออออออออออออออออออออป"
set "all.instruction.message.line2=บ INFO : Si par erreur vous etes arriv sur la         บ"
set "all.instruction.message.line3=บ mauvaise rubrique suivez quand meme la procedure     บ"
set "all.instruction.message.line4=บ standard : fermez le bloc note etc...                บ"
set "all.instruction.message.line5=ศออออออออออออออออออออออออออออออออออออออออออออออออออออออผ"
set "head.info.message.line=6"
set "head.info.message.line1=ษออออออออออออออออออออออออออออออออออออออออออออออออออออออป
set "head.info.message.line2=บ INFO : Pas besoin de mettre les balises head en      บ
set "head.info.message.line3=บ avec HTML 5 elles sont immdiatement reconnu. Par    บ
set "head.info.message.line4=บ soucis d'optimisation je ne fournis que la version   บ
set "head.info.message.line5=บ minify.                                              บ
set "head.info.message.line6=ศออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
::=== DEMARRAGE ===
:start
::=== NETTOYAGE ===
if exist %temp%\html-*.txt (del /q %temp%\html-*.txt)
::=== MENU PRINCIPAL ===
cls
echo ษออออออออออออออออออออออออออออออออออออออออออออออออออออออป
echo บ                     MENU PRINCIPAL                   บ
echo ศออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
echo ษออออออออออออออออออออออออออออออออออออออออออออออออออออออป
echo บ [A] - HTML                                           บ
echo บ [B] - CSS                                            บ
echo บ                                                      บ
echo บ [X] - QUITTER                                        บ
echo ศออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
echo.
choice /C:ABX /N /M "- [A/B/X] Quel est votre choix ? "
if errorlevel 3  goto :exit
if errorlevel 2  goto :css
if errorlevel 1  goto :html.v
::=== HTML CONFIRMATION ===
:html.v
cls
echo ษออออออออออออออออออออออออออออออออออออออออออออออออออออออป
echo บ                    HTML VALIDATION                   บ
echo ศออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
echo ษออออออออออออออออออออออออออออออออออออออออออออออออออออออป
echo บ [O] - OUI                                            บ
echo บ [N] - NON                                            บ
echo ศออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
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
echo ษออออออออออออออออออออออออออออออออออออออออออออออออออออออป
echo บ                    HTML COPIE CODE                   บ
echo ศออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
echo ษออออออออออออออออออออออออออออออออออออออออออออออออออออออป
echo บ NB : Il est a noter que certains code sont gnrique บ
echo บ donc a adapter en fonction de la situation.          บ
echo บ                                                      บ
echo บ INFO : Au niveau du fonctionnement, vous faites      บ
echo บ votre choix parmis ceux propos juste au dessous     บ
echo บ puis un bloc note avec le code s'ouvre, vous copiez  บ
echo บ et fermez la fenetre.                                บ
echo ศออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
echo ษออออออออออออออออออออออออออออออออออออออออออออออออออออออป
echo บ [A] - HEAD (meta, :og, favicon...)                   บ
echo บ [B] - HEADER (nav id...)                             บ
echo บ [C] - MAIN (main id, content...)                     บ
echo บ [D] - PRE CODE (cmd, html, css, ps...)               บ
echo บ [E] - PRE CODE (console like cmd, ps)                บ
echo บ [F] - ASIDE (bulle info et erreur)                   บ
echo บ [G] - FOOTER (copyfuck, mask-icon...)                บ
echo บ                                                      บ
echo บ [X] - AUCUN (revenir a l'accueil)                    บ
echo ศออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
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
:: 7 OK
:html.footer
cls
echo ษออออออออออออออออออออออออออออออออออออออออออออออออออออออป
echo บ IMPORTANT : Pour la rubrique footer il y a une       บ
echo บ exception concernant la page :"About". En effet il y บ
echo บ a un easteregg avec les couleurs de google. Donc     บ
echo บ pour pour cette rubrique ne pas utiliser le          บ
echo บ gnrateur code HTML.                                บ
echo ศออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
for /l %%A in (1,1,%all.instruction.message.line%) do (for /f "tokens=*" %%B in ("!all.instruction.message.line%%A!") do (echo %%B))
echo.
echo - Veuillez appuyer sur une touche pour lancer la copie...
pause > nul
for /f "useback delims=" %%_ in (%0) do (
  if "%%_"=="___RETOOF___" set $=
if defined $ echo(%%_ >> %temp%\html-footer.txt
  if "%%_"=="___FOOTER___" set $=1
)
goto :call.html.footer
___FOOTER___
<footer><a href=/><img alt="" src=/mask-icon.svg height=512 width=512>Cerber</a>
    <ul id=copyfuck>
        <li>Aucun droit rserv - Fait par CT
    </ul>
</footer>
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
:: 1 EN COURS
:: ERROR PAGE FAIT, CLASSIC EN COURS
:html.head
cls
echo ษออออออออออออออออออออออออออออออออออออออออออออออออออออออป
echo บ                  HEAD TYPE DE PAGE                   บ
echo ศออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
echo ษออออออออออออออออออออออออออออออออออออออออออออออออออออออป
echo บ [A] - PAGE D'ERREUR                                  บ
echo บ [B] - PAGE CLASSIQUE                                 บ
echo บ                                                      บ
echo บ [X] - RETOUR                                         บ
echo ศออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
echo.
choice /C:ABX /N /M "- [A/B/X] Etes-vous sur de votre choix ? "
if errorlevel 3 goto :html
if errorlevel 2 goto :html.head.classic.page
if errorlevel 1 goto :html.head.error.page
:html.head.error.page
cls
for /l %%A in (1,1,%all.instruction.message.line%) do (for /f "tokens=*" %%B in ("!all.instruction.message.line%%A!") do (echo %%B))
for /l %%A in (1,1,%head.info.message.line%) do (for /f "tokens=*" %%B in ("!head.info.message.line%%A!") do (echo %%B))
echo.
echo - Veuillez appuyer sur une touche pour lancer la copie...
pause > nul
for /f "useback delims=" %%_ in (%0) do (
  if "%%_"=="___RORRE-DAEH-LMTH___" set $=
if defined $ echo(%%_ >> %temp%\html-head-error-page.txt
  if "%%_"=="___HTML-HEAD-ERROR___" set $=1
)
goto :call.html.head.error.page
___HTML-HEAD-ERROR___
<html lang=fr prefix="og: https://ogp.me/ns#">
    <meta charset=utf-8>
    <title>Erreur 401 | Cerber</title>
    <meta content=Unauthorized name=description>
    <meta content="width=device-width,initial-scale=1" name=viewport>
    <meta content="dark light" name=color-scheme>
    <meta content=#fcfcff name=theme-color>
    <meta content=#ffffff name=msapplication-TileColor>
    <meta content=/mstile/144x144.png name=msapplication-TileImage>
    <meta content="Erreur 401 | Cerber" property=og:title>
    <meta content=Unauthorized property=og:description>
    <meta content=website property=og:type>
    <meta content=https://www.cerber.re/icon/opengraph.png property=og:image>
    <meta content=512 property=og:image:width>
    <meta content=512 property=og:image:height>
    <meta content="Cerber Logo" property=og:image:alt>
    <meta content=Cerber property=og:site_name>
    <link href=/6ad46ada.main.css rel=stylesheet>
    <link href=/mask-icon.svg rel=mask-icon color=#1a1c1e>
    <link href=/favicon.svg rel=icon type=image/svg+xml>
    <link href=/apple-touch-icon.png rel=apple-touch-icon>
    <link href=/manifest.json rel=manifest>
    <link href=/licence.txt rel=license>
___RORRE-DAEH-LMTH___
:call.html.head.error.page
cls
echo.
for /l %%A in (1,1,%notepad.caution.message.line%) do (for /f "tokens=*" %%B in ("!notepad.caution.message.line%%A!") do (echo %%B))
call %temp%\html-head-error-page.txt
del /q %temp%\html-head-error-page.txt
cls
echo.
echo - Retour automatique vers le menu : "HTML COPIE CODE"...
ping -n 4 127.0.0.1>nul
goto :html
:html.head.classic.page
cls
for /l %%A in (1,1,%all.instruction.message.line%) do (for /f "tokens=*" %%B in ("!all.instruction.message.line%%A!") do (echo %%B))
for /l %%A in (1,1,%head.info.message.line%) do (for /f "tokens=*" %%B in ("!head.info.message.line%%A!") do (echo %%B))
echo.
echo - Veuillez appuyer sur une touche pour lancer la copie...
pause > nul
for /f "useback delims=" %%_ in (%0) do (
  if "%%_"=="___CISSALC-DAEH-LMTH___" set $=
if defined $ echo(%%_ >> %temp%\html-head-classic-page.txt
  if "%%_"=="___HTML-HEAD-CLASSIC___" set $=1
)
goto :call.html.head.classic.page
___HTML-HEAD-CLASSIC___
<html lang=fr prefix="og: https://ogp.me/ns#">
    <meta charset=utf-8>
    <title>Services | Cerber</title>
    <meta content="Liens utiles pour les utilisateurs ayant un compte sur www.cerber.re." name=description>
    <meta content="width=device-width,initial-scale=1" name=viewport>
    <meta content="dark light" name=color-scheme>
    <meta content=#fcfcff name=theme-color>
    <meta content=#ffffff name=msapplication-TileColor>
    <meta content=/mstile/144x144.png name=msapplication-TileImage>
    <meta content="Cerber services" property=og:title>
    <meta content="Liens utiles pour les utilisateurs ayant un compte sur www.cerber.re." property=og:description>
    <meta content=https://www.cerber.re/services property=og:url>
    <meta content=website property=og:type>
    <meta content=https://www.cerber.re/icon/opengraph.png property=og:image>
    <meta content=512 property=og:image:width>
    <meta content=512 property=og:image:height>
    <meta content="Cerber Logo" property=og:image:alt>
    <meta content=Cerber property=og:site_name>
    <link href=https://www.cerber.re/services rel=canonical>
    <link href=/6ad46ada.main.css rel=stylesheet>
    <link href=/mask-icon.svg rel=mask-icon color=#1a1c1e>
    <link href=/favicon.svg rel=icon type=image/svg+xml>
    <link href=/apple-touch-icon.png rel=apple-touch-icon>
    <link href=/manifest.json rel=manifest>
    <link href=/licence.txt rel=license>
___CISSALC-DAEH-LMTH___
:call.html.head.classic.page
cls
echo.
for /l %%A in (1,1,%notepad.caution.message.line%) do (for /f "tokens=*" %%B in ("!notepad.caution.message.line%%A!") do (echo %%B))
call %temp%\html-head-classic-page.txt
del /q %temp%\html-head-classic-page.txt
cls
echo.
echo - Retour automatique vers le menu : "HTML COPIE CODE"...
ping -n 4 127.0.0.1>nul
goto :html
::=== MENU PRINCIPAL -> CSS ===
:css
cls
echo.
echo - Rubrique pas encore crer, redmarrage du script en cours...
ping -n 5 127.0.0.1>nul
goto :start
::=== MENU PRINCIPAL -> QUITTER ===
:exit
cls
echo.
echo - Nettoyage et fermeture du script en cours...
if exist %temp%\html-*.txt (del /q %temp%\html-*.txt)
ping -n 3 127.0.0.1>nul
goto :eof
