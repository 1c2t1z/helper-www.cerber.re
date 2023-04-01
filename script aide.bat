:: ### BUG AVEC LES ! DANS LES TXT GENERE VOIR SI POSSIBLE
:: ### DE RESOUDRE BUG POUR L'INSTANT PAS DE DOCTYPE.
chcp 65001 > nul
::=== PREPARATION ===
@echo off
@title Script aide ~ Générateur code HTML ~ 1c2t1z
setlocal EnableDelayedExpansion
setlocal EnableExtensions
color 1f
::=== VARIABLE ===
REM ESPACE INSECABLE LINE 2
set "notepad.caution.message.line=2"
set "notepad.caution.message.line1=- Lorsque vous avez terminé, fermez le bloc note puis"
set "notepad.caution.message.line2=  revenez sur cette fenetre..."
set "all.instruction.message.line=5"
set "all.instruction.message.line1=╔══════════════════════════════════════════════════════╗"
set "all.instruction.message.line2=║ INFO : Si par erreur vous etes arrivé sur la         ║"
set "all.instruction.message.line3=║ mauvaise rubrique suivez quand meme la procedure     ║"
set "all.instruction.message.line4=║ standard : fermez le bloc note etc...                ║"
set "all.instruction.message.line5=╚══════════════════════════════════════════════════════╝"
set "head.info.message.line=5"
set "head.info.message.line1=╔══════════════════════════════════════════════════════╗"
set "head.info.message.line2=║ INFO : Pas besoin de mettre les balises head en      ║"
set "head.info.message.line3=║ HTML 5 elles sont immédiatement reconnu. Par soucis  ║"
set "head.info.message.line4=║ d'optimisation je ne fournis que la version minify.  ║"
set "head.info.message.line5=╚══════════════════════════════════════════════════════╝"
::=== DEMARRAGE ===
:start
::=== NETTOYAGE ===
if exist %temp%\html-*.txt (del /q %temp%\html-*.txt)
::=== MENU PRINCIPAL ===
cls
echo ╔══════════════════════════════════════════════════════╗
echo ║                     MENU PRINCIPAL                   ║
echo ╚══════════════════════════════════════════════════════╝
echo ╔══════════════════════════════════════════════════════╗
echo ║ [A] - HTML                                           ║
echo ║ [B] - CSS                                            ║
echo ║                                                      ║
echo ║ [X] - QUITTER                                        ║
echo ╚══════════════════════════════════════════════════════╝
echo.
choice /C:ABX /N /M "- [A/B/X] Quel est votre choix ? "
if errorlevel 3  goto :exit
if errorlevel 2  goto :css
if errorlevel 1  goto :html.v
::=== HTML CONFIRMATION ===
:html.v
cls
echo ╔══════════════════════════════════════════════════════╗
echo ║                    HTML VALIDATION                   ║
echo ╚══════════════════════════════════════════════════════╝
echo ╔══════════════════════════════════════════════════════╗
echo ║ [O] - OUI                                            ║
echo ║ [N] - NON                                            ║
echo ╚══════════════════════════════════════════════════════╝
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
echo ╔══════════════════════════════════════════════════════╗
echo ║                    HTML COPIE CODE                   ║
echo ╚══════════════════════════════════════════════════════╝
echo ╔══════════════════════════════════════════════════════╗
echo ║ NB : Il est a noter que certains code sont générique ║
echo ║ donc a adapter en fonction de la situation.          ║
echo ║                                                      ║
echo ║ INFO : Au niveau du fonctionnement, vous faites      ║
echo ║ votre choix parmis ceux proposé juste au dessous     ║
echo ║ puis un bloc note avec le code s'ouvre, vous copiez  ║
echo ║ et fermez la fenetre.                                ║
echo ╚══════════════════════════════════════════════════════╝
echo ╔══════════════════════════════════════════════════════╗
echo ║ [A] - HEAD (meta, :og, favicon...)                   ║
echo ║ [B] - HEADER (nav id...)                             ║
echo ║ [C] - MAIN (main id, content...)                     ║
echo ║ [D] - PRE CODE (code et console like)                ║
echo ║ [E] - ASIDE (bulle info et erreur)                   ║
echo ║ [F] - FOOTER (copyfuck, mask-icon...)                ║
echo ║ [G] - GOTOP (bouton revenir en haut)                 ║
echo ║                                                      ║
echo ║ [X] - AUCUN (revenir a l'accueil)                    ║
echo ╚══════════════════════════════════════════════════════╝
echo.
choice /C:ABCDEFGX /N /M "- [A/B/C/D/E/F/G/X] Quel code voulez-vous copier ? "

if errorlevel 8 goto :start
if errorlevel 7 goto :html.gotop
if errorlevel 6 goto :html.footer
if errorlevel 5 goto :html.aside
if errorlevel 4 goto :html.precode
if errorlevel 3 goto :html.main
if errorlevel 2 goto :html.header
if errorlevel 1 goto :html.head
:: 3 en dernier
:html.main
cls
:: 7 en cours...
:html.gotop
cls
for /l %%A in (1,1,%all.instruction.message.line%) do (for /f "tokens=*" %%B in ("!all.instruction.message.line%%A!") do (echo %%B))
echo ╔══════════════════════════════════════════════════════╗
echo ║ INFO : GOTOP est à utiliser si la page est trop      ║
echo ║ longue car cela permet de revenir facilement tout en ║
echo ║ haut.                                                ║
echo ║ Par contre, ce bouton se transforme en avertisseur   ║
echo ║ de NOSCRIPT si l'user n'a pas activé JS. Dans tout   ║
echo ║ les cas il faut ajouter les lignes contenu dans le   ║ 
echo ║ bloc-note (j'indique où il faut les mettre)          ║
echo ╚══════════════════════════════════════════════════════╝
echo.
echo - Veuillez appuyer sur une touche pour lancer la copie...
pause > nul
for /f "useback delims=" %%_ in (%0) do (
  if "%%_"=="___POTOG___" set $=
if defined $ echo(%%_ >> %temp%\html-gotop.txt
  if "%%_"=="___GOTOP___" set $=1
)
goto :call.html.gotop
___GOTOP___

___POTOG___
:call.html.gotop
cls
echo.
for /l %%A in (1,1,%notepad.caution.message.line%) do (for /f "tokens=*" %%B in ("!notepad.caution.message.line%%A!") do (echo %%B))
call %temp%\html-gotop.txt
del /q %temp%\html-gotop.txt
cls
echo.
echo - Retour automatique vers le menu : "HTML COPIE CODE"...
ping -n 4 127.0.0.1>nul
goto :html
:: 5 a faire
:html.aside
cls
echo ╔══════════════════════════════════════════════════════╗
echo ║                   ASIDE BULLE TYPE                   ║
echo ╚══════════════════════════════════════════════════════╝
echo ╔══════════════════════════════════════════════════════╗
echo ║ [A] - ASIDE INFO (BLEU + LOGO INFO)                  ║
echo ║ [B] - ASIDE ERREUR (ROUGE + LOGO ERREUR)             ║
echo ║                                                      ║
echo ║ [X] - RETOUR                                         ║
echo ╚══════════════════════════════════════════════════════╝
echo.
choice /C:ABX /N /M "- [A/B/X] Etes-vous sur de votre choix ? "
if errorlevel 3 goto :html
if errorlevel 2 goto :html.aside.error
if errorlevel 1 goto :html.aside.info
:: 4 fait
:html.precode
cls
echo ╔══════════════════════════════════════════════════════╗
echo ║                     PRECODE TYPE                     ║
echo ╚══════════════════════════════════════════════════════╝
echo ╔══════════════════════════════════════════════════════╗
echo ║ INFO : Il ne faudra pas oublier d'appeler prism.js   ║
echo ║ dans le head avec un script src.                     ║
echo ╚══════════════════════════════════════════════════════╝
echo ╔══════════════════════════════════════════════════════╗
echo ║ [A] - PRE CODE LANGUAGE (HTML/CSS/JS/CMD/PS...)      ║
echo ║ [B] - CONSOLE LIKE (CMD/PS)                          ║
echo ║                                                      ║
echo ║ [X] - RETOUR                                         ║
echo ╚══════════════════════════════════════════════════════╝
echo.
choice /C:ABX /N /M "- [A/B/X] Etes-vous sur de votre choix ? "
if errorlevel 3 goto :html
if errorlevel 2 goto :html.precode.console
if errorlevel 1 goto :html.precode.language
:html.precode.language
cls
for /l %%A in (1,1,%all.instruction.message.line%) do (for /f "tokens=*" %%B in ("!all.instruction.message.line%%A!") do (echo %%B))
echo ╔══════════════════════════════════════════════════════╗
echo ║ INFO : PRE CODE LANGUAGE n'est compatible qu'avec du ║
echo ║ code : "Markup, HTML, XML, SVG, MathML, SSML, Atom,  ║
echo ║ RSS, CSS, C-like, JavaScript, Batch, Powershell,     ║
echo ║ Markdown". D'autre pourront être ajouté plus tard.   ║
echo ╚══════════════════════════════════════════════════════╝
echo.
echo - Veuillez appuyer sur une touche pour lancer la copie...
pause > nul
for /f "useback delims=" %%_ in (%0) do (
  if "%%_"=="___EGAUGNAL-EDOCERP___" set $=
if defined $ echo(%%_ >> %temp%\html-precode-language.txt
  if "%%_"=="___PRECODE-LANGUAGE___" set $=1
)
goto :call.html.precode.language
___PRECODE-LANGUAGE___
<pre><code class="language-html">&lt;figure&gt;
  &lt;svg version="1.1" xmlns="http://www.w3.org/2000/svg" viewBox="-21 -21 42 42" width="100" height="100"&gt;
    &lt;title>Smiling face&lt;/title>&gt;
    &lt;circle r="20" fill="yellow" stroke="black"/&gt;
    &lt;ellipse rx="2.5" ry="4" cx="-6" cy="-7" fill="black"/&gt;
    &lt;ellipse rx="2.5" ry="4" cx="6" cy="-7" fill="black"/&gt;
    &lt;path stroke="black" d="M -12,5 A 13.5,13.5,0 0,0 12,5 A 13,13,0 0,1 -12,5"/&gt;
  &lt;/svg&gt;
  &lt;figcaption&gt;
  A description of the image.
  &lt;/figcaption&gt;
&lt;/figure&gt;</code></pre>
___EGAUGNAL-EDOCERP___
:call.html.precode.language
cls
echo.
for /l %%A in (1,1,%notepad.caution.message.line%) do (for /f "tokens=*" %%B in ("!notepad.caution.message.line%%A!") do (echo %%B))
call %temp%\html-precode-language.txt
del /q %temp%\html-precode-language.txt
cls
echo.
echo - Retour automatique vers le menu : "HTML COPIE CODE"...
ping -n 4 127.0.0.1>nul
goto :html
:html.precode.console
cls
for /l %%A in (1,1,%all.instruction.message.line%) do (for /f "tokens=*" %%B in ("!all.instruction.message.line%%A!") do (echo %%B))
echo ╔══════════════════════════════════════════════════════╗
echo ║ INFO : PRE CODE CONSOLE n'est compatible qu'avec du  ║
echo ║ code DOS et PS. Seul les commandes sont Highlight,   ║
echo ║ pas la réponse de celle-ci.                          ║
echo ╚══════════════════════════════════════════════════════╝
echo.
echo - Veuillez appuyer sur une touche pour lancer la copie...
pause > nul
for /f "useback delims=" %%_ in (%0) do (
  if "%%_"=="___ELOSNOC-EDOCERP___" set $=
if defined $ echo(%%_ >> %temp%\html-precode-console.txt
  if "%%_"=="___PRECODE-CONSOLE___" set $=1
)
goto :call.html.precode.console
___PRECODE-CONSOLE___
<pre class="command-line language-batch" data-prompt="PS C:\Users\Chris>" data-output="2-19"><code class="language-batch">dir

Directory: C:\Users\Chris

Mode                LastWriteTime     Length Name
----                -------------     ------ ----
d-r--        10/14/2015   5:06 PM            Contacts
d-r--        12/12/2015   1:47 PM            Desktop
d-r--         11/4/2015   7:59 PM            Documents
d-r--        10/14/2015   5:06 PM            Downloads
d-r--        10/14/2015   5:06 PM            Favorites
d-r--        10/14/2015   5:06 PM            Links
d-r--        10/14/2015   5:06 PM            Music
d-r--        10/14/2015   5:06 PM            Pictures
d-r--        10/14/2015   5:06 PM            Saved Games
d-r--        10/14/2015   5:06 PM            Searches
d-r--        10/14/2015   5:06 PM            VideosMode</code></pre>
___ELOSNOC-EDOCERP___
:call.html.precode.console
cls
echo.
for /l %%A in (1,1,%notepad.caution.message.line%) do (for /f "tokens=*" %%B in ("!notepad.caution.message.line%%A!") do (echo %%B))
call %temp%\html-precode-console.txt
del /q %temp%\html-precode-console.txt
cls
echo.
echo - Retour automatique vers le menu : "HTML COPIE CODE"...
ping -n 4 127.0.0.1>nul
goto :html
:: 6 OK
:html.footer
cls
echo ╔══════════════════════════════════════════════════════╗
echo ║ IMPORTANT : Pour la rubrique footer il y a une       ║
echo ║ exception concernant la page :"About". En effet il y ║
echo ║ a un easteregg avec les couleurs de google. Donc     ║
echo ║ pour pour cette rubrique ne pas utiliser le          ║
echo ║ générateur de code HTML.                             ║
echo ╚══════════════════════════════════════════════════════╝
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
        <li>Aucun droit réservé - Fait par CT
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
:: 1 FAIT
:html.head
cls
echo ╔══════════════════════════════════════════════════════╗
echo ║                  HEAD TYPE DE PAGE                   ║
echo ╚══════════════════════════════════════════════════════╝
echo ╔══════════════════════════════════════════════════════╗
echo ║ [A] - PAGE D'ERREUR                                  ║
echo ║ [B] - PAGE CLASSIQUE                                 ║
echo ║                                                      ║
echo ║ [X] - RETOUR                                         ║
echo ╚══════════════════════════════════════════════════════╝
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
<!doctype html>
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
:: 2 fait
:html.header
cls
echo ╔══════════════════════════════════════════════════════╗
echo ║ IMPORTANT : Attention de ne pas oublier le "body"    ║
echo ║ au dessus. De plus si il n'y a pas besoin de bouton  ║
echo ║ les premières lignes peuvent etre supprimés (on      ║
echo ║ laisse le noscript). Tout dépend de la taille de la  ║
echo ║ page.                                                ║
echo ╚══════════════════════════════════════════════════════╝
for /l %%A in (1,1,%all.instruction.message.line%) do (for /f "tokens=*" %%B in ("!all.instruction.message.line%%A!") do (echo %%B))
echo.
echo - Veuillez appuyer sur une touche pour lancer la copie...
pause > nul
for /f "useback delims=" %%_ in (%0) do (
  if "%%_"=="___REDAEH___" set $=
if defined $ echo(%%_ >> %temp%\html-header.txt
  if "%%_"=="___HEADER___" set $=1
)
goto :call.html.header
___HEADER___
<button id=gotop tabindex=0 title="Revenir en haut">
    <span class=gotop-text>TOP</span>
    <span class=material-icons>arrow_upward</span>
</button>
<noscript><a href=/nojs><button id=gotopnojs tabindex=0 title="JavaScript n'est pas activé">
    <span class=gotop-text>NOJS</span>
    <span class=material-icons>error</span></button></a>
</noscript>

<header>
    <nav id=site-menu>
        <ul>
            <li aria-current=page><a href=/><img alt="" src=/mask-icon.svg>Cerber</a>
            <li><a href=/android/>Android</a>
            <li><a href=/windows/>Windows</a>
            <li><a href=/services>Services</a>
            <li><a href=/about>A propos</a>
            <li><a href=/contact>Contact</a>
        </ul>
    </nav>
</header>
___REDAEH___
:call.html.header
cls
echo.
for /l %%A in (1,1,%notepad.caution.message.line%) do (for /f "tokens=*" %%B in ("!notepad.caution.message.line%%A!") do (echo %%B))
call %temp%\html-header.txt
del /q %temp%\html-header.txt
cls
echo.
echo - Retour automatique vers le menu : "HTML COPIE CODE"...
ping -n 4 127.0.0.1>nul
goto :html
::=== MENU PRINCIPAL -> CSS ===
:css
cls
echo.
echo - Rubrique pas encore créer, redémarrage du script en cours...
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
