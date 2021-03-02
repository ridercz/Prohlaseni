@ECHO OFF

REM -- Delete output folder
RMDIR /Q /S docs

REM -- Mirror the site
START CMD /C "dotnet run --project src"
tools\wget -T 0 --retry-connrefused -P docs -nH --mirror http://localhost:5000/

REM -- Fix files
REN docs\* *.html
REN docs\prohlaseni\* *.html
REN docs\favicon.html favicon.ico
RMDIR /Q /S docs\Content
XCOPY /S src\wwwroot\Content docs\Content\

REM -- Create CNAME
COPY CNAME docs\CNAME