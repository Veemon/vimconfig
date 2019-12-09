@echo off
setlocal

set vimrc_path="C:\Program Files (x86)\Vim\_vimrc"
set vimcolor_path="C:\Program Files (x86)\Vim\vimfiles\colors\shanty.vim"

echo | set /p dummy="[1/2] checking vimrc       --  " 
diff ./_vimrc %vimrc_path% > nul
if "%errorlevel%" == "1" (
    echo updated
    cp %vimrc_path% .\_vimrc
)
echo.

echo | set /p dummy="[2/2] checking colorscheme --  " 
diff ./colors/shanty.vim %vimrc_path% > nul
if "%errorlevel%" == "1" (
    echo updated
    cp %vimcolor_path% .\colors\shanty.vim
)
echo.

git status

endlocal
