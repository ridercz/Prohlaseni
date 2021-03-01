@ECHO OFF

REM -- Delete output folder
RMDIR /Q /S docs

REM -- Mirror the site
START CMD /C "dotnet run --project src"
tools\wget -P docs -nH --mirror http://localhost:5000/

REM -- Fix files
REN docs\* *.html
REN docs\prohlaseni\* *.html
RMDIR /Q /S docs\Content
XCOPY /S src\wwwroot\Content docs\Content\

REM -- Create CNAME
ECHO prohlaseni.altair.blog > docs/CNAME