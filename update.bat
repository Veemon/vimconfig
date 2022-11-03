@echo off
setlocal

set vimrc_path="C:\Program Files (x86)\Vim\_vimrc"
set colorscheme_path="C:\Program Files (x86)\Vim\vimfiles\colors\shantyv2.vim"

echo | set /p dummy="[1/2] checking vimrc       --  " 
diff ./_vimrc %vimrc_path% > nul
if "%errorlevel%" == "1" (
    echo updated
    cp %vimrc_path% .\_vimrc
)
echo.

echo | set /p dummy="[2/2] checking colorscheme --  " 
diff ./colors/shanty.vim %colorscheme_path% > nul
if "%errorlevel%" == "1" (
    echo updated
    cp %colorscheme_path% .\colors\shantyv2.vim
)
echo.

git status

endlocal
